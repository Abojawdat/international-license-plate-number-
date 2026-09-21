# United Arab Emirates — evidence dossier

**Status: architecturally significant finding, not a normal dossier.** The
UAE is **not a single plate system** — each of the 7 emirates issues its own
design, and the search itself surfaced a rare, useful signal: one source
explicitly called out that most web writing on this topic recycles an
outdated, oversimplified color table that doesn't match how any current
emirate actually works. Treat every other UAE source found elsewhere on the
internet with that warning in mind.

## Sources
- [Vehicle registration plates of the United Arab Emirates — Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Arab_Emirates)
- [Category:License plates of the United Arab Emirates — Wikimedia Commons](https://commons.wikimedia.org/wiki/Category:License_plates_of_the_United_Arab_Emirates)
- [UAE Number Plates Explained — octane.rent](https://octane.rent/blog/uae-number-plates-explained/)
- [UAE Number Plate Colors Explained — licenseplate.ae (2026)](https://www.licenseplate.ae/articles/uae-number-plate-colors-explained-what-blue-green-red-and-the-rest-actually-mean-2026) — this is the source that flagged the outdated-table problem; worth fetching directly and trusting more than the others by default.
- None of the above fetched in full yet — this is search-summary level only.

## What's known
- **No single UAE-wide color/category scheme exists.** Design varies by
  emirate.
- Dubai: white background for private plates; category shown through
  format/letter-prefix rather than background color (e.g. `D 12345`).
- Abu Dhabi: moved away from its old red/blue/grey/green category-color
  system in the 2010s to a numbered-category scheme instead, with a red
  strip carrying a 1-50 category number.
- Implication: at least 7 distinct emirate-level dossiers are needed, not
  one — same shape of problem as the US-states finding already logged in
  `_tracker.md` and `architecture-notes.md`.

## Open questions
1. Whether to model the UAE as 7 separate `CountryPlateSpec`-equivalent
   entries (one per emirate) or one entity with 7 sub-variants — an
   architecture decision, not just a data-gathering one.
2. Per-emirate category/color rules, once the architecture question above is
   settled enough to know what shape the data needs to be in.
3. Fetch `licenseplate.ae`'s 2026 article directly — it's the one source so
   far that read as self-aware about the misinformation problem rather than
   repeating it.
