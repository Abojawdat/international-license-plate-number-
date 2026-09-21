# India — evidence dossier

**Status: first pass.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_India) plus several consumer-finance/insurance blogs (ecozaar.in, smcinsurance.com, piramalfinance.com) that independently agree on the same color scheme.

## What's known
- State-code format (like Iraq's governorate code, Latin-letter-based).
- **BH ("Bharat") series, introduced Aug 2021**: `YY BH #### XX` — a
  registration **not tied to any single state**, for people with
  transferable jobs (defence, central govt, multi-state private employers).
  This is a genuinely new concept vs. every other dossier so far: every
  other country's registration authority is a subdivision (governorate,
  province, emirate); India has a *nationwide-portable* registration class
  that exists specifically to skip that. Worth its own note in
  `architecture-notes.md`.
- Colors: white = private, yellow = commercial, **green = electric**, black
  = self-drive rental, blue = diplomat, red = temporary, red+emblem =
  government.

## Open questions
- No dimensions found yet.
- How BH-series interacts with the geometry/blank model — does it reuse a
  state's physical blank, or have its own?
