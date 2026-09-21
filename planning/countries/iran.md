# Iran — evidence dossier

**First pass.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Iran), [github.com/SamadiPour/IranVehicleNumberPlates](https://github.com/SamadiPour/IranVehicleNumberPlates) (a structured JSON dataset — worth fetching directly, rare for this project so far to find machine-readable source data instead of prose).

- 520×110mm. Format `## X ### - NN`, entirely Persian script.
- Province coding is non-sequential and history-dependent (Tehran started
  at 11, incremented by 11 until 99 then restarted at 10 incrementing by
  10) — a province-code scheme that can't be inferred from a simple
  enum-with-number like Iraq's, needs its own lookup table with real
  historical logic.
- White = standard, yellow = taxi.
