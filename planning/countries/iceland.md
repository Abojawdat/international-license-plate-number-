# Iceland — evidence dossier

**First pass, one major architectural finding.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Iceland).

- 4 concurrent sizes: EU 520×110, NA 305×155, EU-square 280×200,
  motorcycle 240×130 — another multi-size country.
- **Category is encoded by frame/character color while the field stays
  white for most categories** (blue frame = standard/tractor, red frame =
  commercial, green frame = off-highway) — this is a genuinely different
  color-application model from everything built so far. `PlatePalette`'s
  `bandColor`/`fieldColor` split assumes the *field itself* changes color
  per category (as Iraq does); Iceland instead keeps the field white and
  changes the *frame/character* color, which the current palette model
  can't cleanly express. Only diplomatic (green field), oil-vehicles (dark
  yellow field), temporary (red field), and off-road (red field) actually
  change the field.
- 2007: format changed from 2-letter+3-digit to 3-letter+2-digit — another
  capacity-exhaustion case (5th+ country with this reason now).
