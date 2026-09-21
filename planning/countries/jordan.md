# Jordan — evidence dossier

**Status: DRAFT, cross-referenced across 3 independent sources.** Solid enough
to start architecture work against; one real conflict remains (temporary
plate color) and no source gives a full category table plus dimensions in
one place.

## Sources
1. [Vehicle registration plates of Jordan — Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Jordan)
2. [Automatic License Plate Detection and Recognition for Jordanian Vehicles — ASTESJ (academic)](https://www.astesj.com/v05/i06/p84/) — an ALPR research paper, the strongest single source found: gives an exact code-range-to-color table rather than a prose summary.
3. [License Plates of Jordan — worldlicenseplates.com](http://www.worldlicenseplates.com/world/AS_JORD.html) — fetch failed (self-signed cert); not yet incorporated, worth another attempt.
4. Still needed: a real photo and/or the Jordan Public Security Directorate's own page.

## Physical format
- 520 × 110 mm European one-row size is the figure repeated across the
  Jordan-specific sources — **matches `PlateFormat.modernLong`** already in
  this codebase. **New conflict**: Wikipedia's own cross-country comparative
  table (`Vehicle registration plate` main article) lists Jordan separately
  as **430 × 110 mm**, not 520 × 110. Two different Wikipedia pages
  disagreeing with each other is a source-quality problem, not just
  cross-site noise — needs a photo or a third, more careful source read
  before picking one.
- The academic paper independently confirms **two concurrent row layouts are
  real, not just current-vs-legacy**: a "European style" (one row) and an
  "American style" (two rows) both exist. This is the same shape of finding
  as Kuwait's multiple sizes — see `architecture-notes.md` finding #5, now
  upgraded from "flagged, needs verification" to "confirmed by two
  countries independently."
- Current system since 2007, European-spec-derived, UK-plate-like font.
- Format: numeric prefix (vehicle-type code) + separator + 4-5 digits.
  One source described it as letter+digits (`ll-nnnnn`); the academic paper's
  code table is entirely numeric prefixes. **Treat as numeric-prefix,
  not letter-prefix**, until a photo says otherwise — the academic source is
  more rigorous than the summary that suggested letters.

## Categories — merged from Wikipedia + academic paper
| Code | Vehicle type | Color | Confidence |
|---|---|---|---|
| 1-5 | Government | Red | Both sources agree |
| 6 | Aqaba Free Zone | Red | Academic paper only |
| 7 | Diplomatic | Yellow | Both sources agree |
| 8-9 | Temporary entrance | **Yellow (academic) vs. Blue (Wikipedia)** | **Conflict — unresolved** |
| 10-21, 41-42 | Passenger / light goods | White | Both sources agree |
| 44 | Tractors | Red | Academic paper only |
| 46 | Motorcycles | White | Academic paper only |
| 50 | Taxi | Green | Both sources agree |
| 56-59 | Buses / coaches | White (academic) vs. Green (Wikipedia, for buses/coaches specifically) | Minor conflict |
| 71 | Trailer | Yellow | Both sources agree |
| 90, 95, 96, 99 | Army / Ambulance / Gendarmerie / Police | Distinctive, Arabic label | Wikipedia only, unconfirmed |

Background/text otherwise: white background, black text is the norm across
every source for ordinary passenger plates.

## Open questions before building
1. **Resolve the temporary-plate color conflict** (yellow vs. blue) — the
   one clear factual disagreement between the two best sources.
2. Resolve the letter-prefix-vs-numeric-prefix question with a photo — the
   academic paper's code table strongly suggests numeric-only, which would
   mean Jordan's format is architecturally simpler than Iraq's (no series
   letter) if confirmed.
3. Confirm whether "European style" vs "American style" (one row vs two) is
   a free choice, tied to vehicle type, or tied to plate size the way Iraq's
   `modernShort` vs `modernLong` is.
4. Still no real photo. Everything above is text-sourced.
