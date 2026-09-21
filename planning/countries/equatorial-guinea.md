# Equatorial Guinea — evidence dossier

**First pass, one code-collision finding.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Equatorial_Guinea).

- 520×110mm, `AB-123-C`, Spanish-colonial-influenced format. Black/white
  both faces. 7 provincial codes (AN, BN, BS, CS, KN, LT, WN).
- **No official country code exists — the unofficial "GE" in use collides
  with Georgia's real ISO country code.** Worth flagging directly: any
  global country-code registry this SDK eventually needs (for the
  `IdentificationStrip`/band text) can't assume 2-letter codes are unique
  across this dataset — Equatorial Guinea and Georgia both informally read
  as "GE." A real uniqueness constraint to design around, not a data
  cleanup detail.
- Since 2009: ECCAS (Economic Community of Central African States) logo —
  a *different* regional bloc emblem from CEMAC (Republic of Congo/Gabon/
  CAR), confirming Central Africa has more than one shared-bloc-emblem
  convention, not just CEMAC.
