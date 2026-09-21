# Kuwait — evidence dossier

**Status: DRAFT, category list now confirmed real; colors still
single-sourced.** The original Wikipedia pull was flagged as possibly
containing summarizer noise (National Guard, Emiri Bureau, Export entries
looked fabricated). Checking Wikimedia Commons' actual uploaded-photo
categories walked that back: **every one of those categories has real
photographed plates filed under it.** The category list is solid now; the
exact color-per-category table is still only as good as the original
Wikipedia summary.

## Sources
1. [Vehicle registration plates of Kuwait — Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Kuwait) — category/color table, unverified against a second color-level source.
2. [Category:License plates of Kuwait — Wikimedia Commons](https://commons.wikimedia.org/wiki/Category:License_plates_of_Kuwait) — 41 real photographed plates, confirms category list and reveals real format history (see below). This is the strongest evidence so far for this country.
3. [matriculasdelmundo.com/en/kuwait.html](https://matriculasdelmundo.com/en/kuwait.html) — thin, confirms only "European-sized since 2007, black on white" for private plates.
4. licenseplates.tv — a novelty-plate retailer; no category/color data, not useful as a source.
5. Still needed: color-level confirmation (a real photo per category) — the
   category *names* are no longer in question, the *colors* still are.

## Physical format
- Standard: 335 × 155 mm (matches `PlateFormat.modernShort`).
- Euro-sized: 520 × 110 mm (matches `PlateFormat.modernLong`), plus a
  520 × 85 mm variant — still only single-sourced (Wikipedia), not yet seen
  confirmed elsewhere.
- Motorcycle: 155 × 155 mm **square** — still unconfirmed by a second
  source, but Commons independently confirms motorcycle plates form their
  own historical lineage (1990s and 2010s motorcycle plates both
  photographed), which is at least consistent with motorcycles being a
  distinct blank rather than a scaled-down car plate.
- **Format history is real and deeper than expected**: Commons has plates
  filed as "1970s passenger," "1980s passenger," "1990s motorcycle," "2010s
  motorcycle," and "2024 construction/export." That's at least 3-4 historical
  eras for passenger plates alone, vs. Iraq's 2 (current + legacy). The
  format-history model (`architecture-notes.md`) needs to support more than
  a binary current/legacy split for at least this country.
- Current system since 2008 (or 2007 per matriculasdelmundo — minor
  discrepancy, low stakes).

## Categories — now confirmed to exist (Commons), colors still Wikipedia-only
| Category | Colors (Wikipedia, unconfirmed) | Existence confirmed? |
|---|---|---|
| Private | Black on white | Yes (Commons) |
| Public transport / Taxi / Bus | Black on yellow | Yes (Commons) |
| Police | White on black | Yes (Commons) |
| Government | Black on blue | Yes (Commons) |
| Diplomatic | Blue on white, red band | Yes (Commons) |
| Commercial | Black on pink | Yes (Commons, filed as "Public/Commercial") |
| Temporary customs | Black on purple | Yes (Commons) |
| Construction | Black on orange | Yes (Commons) |
| National Guard | Yellow on green | Yes (Commons) — walked back the earlier "looks fabricated" flag |
| Emiri Guard/Bureau | White on blue | Yes (Commons) |
| Export | Black on green | Yes (Commons, 2024-era) |
| Army/Military | Not in original table | Yes (Commons) — a category the original Wikipedia pull missed entirely |
| Firefighting | Black on red | Not independently seen yet |

## Open questions before building
1. Colors per category still need a photo-level check even though the
   categories themselves are now solid — 12+ categories is a lot to get
   subtly wrong from a text table alone.
2. Confirm the square 155×155 motorcycle blank specifically (still
   single-sourced).
3. Work out how many distinct historical formats actually need modeling —
   "1970s/1980s/1990s passenger" suggests Kuwait alone could need 3+ legacy
   formats, which is a bigger ask of the format-history abstraction than
   Iraq or Jordan require.
4. Confirm digit script (Eastern-Arabic vs Western vs mixed).
