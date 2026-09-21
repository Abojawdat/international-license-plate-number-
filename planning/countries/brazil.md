# Brazil — evidence dossier

**Status: first pass, architecturally important.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Brazil) plus Mercosul-specific explainer sites.

## What's known
- **The current "Mercosul" plate is a shared regional standard**, not a
  Brazil-only design — same base blank/layout used by Argentina, Uruguay,
  and Paraguay too (per `_tracker.md`'s pattern-table entry: "Mercosur
  nations: 400×130mm, based on the 1990 Brazilian standard"). First
  confirmed case of **one blank shared across multiple country modules** —
  the registry design should allow a `PlateBlank` to be reused/referenced by
  several countries rather than forcing a full duplicate definition each
  time.
- Dimensions: 400×130mm.
- White background, black text/frame, blue top band with country name/flag/
  Mercosul logo (yellow logo mark) — an `IdentificationStrip`-shaped region
  again, closer to Iraq's `ColorBandStrip` than Saudi's `EmblemStrip`.
- Format: `LLL#L##` (3 letters, 1 digit, 1 letter, 2 digits) — alternating
  letter/digit groups, a pattern not seen elsewhere yet.
- Rolled out state-by-state starting Rio de Janeiro Sept 2018, nationwide by
  Jan 2020 — the *old* pre-Mercosul Brazilian plates are the legacy format.

## Open questions
- Confirm whether Argentina/Uruguay/Paraguay use the *exact* same blank or
  just the same dimensions with local variation — determines whether they
  can literally share one `PlateBlank` instance or just the same numbers.
- Old (pre-2018) Brazilian format details, for the legacy-format entry.
