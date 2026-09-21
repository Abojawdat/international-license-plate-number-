# Saudi Arabia — evidence dossier

**Status: DRAFT, dimensions now confirmed; category-color scheme has a real,
unresolved conflict between two source clusters — not just a confidence gap.**

## Sources
1. [Vehicle registration plates of Saudi Arabia — Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Saudi_Arabia)
2. [matriculasdelmundo.com/en/saudi-arabia.html](https://matriculasdelmundo.com/en/saudi-arabia.html) — same trusted domain already cited in this package's own README for Iraq; gives both current and 1996-2007 previous-system dimensions.
3. [Category:License plates of Saudi Arabia — Wikimedia Commons](https://commons.wikimedia.org/wiki/Category:License_plates_of_Saudi_Arabia) — real photographed plates, filenames literally encode dimensions and category.
4. [ksaplate.com category-color guide](https://ksaplate.com/blog/saudi-license-plate-types-colors-complete-guide) — **conflicts with sources 1-3**, see below. Reads as SEO/content-mill material (a car-services blog, not a reference or enthusiast site); weighted lower than 1-3 accordingly.
5. Still needed: an actual photo, specifically to resolve the color conflict below.

## Physical format — now well confirmed
- EU size: **550 × 110 mm**, confirmed directly from real Commons filenames
  ("Saudi Arabia KSA - License Plate - Taxi - 550x110mm.png" etc.) — this
  resolves the earlier open question about 550 vs. 520; it is **not** Iraq's
  520×110 `modernLong`, it's a distinct geometry.
- US/standard size: Wikipedia says 335×155; matriculasdelmundo says 305×153
  (current) and 315×155 (1996-2007 previous system). These are close but not
  identical — likely rounding/measurement variance between sources rather
  than a real design difference, but not resolved.
- Bilingual, always-dual-script layout confirmed by multiple sources: Arabic
  primary, Latin transliteration secondary, both permanently on the plate —
  this is the `ScriptLayout.dualScriptAlwaysShown` case in
  `plate_blank.dart`, now on firmer footing.
- A center/positioned vertical strip carries the Saudi emblem + "KSA" +
  السعودية + a category symbol — confirmed by every source. This is the
  `EmblemStrip` case in `plate_blank.dart`.
- Current format: up to 3 Arabic letters (17 of 28 permitted) + up to 4
  digits, zero-padded. Previous system (1996-2007): 3 numbers + 3 letters,
  no transliteration.

## Categories — real conflict, not just a confidence gap
Sources 1-3 (Wikipedia, matriculasdelmundo, and the Commons filenames, which
independently confirm Taxi/Private/Commercial/Diplomatic/Temporary/Export as
real photographed categories) roughly agree on:

| Category | Strip color | Shape |
|---|---|---|
| Private | White field / circle | Circle |
| Taxi / public transport | Yellow | Triangle up |
| Commercial / trucks | Blue | Triangle down |
| Temporary | Silver/gray | Triangle left |
| Diplomatic | Green | none |
| Export | (gray/brown, per source 2) | — |

Source 4 (ksaplate.com) gives an **incompatible mapping** — diplomatic as
*blue*, not green; a separate "light blue" category for public transport
distinct from yellow taxis; temporary as *green*, not silver; and adds
brown-export/black-motorcycle categories not mentioned elsewhere. It also
describes the script layout as **side-by-side** (Arabic right, Latin left)
rather than **stacked** (Arabic top row, Latin bottom row) as sources 1-3
describe.

**This is a genuine source conflict, not a gap** — two clusters of
independently-plausible sources disagree on category colors and even the
basic layout geometry (stacked vs. side-by-side). Do not average or guess
between them. Resolve with an actual photo before writing any Saudi
`PlateBlank`/palette code — a wrong layout direction is a bigger rebuild than
a wrong color.

## Open questions before building
1. **Resolve stacked-vs-side-by-side script layout** — this is the highest-
   priority open question in this dossier, it affects the geometry model,
   not just palette values.
2. Resolve the diplomatic/temporary/public-transport color conflict between
   source cluster 1-3 and source 4.
3. Confirm which US-size figure is right: 335×155, 305×153, or 315×155.
4. Confirm the emblem/seal graphic requirement in enough detail to decide
   whether v1 ships a simplified strip (color + text only) instead of
   reproducing official seal artwork — independent of the licensing
   decision already made elsewhere in `planning/`.
