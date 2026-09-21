# Flutter / frontend role

Scope: the SDK itself — everything a buyer imports. Status markers reflect
what's actually done as of this writing, not the original plan.

## Architecture generalization

1. [~] Generalize `_PlateSpec` into a country-agnostic blank abstraction.
   **In progress** — first cut drafted at `lib/src/core/plate_blank.dart`
   (`PlateBlank`, `IdentificationStrip`, `CategoryEncoding`, `ScriptLayout`),
   shaped by the Jordan/Kuwait/Saudi dossiers, not wired into anything yet.
2. [ ] Split the painter into geometry / material-style / typography layers.
   Blocked on a confirmed non-Iraq stamped-vs-printed data point (see
   `architecture-notes.md`) before the material-style half is worth building.
3. [ ] Build the plugin/registry mechanism so a new country is a new module,
   not an edit to `_PlateSpec.of()`'s `switch`.
4. [ ] Generalize the format-history model (current + N legacy formats per
   country, each with its own parser/validator).
5. [ ] Generalize `tryParse`/`validationError` into a pluggable per-country
   parser, keeping the never-throws / human-readable-error contract.
6. [ ] Make the security-print/watermark layer optional-per-country instead
   of hardcoded Iraq assets.
7. [ ] Handle non-Arabic-Indic digit/script conversion as new countries need
   it (Saudi's dual-script-always case is the first known one).

## Migration

8. [ ] Port Iraq into the new architecture as the reference implementation.
   Not started — deliberately held until the blank/strip abstraction has
   more than one confirmed non-Iraq data point, so Iraq isn't ported twice.
9. [ ] Regression-check every existing public API stays working — real
   pub.dev users depend on `IraqiPlate`/`IraqiLicensePlate` today.

## QA & demo

10. [ ] Per-country golden-image tests.
11. [ ] Demo/gallery app update (successor to `PlateGalleryScreen`) once a
    second country actually renders.
12. [ ] Docs + versioning strategy (semver, changelog per country added).

## What's blocking the next batch of work

Real photos for Jordan, Kuwait, Saudi Arabia (see each country's dossier in
`planning/countries/`). Everything above marked `[ ]` either depends on the
blank abstraction settling further, or on data this codebase doesn't have
evidence for yet.
