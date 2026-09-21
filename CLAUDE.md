
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

`iraqi_license_plate` — a Flutter package that draws photoreal Iraqi vehicle
registration plates entirely with a `CustomPainter`. No images, no bundled
fonts, no network, no plugins, no dependencies beyond Flutter itself. It ships
both faces of a plate (front, and the stamped-through concave bare-metal
reverse), a 3D interactive viewer, and a data model for the governorate/
category/series-letter scheme Iraq actually uses.

Package name on pub.dev: `iraqi_license_plate`. Repo name/directory differs
("international license plate" / `plate-number-service`) — don't assume they
match.

**Planned direction:** this is slated to be refactored into a new, broader
package covering multiple countries' plates, with Iraq becoming one supported
country/format rather than the whole package. No target architecture or name
has been decided yet — everything below describes the current Iraq-only
codebase, not the future shape.

## Commands

```sh
flutter pub get       # after cloning or changing pubspec.yaml
flutter test          # unit suite — fast, no rendering (test/ only)
flutter analyze --fatal-infos
dart format .         # required; CI runs --set-exit-if-changed
```

Run a single test file: `flutter test test/iraqi_plate_test.dart`.

Regenerating the README/pub.dev images (each spawns its own `flutter test`
process — see "Image generation" below):

```sh
./tool/render_all.sh        # stills → render/*.png
./tool/render_spin.sh       # spin gif → render/06_spin.gif
python3 tool/render_art.py  # README diagrams → art/*.svg (no deps)
```

## Architecture

**Everything is millimetres, not pixels.** `_PlateSpec` (private, in
`lib/src/iraqi_license_plate.dart`) holds each blank's real dimensions —
335×155 (car), 520×110 (European), 200×125 (motorcycle), 335×155 Arabic
(legacy). `_PlatePainter` draws entirely in that mm space and the widget
scales the canvas to the requested `width` at paint time. This is why the
widget must be sized by `width` only — never wrap it in a fixed-height box —
and why it looks correct at any size instead of just the one it was tuned at.

**Stamped relief, not a flat fill + shadow.** `_emboss` / `_embossText` draw
each character path four times at sub-millimetre offsets: cast shadow,
extruded wall away from the light, lit edge, then the painted face with a
slight vertical grade. On `PlateFace.back` every offset sign flips and the lit
corner swaps, turning a raised character into a recessed one — this is how one
painter produces both faces from the same glyph data.

**The typeface is vector, not a font.** `PlateTypeface` (`plate_typeface.dart`)
holds `0-9`/`A-Z` as centre-line skeletons stroked at a fixed weight, measured
off a real Baghdad plate photo (kept as `IraqiPlate.reference`). Only the
`legacy` blank's Arabic text and the flag's takbir go through `TextPainter`
and need a platform font with Arabic coverage — everything else needs nothing
bundled.

**Palette resolution order**, mirrored in both the widget and the theme:
widget's own `palette` → `IraqiPlateTheme` above it → `PlateCategory.
defaultPalette` (the real issued colours). `PlatePalette.isDarkField` flips
the emboss lighting automatically for dark plates (e.g. `security`,
`defence`).

**Data model is pure and separate from rendering** (`iraqi_plate.dart`):
`IraqiPlate` (governorate + letter + serial + category + format),
`IraqGovernorate` (19-value enum, code 11-29, carries `PlateRegion` —
Kurdistan Region governorates auto-switch the band text to `KR`),
`PlateCategory` (8 values, each owning its authentic `defaultPalette`),
`PlateSeries` (17 legacy Arabic↔Latin letter mappings). `IraqiPlate.tryParse`
never throws — malformed input returns `null`; `validationError` returns a
human string instead of throwing, so both drop straight into UI (list
fallback, form validator) without try/catch at the call site.

**`PlateStyle`/`IraqiPlateStyles`** (`plate_style.dart`) wrap format+palette+id
as an ordinary value (not an enum) specifically so callers can persist an id,
subset the catalogue, or add their own styles — don't turn this back into an
enum.

**`PlateViewer3D`** is a separate stateful widget with its own gesture/physics
layer (drag, flick with friction, double-tap flip, long-press to re-square);
it reuses `_PlatePainter` for both faces rather than duplicating rendering
logic. It claims vertical drag gestures, so it must not be placed inside a
scrollable.

**`PlateGalleryScreen`** is a demo/explorer built from ordinary Material
widgets over the public API — treat it as a consumer of the package, not part
of its internals. `example/` is nothing but this screen.

## Image generation (`tool/`)

`tool/` is deliberately outside `test/`: its scripts write files rather than
assert anything, so `flutter test` (and CI) never touches them. Each render
runs as its own `flutter test` process launched by the `.sh` wrapper because a
test process wedges on its second call to `RenderRepaintBoundary.toImage` —
one frame per process is intentional, not an oversight to "fix" by batching.
`PLATE_RENDER_FONT` overrides the auto-detected system Arabic font;
`PLATE_RENDER_SCALE=2` raises still resolution. The GIF is assembled by
`tool/assemble_gif.dart` in pure Dart (no ffmpeg, no added dependency). The
SVG diagrams in `art/` are the one output not produced by the widget itself —
`tool/render_art.py` deliberately reuses `PlateTypeface`'s metrics and
`_PlateSpec`'s millimetre space so they can't silently drift from what the
painter actually draws.

## Branching and releases

- `dev` — where work happens; CI (`analyse` + `pana` jobs) runs on every push
  and PR. Open PRs against `dev`.
- `main` — released code only, receives merges from `dev` and nothing else. A
  merge into `main` does *not* publish; publishing is a separate, deliberate
  tag push:
  ```sh
  git checkout main && git merge dev
  git tag v0.1.0 && git push origin main --tags
  ```
  CI's publish workflow refuses to publish if the tag doesn't match
  `version:` in `pubspec.yaml`.
- CI's publishability check does `git checkout -- .` before `dart pub publish
  --dry-run` — the Flutter SDK setup step rewrites `analysis_options.yaml`
  during the run, which would otherwise make `pub` see a dirty tree and fail
  with exit 65 for a reason unrelated to the package.
