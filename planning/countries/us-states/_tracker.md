# United States — sub-tracker

**Status: first pass, all 50 states + DC + 5 territories, single source
(2 targeted fetches of the same Wikipedia comparative article).** This
replaces trying to fit the US into one Iraq-shaped dossier — confirmed in
`architecture-notes.md` finding #8, the US needs to be modeled as a
`FederatedCountry` of 56 jurisdictions, each with its own blank/palette/
validator, not one country entry.

## Source
[United States license plate designs and serial formats — Wikipedia](https://en.wikipedia.org/wiki/United_States_license_plate_designs_and_serial_formats) —
both the serial-format table and the color/slogan table came from this one
article. Cross-referencing against a second source (and photos) hasn't been
done yet — treat this table the same as any other "first pass" country
dossier, not as verified.

## Baseline (applies to all 56 unless noted)
- 6×12in (152×300mm), standardized nationally in 1956 alongside Canada —
  the literal same agreement, so the US/Canada blank is very likely another
  shared-standard case like Mercosur, not just a coincidence of size.
- Each jurisdiction issues its own plates independently through its own DMV
  — no federal design authority. The federal government only plates its own
  vehicles and diplomats.
- I, O, Q are the most commonly excluded letters (visual-confusion reason,
  same category as Saudi/Russia/Egypt/Poland/etc.) — but the exact excluded
  set varies per state, sometimes going further (Texas excludes A, E, I, O,
  Q, U; Vermont excludes I, J, O, Q, U and *temporarily* skipped V, Z until
  2024 — a capacity-driven, not visual-confusion, exclusion layered on top).

## Full table

| Jurisdiction | Serial format | Background | Text | Slogan | Notes |
|---|---|---|---|---|---|
| Alabama | `0AXXXXX` / `00AXXXX` | Bay/sky graphic | — | "Heart of Dixie" | County-coded |
| Alaska | `ABC 123` | Gold | Blue | "The Last Frontier" | State flag graphic |
| Arizona | `XXX 1XX` (2021+) | Desert landscape | Dark green | "Grand Canyon State" (since 1940) | I/O/Q/U excluded |
| Arkansas | `ABC 12D` (2021+) | Diamond bg | Black | "The Natural State" | O/Q skipped |
| California | `123ABC1` (2026+) | White | Dark blue/red | dmv.ca.gov | I/O/Q only as 2nd letter |
| Colorado | `ABC-D12` (2018+) | Rocky Mountains scene | Dark green | — | Q skipped until 2013 |
| Connecticut | `AB•12345` (2015+) | Blue/white gradient | Dark blue | "Constitution State" | I/O/Q excluded |
| Delaware | `123456` | Navy blue | Gold | "The First State" | Random issuance; unchanged since 1960s |
| District of Columbia | `AB-1234` | White | Blue | "End Taxation without Representation" | Red flag separator |
| Florida | `ABC D12` | White | Green | "Sunshine State" | State map, citrus |
| Georgia | `ABC1234` | White, peach graphic | Black | "Peach State" | O excluded |
| Hawaii | `ABC 123` | White | Black | "Aloha State" | County-coded; rainbow graphic |
| Idaho | `A 1234U` (multiple) | Mountain scene | Black | "Famous Potatoes" + "Scenic Idaho" | County-coded |
| Illinois | `AB 12345` (2017+) | Blue-to-white gradient | Black | "Land of Lincoln" | Skyline + Lincoln graphic |
| Indiana | `123A`/`123AB`/`123ABC` | Country scene | Dark blue | — | Optional "In God We Trust" format |
| Iowa | `ABC 123` | Scenic landscape | Black | — | Slashed zero since 2012 |
| Kansas | `1234ABC` | Light blue/white/gold gradient | Black | "To The Stars" | I/O/Q excluded |
| Kentucky | `A1B234` / `ABC123` | Light blue gradient | Dark blue | — | County-name sticker |
| Louisiana | `123 ABC` | White | Blue | "Sportsman's Paradise" | — |
| Maine | `123•ABC` | White | Blue | "Vacationland" (since 1936) | Pine tree, north star |
| Maryland | `1AB2345` | White | Black | "Maryland Proud" | E/F added 2023 |
| Massachusetts | `1ABC 23` | White | Red | "The Spirit of America" | Month-of-expiration coded |
| Michigan | `ABC 1234` | White | Blue | "Pure Michigan" | Blue wave |
| Minnesota | `123-ABC`/`ABC-123` | White | Black | "Explore Minnesota, 10,000 Lakes" | Lake scene |
| Mississippi | `ABC 123` | White | Dark blue | — | County-coded; 666 excluded (only cultural-taboo digit exclusion found in the US set) |
| Missouri | `AB1 C2D` | White | Dark blue | "Show Me State" | Month-coded |
| Montana | `0-AB1234` | Blue | White | "Treasure State" | County-coded; R/V also excluded, beyond the usual I/O/Q |
| Nebraska | `0-A1234` (variable) | White | Dark blue | — | County-coded except 3 largest counties |
| Nevada | `432·1A5` etc. | Sky blue | Black | "Home Means Nevada" | Mountain range |
| New Hampshire | `123 4567` (2000+) | Old Man of the Mountain graphic | Green | "Live Free or Die" | — |
| New Jersey | `D12-ABC` (2010+) | Yellow gradient | Black | "Garden State" | T/X reserved for trailers/commercial |
| New Mexico | `123-ABC` | Yellow | Red | "Land of Enchantment" | Zia sun symbol |
| New York | `ABC-1234` | White | Dark blue | "Excelsior" | Multiple landmark graphics |
| North Carolina | `ABC-1234` (since 1980s) | White | Blue | "First in Flight" (1982) | Wright Flyer graphic; G excluded too |
| North Dakota | `123 ABC` | Light blue gradient/sunrise | Black | "Legendary North Dakota" / "Peace Garden State" | Buffalo, prairie |
| Ohio | `ABC 1234` | Sunrise scene | Dark blue | "Birthplace of Aviation" | I/O only as 2nd letter |
| Oklahoma | `ABC-123` | Red | White | "Imagine That" | — |
| Oregon | `123 ABC` (2004+) | Douglas Fir/mountain graphic | Dark blue | — | I/O excluded as 1st letter only |
| Pennsylvania | `ABC1234` | White | Blue | "Let Freedom Ring" | Liberty Bell; A/E excluded as 2nd letter |
| Rhode Island | `1AB 234` | Light blue | Navy blue | "Ocean State" | Wave graphic, anchor |
| South Carolina | `123ABC` | White | Black | "Where The Revolutionary War Was Won" | O excluded only since 2023 |
| South Dakota | `0A1 234` etc. | Mount Rushmore graphic | Blue | "Great Faces. Great Places." | County-coded |
| Tennessee | `ABC 1234` | Blue | — | "The Volunteer State" | **All vowels excluded** — the most aggressive exclusion set found anywhere in this whole tracker |
| Texas | `ABC-1234` | White | Black | "The Lone Star State" | A/E/I/O/Q/U excluded |
| Utah | `A12 3BC` | Skier/Delicate Arch graphic | Dark blue | "Life Elevated" / "Greatest Snow on Earth" | — |
| Vermont | `ABC 123` (1990+) | Green | White | "Green Mountain State" | Only state confirmed using **debossed** (recessed) characters instead of embossed — opposite relief direction from Iraq's raised-character model |
| Virginia | `ABC-1234` | White | Blue | "Virginia is for Lovers" | — |
| Washington | `ABC1234` (2010+) | White | Dark blue | "Evergreen State" | Mount Rainier |
| West Virginia | `X1A 2345` | White | Blue | "Wild, Wonderful" | Month-of-expiration coded |
| Wisconsin | `ABC-1234` (2017+) | White | Black | "America's Dairyland" | — |
| Wyoming | `1A-123A` etc. | Navy/gray state-flag graphic | White | "That's WY" | Bucking Horse and Rider; county- and vehicle-type-coded |

## Territories

| Jurisdiction | Serial format | Background | Notes |
|---|---|---|---|
| American Samoa | `1234` | Fatu Rock graphic | "Motu O Fiafiaga" slogan |
| Guam | `AB 1234` | White | Municipality-coded; latte stone + bougainvillea |
| Northern Mariana Islands | `ABC 123` | White | "Hafa Adai" |
| Puerto Rico | `ABC 123` | White | "Isla del Encanto"; fort graphic |
| U.S. Virgin Islands | `ABC 123` (St. John distinct) | White | Island-coded; "175th Emancipation" |

## What this confirms/adds to the architecture notes

1. **US/Canada share the literal 1956 dimension agreement** — a second
   confirmed shared-regional-standard case (after Mercosur), and it predates
   Mercosur by decades.
2. **Illustrated/pictorial backgrounds are the US norm, not an outlier.**
   Roughly two-thirds of states use a scenic photo/graphic background
   (mountains, skylines, wildlife, landmarks) rather than a flat or gradient
   field — Eswatini's pictorial background isn't a one-off after all, it's
   just the first *non-US* country found doing it. This changes finding #35
   from "one outlier" to "a whole design tradition this project hasn't
   modeled yet, and the US alone would require it for most of its 50
   states."
3. **Tennessee excludes every vowel** — the single most aggressive character
   restriction found across all ~170 jurisdictions researched so far (states
   and countries combined).
4. **Vermont debosses instead of embosses** — the only confirmed case of
   recessed (not raised) standard characters, the opposite relief direction
   from every material-style assumption in `_PlatePainter`'s `_emboss`.
5. **Slogans are near-universal at the US state level** (~40 of 50 have one)
   — reinforces that fixed decorative text (already seen in Australia,
   Honduras, Haiti, Antigua) needs to be a first-class, expected field, not
   an edge case.
