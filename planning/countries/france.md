# France — evidence dossier

**First pass.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_France), [eplaque.fr](https://www.eplaque.fr/en/france-car-plate-number).

- Format `XX-NNN-ZZ` since 2009. 520×110mm or 275×200mm (2 legal sizes);
  motorbikes 210×130mm.
- Left blue band: EU stars + "F". **Right side: department number +
  regional logo — explicitly described as "purely cosmetic," not tied to
  where the owner actually lives.** A new case: a region-looking field that
  is *not* load-bearing for validation/registration logic, unlike every
  other country's region code so far (all of which are functionally tied to
  where the vehicle is registered). Worth not over-fitting a "region code
  must mean something" assumption into the validator model.
- Colors: white=standard, green=diplomatic (CD/CMD), black=classic cars,
  blue=military — 4 special-purpose colors beyond the base scheme.
