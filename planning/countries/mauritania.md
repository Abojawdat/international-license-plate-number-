# Mauritania — evidence dossier

**First pass, one major architectural finding.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Mauritania).

- 520×110mm, digits+letters+digits. Blue/white standard, red temporary.
- **Since 2017: Arabic lettering became optional alongside Latin, with an
  official 2023 letter-pairing list, and the plate layout *flips to
  Arabic reading order* when Arabic is used** — a real, confirmed
  right-to-left layout requirement. This directly challenges an assumption
  stated in this package's own README: "the widget pins itself to
  `TextDirection.ltr` internally... never mirrored, even in an RTL app."
  That rule was written for Iraq, where the registration itself is always
  LTR even in an RTL-language app shell. Mauritania is different: the
  *plate's own content layout* is meant to flip depending on script
  choice. This is real evidence that RTL support needs to be a genuine
  per-country layout capability eventually, not a permanently-settled
  "never" rule inherited from Iraq's specific case.
- Regional 2-digit codes 00-12 (00 = Nouakchott, the capital).
