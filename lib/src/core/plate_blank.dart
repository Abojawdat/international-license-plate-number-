/// Draft, unwired abstractions for the multi-country refactor.
///
/// Nothing in `lib/src/core/` is imported by the public Iraq-only API yet
/// (`iraqi_license_plate.dart`) — this is scaffolding for the next phase, not
/// a breaking change to the shipped package. See `planning/architecture-notes.md`
/// for the evidence (Jordan/Kuwait/Saudi dossiers) each shape below is
/// answering.
library;

/// The physical blank a plate is stamped, printed or stickered onto, in
/// millimetres. Generalizes Iraq's private `_PlateSpec`.
///
/// Deliberately does **not** assume a band+flag+country-text layout the way
/// `_PlateSpec` does — Saudi Arabia's emblem/seal strip and a plain
/// no-strip blank are both real, so that layout is factored out into
/// [IdentificationStrip] instead of being baked into the blank itself.
class PlateBlank {
  const PlateBlank({
    required this.widthMm,
    required this.heightMm,
    required this.cornerRadius,
    required this.frameInset,
    required this.frameStroke,
    required this.bolts,
    required this.boltRadius,
    this.strip,
  });

  final double widthMm;
  final double heightMm;
  final double cornerRadius;

  /// Inset of the raised frame line from the plate edge. Zero for a printed
  /// sticker-style plate with no raised border.
  final double frameInset;
  final double frameStroke;

  /// Rivet/bolt positions in mm from the top-left. Empty for blanks that
  /// mount without visible fasteners.
  final List<PlatePoint> bolts;
  final double boltRadius;

  /// `null` for a blank with no side band or emblem region at all — plain
  /// single-field plates exist and shouldn't be forced through a strip model.
  final IdentificationStrip? strip;

  double get aspect => widthMm / heightMm;

  /// True for a non-rectangular-in-the-usual-sense blank, e.g. Kuwait's
  /// reported 155×155 square motorcycle plate. Callers that assume "wider
  /// than tall" (as Iraq's current widget sizing does) need to check this.
  bool get isSquare => widthMm == heightMm;
}

class PlatePoint {
  const PlatePoint(this.x, this.y);
  final double x;
  final double y;
}

/// The region of a plate that identifies the country/authority, distinct from
/// the registration itself. Three real shapes found across four countries so
/// far — deliberately not left open-ended beyond that:
///
/// - [ColorBandStrip]: Iraq's `IRQ`/`KR` band — a plain-colored strip with
///   country-code text and a flag graphic.
/// - [EmblemStrip]: Saudi Arabia's strip carrying an emblem/seal graphic and
///   "KSA" text rather than a flag, positioned right (US-size) or center
///   (EU-size) rather than fixed to one edge.
/// - [NoStrip] is expressed by leaving [PlateBlank.strip] `null`, not as a
///   third subtype, since "no strip" carries no data to model.
sealed class IdentificationStrip {
  const IdentificationStrip();
}

class ColorBandStrip extends IdentificationStrip {
  const ColorBandStrip({required this.edge, required this.widthMm});
  final PlateEdge edge;
  final double widthMm;
}

class EmblemStrip extends IdentificationStrip {
  const EmblemStrip({required this.position, required this.widthMm});
  final StripPosition position;
  final double widthMm;
}

enum PlateEdge { left, right, top, bottom }

enum StripPosition { left, right, center }

/// How a category (taxi, government, commercial, ...) is visually encoded.
/// Iraq and Jordan are color-only; Saudi Arabia adds a shape per category
/// (circle/triangle-direction) on top of color. Modeled as a flag rather than
/// a variant type because a country could plausibly use both independently.
class CategoryEncoding {
  const CategoryEncoding({required this.usesColor, required this.usesShape});
  final bool usesColor;
  final bool usesShape;
}

/// How script(s) appear on the registration itself.
///
/// Iraq's *current* format is Latin-only and its *legacy* format is
/// Arabic-only — different formats, single script each. Saudi Arabia's
/// current format shows Arabic as primary and a Latin transliteration as
/// secondary on the *same* plate, always. That's a different axis from
/// "which format is this," so it's modeled per-format here rather than
/// reusing Iraq's format-vs-legacy split.
enum ScriptLayout {
  /// One script only (Iraq current, Iraq legacy, Jordan).
  single,

  /// Primary script plus a secondary transliteration, always shown together
  /// (Saudi Arabia). Relative arrangement (stacked vs. side-by-side) is not
  /// modeled yet — open question in `saudi-arabia.md`, needs a photo.
  dualScriptAlwaysShown,
}
