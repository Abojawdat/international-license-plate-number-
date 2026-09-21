# Cuba — evidence dossier

**First pass, one major architectural finding.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Cuba), [Deseret News feature](https://www.deseret.com/2010/2/10/20095542/in-cuba-license-plates-tag-drivers-not-the-car/) — the headline finding comes directly from this piece's title.

- **Cuban plates are reported to identify the driver, not the vehicle** —
  a fundamentally different registration model from every other dossier so
  far, all of which assume a plate is bound to a vehicle. If accurate, this
  breaks an unstated assumption baked into `IraqiPlate` and every other
  country module drafted so far (`plate.vehicle` implicitly, not
  `plate.person`). Needs verification before deciding whether this is a
  real architectural case to support or a simplification/misreading in the
  source — but flagging now since it's exactly the kind of assumption worth
  catching early rather than after 50 country modules are built on top of
  "plate belongs to a car."
- Current (since May 2013): `A 123 456` (letter + 6 digits), 420×110mm.
  White/black; legal entities get a blue "CUBA" euroband (like Iraq's own
  band, functionally) distinguishing them from natural persons.
- Previous (2002-2013): color-coded — yellow=private, red=tourist rental,
  green=government (Ministry of Interior).
