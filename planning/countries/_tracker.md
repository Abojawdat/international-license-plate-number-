# Country tracker — global scope

Master list of every country/territory Wikipedia tracks a distinct
"Vehicle registration plates of X" article for (~230 entries, pulled from
[Category:Vehicle registration plates by country](https://en.wikipedia.org/wiki/Category:Vehicle_registration_plates_by_country)),
plus a few known gaps to double-check (Sierra Leone and Transnistria didn't
surface in the category fetch and should be checked directly).

**This tracker replaces the earlier "3-country launch batch" framing** — the
scope is now the whole world, done in prioritized batches, not a fixed
launch set. Status levels, from least to most work done:

- `not started` — on the list, nothing done
- `pattern only` — covered only by the bulk comparative-dimension table on
  Wikipedia's main `Vehicle registration plate` article (a bucket like
  "Europe: 520×110 or 520×120"), not verified per-country
- `first pass` — 1-2 targeted source fetches, real citations, gaps flagged
  rather than guessed
- `second pass` — a first-pass dossier flagged as missing a category/color
  table got a targeted re-search specifically for that gap. Outcome is
  either the gap closes (real data found) or gets confirmed genuinely
  unavailable by search (not just under-searched) — both are recorded, see
  `architecture-notes.md` finding #49 for how this cleanup pass works and
  why it's worth repeating across the rest of the first-pass dossiers.
- `cross-referenced` — dedicated dossier exists in `planning/countries/`,
  checked against 2+ independent sources, conflicts recorded if found
- `photo-verified` — cross-referenced *and* confirmed against a real photo
- `shipped` — implemented in the actual package

Historical/defunct jurisdictions (German Democratic Republic, Soviet Union,
Canal Zone) and clearly disputed/breakaway territories are listed but
deprioritized by default for a commercial SDK — flagged inline, not deleted,
in case a buyer specifically needs one.

## Middle East / North Africa — where work has actually started

| Country | Status | Notes |
|---|---|---|
| Iraq | **shipped** | The existing published package. |
| Jordan | **cross-referenced** | See `jordan.md` — has an unresolved dimension conflict between two Wikipedia pages (520×110 vs 430×110). |
| Kuwait | **cross-referenced** | See `kuwait.md` — category list confirmed real via Commons photos; colors still single-sourced. |
| Saudi Arabia | **cross-referenced** | See `saudi-arabia.md` — real conflict between source clusters on category colors and script layout direction. |
| Bahrain | first pass | See `bahrain.md` — thin, an official `mtt.gov.bh` source exists but isn't fetched yet. |
| Qatar | first pass | See `qatar.md` — a wide/heavy-vehicle second size, and an unresolved two-different-government-plate-descriptions conflict. |
| United Arab Emirates | **not a single system** | See `uae.md` — 7 emirates, each with its own scheme; most web sources found are flagged (by another source) as recycling an outdated table. Needs its own 7-entry sub-tracker, same shape as the US/Canada problem. |
| Oman | first pass | See `oman.md` — yellow private plates, an outlier against every other GCC country gathered (all white); needs a recheck. |
| Lebanon | first pass | See `lebanon.md` — governorate-letter format close in spirit to Iraq's; a granular government-official sub-scheme (judges, MPs, clergy) with no equivalent seen elsewhere yet. |
| Syria | first pass | See `syria.md` — has its own real dimension conflict (440×300 vs. the pattern table's 450×100), likely a scrape error on one side; also a live political-stability caveat on whether "current system" is still current. |
| Egypt | first pass | See `egypt.md` — governorate-dependent digit/letter counts within one country's current format, a new case; top-color-bar layout (3rd distinct identification-region shape after Iraq's band and Saudi's center strip). |
| Israel | first pass | See `israel.md` — 520×110, black-on-yellow both faces, dual-script Hebrew/Arabic band. Politically entangled with Palestine's plates — flag for sensitivity conversation. |
| Palestine | first pass | See `palestine.md` — green/white, distinct from Israel's yellow specifically for checkpoint/movement-restriction reasons per sources. Flag for sensitivity conversation, same as other disputed territories. |
| Iran | first pass | See `iran.md` — non-sequential, history-dependent province coding (can't be a simple enum); a structured JSON dataset exists on GitHub, worth using directly. |
| Yemen | first pass | See `yemen.md` — civil-war-driven design split between north/south, "current system" has no single settled answer right now. |
| Libya | first pass | See `libya.md` — current series only since 2013 (post-revolution), newest "current system start" found so far. |
| Tunisia | first pass | See `tunisia.md` — different physical dimensions front vs. rear (not just color), a new axis; country name embedded mid-plate, a 4th distinct identification-region layout. |
| Algeria | first pass | See `algeria.md` — numeric-only format, no letters at all (rare); front/rear color split, 3rd country with this pattern. |
| Morocco | first pass | See `morocco.md` — Latin transliteration shown only when travelling abroad (conditional dual-script, a new variant); 3 concurrent physical sizes by vehicle type (4th country with this). |
| Western Sahara / Sahrawi Arab Democratic Republic | not started | Disputed territory — flag before building. |

## Europe

Most European countries: pattern table gives "520×110 or 520×120" as the
bulk EU standard — **not yet verified per-country**, and Iraq's own
`modernLong` already uses 520×110, so several of these may turn out to need
zero new geometry once confirmed, which is worth checking before assuming
each needs its own blank.

| Country | Status | Notes |
|---|---|---|
| Turkey | first pass | See `turkey.md` — province code 01-81 (like Iraq's governorate code, more provinces); **6 concurrent format variants** by letter/digit count, the widest format variability found in any dossier so far. Category colors not found yet. |
| Russia | first pass | See `russia.md` — 12-of-33 Cyrillic letters permitted (visual-confusion exclusion, 4th country with this pattern); a 2025 regulatory change (mandatory EU-style strip) worth double-checking currency on. |
| United Kingdom | first pass, well-corroborated | See `united-kingdom.md` — cleanest dossier so far; fixed white-front/yellow-rear rule (color by face, not category — new axis). Good early implementation candidate once photo-confirmed. |
| Germany | first pass | See `germany.md` — district code length is population-driven (big cities get 1 letter), a new within-country-variance reason. |
| France | first pass | See `france.md` — right-side department/region code is explicitly "purely cosmetic," not load-bearing — a real counter-case to "region code always means something." |
| Italy | first pass | See `italy.md` — different front (360×110) vs. rear (520×110) dimensions, 2nd confirmed country with this (after Tunisia). |
| Spain | first pass | See `spain.md` — current format deliberately shows no province at all, a clean case of the away-from-regional-codes design direction (also seen in Sri Lanka, Ethiopia). |
| Netherlands | first pass | See `netherlands.md` — yellow is the *default* background (rare); 7 rotating format patterns as combinations get used up, a planned version of Panama's forced-exhaustion redesign. |
| Poland | first pass | See `poland.md` — category replaces the region-code slot entirely for military (`U`)/service (`H`) plates, a stronger version of the embedded-category-character pattern. |
| Sweden | first pass | See `sweden.md` — 2019 change allowing the last character to be letter-or-digit, the most surgical capacity-exhaustion fix found; dealer/test plates not tied to a specific car (compare Cuba's driver-bound finding). |
| Portugal | first pass | See `portugal.md` — a 1998-2020 date ribbon was removed specifically because foreign authorities mistook it for an expiry date — a new "why the design changed" reason (cross-border misreading). |
| Greece | first pass | See `greece.md` — letters restricted to ones that look identical in Greek and Latin script, a 3rd distinct exclusion-reason category (cross-script visual compatibility). |
| Ukraine | first pass, wartime-sensitive | See `ukraine.md` — same cross-script exclusion principle as Greece, independently; some region-code combinations deliberately omitted for political sensitivity (4th exclusion-reason category); diplomatic color reportedly changed as recently as April 2026 — re-verify before building. |
| Austria | first pass | See `austria.md` — 520×120 (taller than the usual 110); EV green stripe on the right. |
| Belgium | first pass, architecturally important | See `belgium.md` — explicitly confirmed driver-bound plates, a 2nd independent case after Cuba, upgrading finding #17 to a real pattern. Red-on-white default, an outlier. |
| Switzerland | first pass | See `switzerland.md` — front (300×80) and rear (300×160 or 500×110) are genuinely different shapes, not just sizes; rear carries both national and cantonal coats of arms. |
| Denmark | first pass | See `denmark.md` — Faroe Islands and Greenland run their own sub-schemes under the Danish code, a smaller-scale federation pattern. |
| Norway | first pass | See `norway.md` — 13 distinct EV prefix letters, the most elaborate EV-encoding mechanism found; category-per-leading-letter with its own color, cleaner than Poland's version. |
| Romania | first pass | See `romania.md` — Sept 2024 barcode + phosphorescent hologram update, joins the growing digital-security-feature list (Armenia, Peru). |
| Hungary | first pass | See `hungary.md` — current format has "no geographic connection" by design; coat of arms embedded as the literal separator character in the format. |
| Ireland | first pass | See `ireland.md` — leading digits encode registration year/half-year directly in the serial, a 2nd confirmed date-in-serial case after Ghana. |
| Bulgaria | first pass | See `bulgaria.md` — cross-script-compatible letters again (3rd country independently doing this, after Greece/Ukraine). |
| Finland | first pass | See `finland.md` — Åland Islands run their own sub-scheme, another within-country autonomous-territory case (like Denmark's). |
| Czech Republic | first pass | See `czech-republic.md` — Prague added an extra serial letter mid-2023, a city-scoped capacity extension (vs. whole-country ones elsewhere); historic-vehicle plates get their own color, not just a prefix. |
| Iceland | first pass, architecturally important | See `iceland.md` — most categories are encoded by frame/character color while the field stays white, not by changing the field itself like `PlatePalette` assumes — a genuinely different color-application model, not just more data. |
| Cyprus | first pass, political-territory finding | See `cyprus.md` — Northern Cyprus (breakaway territory) continues using the island's shared 1973-1990 predecessor format rather than diverging entirely, a new shape for the disputed-territory pattern. |
| Malta | first pass, deep history | See `malta.md` — category encoded by a *suffix* letter pattern, the mirror image of every prefix-based case found; literal "TAXI" text used in the serial itself. |
| Luxembourg | first pass, head-of-state finding | See `luxembourg.md` — `Grand-Ducal` single-digit plates reserved for the royal family, plus a separate parliamentary series — 2 distinct high-office categories in one country. |
| Albania | first pass, good category coverage | See `albania.md` — category letters double as real Albanian-language abbreviations (MB = both agricultural and police, depending on position), not arbitrary codes. |
| Serbia | first pass, novel exclusion finding | See `serbia.md` — dropped 7 special Cyrillic-adjacent letters from new plates since 2017 for broader readability, a 5th distinct exclusion-reason category. |
| Croatia | first pass, good category coverage | See `croatia.md` — excludes Q/W/X/Y as "not in the Croatian alphabet," the same underlying exclusion principle as Greece/Ukraine/Bulgaria/Serbia; deliberately kept its 1980s-derived design after 2013 EU accession rather than redesigning, unlike several EU-accession peers that did redesign. |
| Estonia | first pass, deep history | See `estonia.md` — registration dates to 1907, among the earliest found; early plates changed color annually, a historical precedent for Aruba's modern mechanism; Aug 2019 switch to fully random series, the clearest dated case of Spain's drop-regional-meaning direction. |
| Slovenia | first pass, oscillation finding | See `slovenia.md` — 2004 EU-band adoption partially reversed by 2008 (reverted to a green-border design), the first confirmed design oscillation rather than one-directional change. |
| Lithuania | first pass, good category coverage | See `lithuania.md` — coat of arms added Oct 2023 as an incremental addition to a stable format, not a full redesign. |
| Moldova | second pass, category gap mostly closed | See `moldova.md` — government/parliament/ministry encoded by series letter with no color change at all; President's car reserved plate `001`. |
| North Macedonia | first pass, novel finding | See `north-macedonia.md` — country code changed MK→NMK in 2019 following the Prespa Agreement naming-dispute treaty, a political-treaty-driven code change unlike any other reason found. |
| Belarus | first pass | See `belarus.md` — character order (not just prefix/color) changes by vehicle type; simplest region-coding scheme found (single digit, 1-7). |
| Bosnia and Herzegovina | first pass, major political finding | See `bosnia-and-herzegovina.md` — current format exists specifically to remove ethnic identifiers used at checkpoints during a post-conflict period. See the standalone note in `architecture-notes.md` finding #39. |
| Latvia | first pass, most multi-size country found | See `latvia.md` — 8 concurrent physical size variants, more than any other dossier. |
| Monaco | first pass, richly documented royal case | See `monaco.md` — `000`-prefix reserved for the Prince's family, with a specific named historical example. |
| Kosovo | first pass, confirms political-conflict pattern | See `kosovo.md` — 2022 plate-standardization requirement caused real protests in Serbian-majority areas. |
| Slovakia | first pass, extreme drop-regional-meaning case | See `slovakia.md` — Jan 2023 eliminated all 79 district codes outright, more drastic than Estonia's randomization or Spain's no-province design. |
| Andorra | first pass, good category coverage | See `andorra.md` — coat of arms + official Catalan state name spelled out below the serial. |
| Gibraltar | first pass, Brexit-driven finding | See `gibraltar.md` — EU flag/stars removed Jan 2021 post-Brexit, a new "why redesigned" reason (leaving a supranational body, not a treaty rename). |
| Guernsey | first pass, real-money finding | See `guernsey.md` — a "007" plate sold for £240,000 at auction (2015); low-digit plates released in 2012 specifically as a revenue strategy. |
| Jersey | first pass, confirms cherished-plate economy | See `jersey.md` — "J4" sold for £380,000 (2020), funding a real government EV purchase; explicitly not Vienna-Convention-valid despite an EU-like look. |
| Isle of Man | first pass, deepest format-history count | See `isle-of-man.md` — ~12 major format changes since 1906, the most precisely-counted format history found; positional (not just flat) letter exclusion rule. |
| Liechtenstein | first pass, striking default-color finding | See `liechtenstein.md` — the only sovereign European state defaulting to a black field (not just ink) for ordinary cars since 2001; a registrable category for trailer-hitch accessories alone. |
| San Marino | first pass, asymmetric-redesign finding | See `san-marino.md` — 2023 resized only the front plate, not both faces; its EV prefix (`VE`) ran 2019-2023 and was discontinued, the first confirmed EV-mechanism rollback. |
| Vatican City | first pass, richly documented head-of-state case | See `vatican-city.md` — the Popemobile's "SCV 1" plate is directly photo-documented across two papacies; Geneva Convention mandates a separate international oval when traveling abroad. |
| Montenegro | first pass, good category coverage | See `montenegro.md` — municipal-level region coding; `CG`/`MN` letter combinations reserved exclusively for government, President's car traditionally `PG CG001`. |
| Northern Ireland | first pass, confirmed real divergence + political finding | See `northern-ireland.md` — legally barred from the England/Scotland/Wales regional-flag Euro-bands available elsewhere in the UK, a live political restriction; confirms the UK's Sept 2021 GB→UK code change (from `gibraltar.md`) was UK-wide, not Gibraltar-specific. |
| Abkhazia, South Ossetia, Donetsk PR, Luhansk PR, Transnistria (check separately, missing from category fetch) | not started, deprioritized | Breakaway/disputed states — flag for a licensing/political-sensitivity conversation before building, independent of the data work. |
| German Democratic Republic, Soviet Union | not started, deprioritized | Historical/defunct — likely out of scope for a live commercial SDK unless a buyer specifically wants historical plates. |

## Sub-Saharan Africa

| Country | Status | Notes |
|---|---|---|
| Egypt | first pass | See `egypt.md` — top color bar identifies category (a 3rd distinct identification-region shape, after Iraq's side band and Saudi's center strip); governorate-dependent digit/letter counts within one current format; specific Arabic letters excluded to avoid visual confusion (same shape of rule as Saudi's 17-of-28 restriction). Dimensions not found yet. |
| Nigeria | first pass | See `nigeria.md` — 774-LGA region codes (finest-grained subdivision found yet); reported dimensions look flipped (152×300, portrait) and are flagged, not trusted. |
| South Africa | first pass, architecturally important | See `south-africa.md` — federated by province (5th confirmed case of this pattern); a national 2026 redesign is the first *forward-looking* format change found, vs. every other country's backward-looking legacy formats. |
| Kenya | first pass | See `kenya.md` — EVs and motorcycles share one green color, an odd combined case unlike any other EV-encoding found. |
| Ethiopia | first pass | See `ethiopia.md` — visible category-number-on-plate (like South Korea's coded Hangul, here a literal digit); active national redesign dropping regional codes (3rd forward-looking-change country). |
| Ghana | second pass, category gap closed | See `ghana.md` — registration year baked into the plate number itself; full category table now confirmed (private/commercial/government/diplomatic/agricultural/motorcycle), plus reserved-but-unregistrable military/police prefixes. |
| Democratic Republic of the Congo | first pass | See `dr-congo.md` — 480×112, a near-miss vs. Iraq's 520×110; a real 3-era format history (current + 2 legacy). |
| Cameroon | first pass | See `cameroon.md` — black-on-orange default, an outlier vs. nearly every other dossier's white/yellow default. |
| Senegal | first pass | See `senegal.md` — clean 2-era history (2019-present vs. 1989-2019, inverted colors), a good early-implementation candidate for the format-history model. |
| Ivory Coast | first pass | See `ivory-coast.md` — current format only since June 2023; identifier strip is a different color from the main field, a two-tone-strip layout not seen elsewhere. |
| Zimbabwe | first pass | See `zimbabwe.md` — coat of arms centered mid-plate, not on a strip; rear-only mounting for motorcycles/trailers, a per-vehicle-type mounting rule. |
| Uganda | first pass | See `uganda.md` — black shared across UN/public/private categories, an unusual grouping. |
| Tanzania | first pass | See `tanzania.md` — mainland `T` vs. semi-autonomous Zanzibar `Z` prefix, a politically-rooted within-country split (Zanzibar has its own government), distinct from ordinary administrative-boundary variance. |
| Sudan | second pass attempted, still thin (confirmed, not under-searched) | See `sudan.md` — active civil conflict since 2023; category data likely exists behind a paywalled figure, unreachable by this tool. |
| Angola | first pass | See `angola.md` — Portuguese-made dies, a manufacturing-heritage detail (3rd country with this kind of colonial-tie finding, after HK/UK and Rwanda/Zambia). |
| Rwanda | first pass | See `rwanda.md` — Belgian stamping dies. |
| Zambia | first pass | See `zambia.md` — German FE-Schrift typeface, same as Brazil's Mercosul standard — a real reusable cross-country typeface option, alongside Mongolia's plain-Calibri case. |
| Botswana | first pass | See `botswana.md` — government plates invert front/rear colors, a category with its own face-inversion rule; Protectorate-era location codes persisted after independence. |
| Namibia | first pass | See `namibia.md` — agency-prefix government plates (GRN/POL/NDF/JUD), same convention as Botswana's BX/BDF and PNG's per-department codes. |
| Republic of the Congo | first pass | See `republic-of-congo.md` — distinct from DR Congo; CEMAC regional-bloc emblem required since 2006, shared branding layered onto a country-specific design. |
| Gabon | first pass, good category coverage | See `gabon.md` — colors stayed constant (yellow/black) across a full format-era change, unusual; full taxi/military/diplomatic/NGO category table found. |
| Mali | first pass, thin — source has no category data at all | See `mali.md` — confirmed the source itself doesn't differentiate by vehicle category, not a search miss; FE-Schrift typeface (3rd country with this face). |
| Benin | first pass, good category coverage | See `benin.md` — no regional coding at all, same as Togo, a real 2-country West African pattern. |
| Madagascar | first pass, good category coverage | See `madagascar.md` — province letter embedded mid-serial rather than as a prefix, an unusual position. |
| Mauritius | first pass, genuinely thin source | See `mauritius.md` — the Wikipedia article itself is incomplete, not a search miss. |
| Mozambique | first pass, novel rendering finding | See `mozambique.md` — gradient (white-to-blue) background, the first confirmed non-flat field color found. |
| Togo | first pass | See `togo.md` — no regional coding, matching Benin. |
| Eswatini | first pass, most novel dossier so far | See `eswatini.md` — fully illustrated pictorial landscape background (hills, huts, sunset), unlike any flat/gradient field found elsewhere; 2010 redesign explicitly motivated by reducing hijacking risk in South Africa, a crime-prevention design driver. |
| Malawi | first pass, genuinely thin source | See `malawi.md` — stub article, no usable data. |
| Mauritania | first pass, architecturally important | See `mauritania.md` — confirmed RTL layout flip when Arabic script is used, directly challenging this package's own README assumption that plate layout is never mirrored. |
| Burkina Faso | first pass | See `burkina-faso.md` — Gendarmerie format has letters trailing the digits entirely, an even more extreme suffix-only case than Malta's. |
| Burundi | first pass, thin | See `burundi.md` — Belgian stamping dies, matching Rwanda. |
| Chad | first pass, good category coverage | See `chad.md` — French FNI-derived, same lineage as Republic of Congo; regional code count grew with real administrative redistricting (18→22), not just steady expansion. |
| Guinea | first pass, good history depth | See `guinea.md` — 2021 redesign switched region codes from letters to numbers (reverse of the usual direction) and collapsed a 2-color category scheme down to one uniform color. |
| Liberia | first pass, regional-cluster finding | See `liberia.md` — one of only 3 African countries (with Nigeria, Somalia) confirmed using North American plate dimensions; diplomatic codes cover international organizations, not just countries. |
| Djibouti | first pass, two novel findings | See `djibouti.md` — only confirmed country with no country code on the plate at all; Arabic text set in named Square Kufic calligraphy, more deliberate than any other Arabic-rendering case found. |
| Somalia | first pass, fragmented-state finding | See `somalia.md` — Puntland issues its own fully independent, internally consistent design as a de facto autonomous region; deep colonial-era format history. |
| Cape Verde | first pass, good category coverage | See `cape-verde.md` — island-level region codes, finer grain than most archipelago nations; predecessor system used coarser 2-group codes, granularity increased over time. |
| Central African Republic | first pass, good category coverage | See `central-african-republic.md` — 3-tier diplomatic hierarchy encoded directly in format (ambassador/other-diplomat/consular each get distinct suffixes). |
| Equatorial Guinea | first pass, code-collision finding | See `equatorial-guinea.md` — unofficial "GE" country code collides with Georgia's real ISO code, a real uniqueness constraint for any global code registry; ECCAS emblem, a 2nd Central African bloc-branding convention distinct from CEMAC. |
| Eritrea | first pass, thin | See `eritrea.md` — modern system barely documented; colonial-era history closely parallels Somalia's, same Italian East Africa lineage. |
| Gambia | first pass, good history depth | See `gambia.md` — issued directly by the police force, not a civil transport agency; region codes got *longer* over time, opposite of the usual simplification direction. |
| Lesotho | first pass, culturally-specific finding | See `lesotho.md` — validity indicated by a sticker matching the traditional Basotho mokorotlo hat symbol, the only validity mechanism tied to a specific cultural icon found. |
| Niger | first pass, good category coverage | See `niger.md` — country silhouette/map offered in two alternate treatments (colored or black), a graphic-option case not seen elsewhere. |
| South Sudan | first pass, genuinely thin (stub source) | See `south-sudan.md` — plates predate full 2011 independence by 4 years. |
| Comoros | first pass, thin | See `comoros.md` — unofficial-only country code, same gap shape as Equatorial Guinea. |
| São Tomé and Príncipe | first pass, thin | See `sao-tome-and-principe.md` — joins the Portuguese-colonial-lineage cluster (Angola, Mozambique, Cape Verde, Equatorial Guinea). |
| Somaliland | first pass, breakaway territory | See `somaliland.md` — state name shown in both Latin and Arabic; dedicated foreign-aid-vehicle category, distinct from a general diplomatic one. Flag for the political-sensitivity conversation before building. |
| Mayotte | first pass, thin | See `mayotte.md` — French DOM-TOM 3-digit code system, source's own spec table unpopulated. |
| Réunion | first pass, thin | See `reunion.md` — 4th confirmed territory in the French DOM-TOM code pattern. |
| Seychelles | first pass, thin | See `seychelles.md` — 2018 redesign noted but undetailed. |
| Sierra Leone | **confirmed no dedicated Wikipedia article exists** (verified via search, not just a bad URL guess — a Wikidata entry exists but no article) | Would need a different source entirely. |

## Asia (South / East / Southeast / Central)

| Country | Status | Notes |
|---|---|---|
| India | first pass | See `india.md` — BH ("Bharat") series is a nationwide-portable registration tied to no state at all, a genuinely new case. Green = EV. |
| China | first pass | See `china.md` — requires real Hanzi rendering (new script family); NEV plates are 7 characters vs. 6 standard — propulsion type changing format length, not just color. |
| Japan | first pass | See `japan.md` — 3 scripts on one plate (kanji + hiragana + digits), most script-diverse dossier so far; kei-car (small-engine) yellow plates are a vehicle-class distinction unique to Japan so far. |
| Pakistan | first pass | See `pakistan.md` — format varies by administrative unit; I/O/U excluded (5th country with visual-confusion exclusion); province-specific decorative motifs (Punjab flower since 2007) are load-bearing, not incidental. |
| Indonesia | first pass | See `indonesia.md` — EVs get an added blue trim on top of the base category color, a 3rd distinct way of encoding propulsion type (vs. China's separate plate, India's color swap). |
| Afghanistan | first pass | See `afghanistan.md` — bilingual by design (Persian or Pashto), not just Arabic; political-instability caveat like Syria/Yemen/Libya. |
| Bangladesh | first pass | See `bangladesh.md` — requires Bengali script (5th non-Latin/Arabic script family confirmed); a real labeled photo dataset exists (Zenodo), useful beyond just this country. |
| Taiwan | first pass | See `taiwan.md` — excludes digit 4 for cultural/superstition reasons, not visual confusion; a new exclusion-reason category. |
| Hong Kong | first pass | See `hong-kong.md` — British-heritage spec (BS AU145a), same lineage as UK. |
| Cambodia | first pass | See `cambodia.md` — region label bilingual (Khmer top, English bottom) while the serial stays Latin/digits; 2 concurrent sizes. |
| Mongolia | first pass | See `mongolia.md` — mandated Calibri typeface since 2018, the only off-the-shelf digital font found so far (vs. every other country's custom/regulated face). |
| Armenia | first pass | See `armenia.md` — security hologram + machine-readable Data Matrix code, first digital anti-counterfeiting measure found (vs. Iraq's visual-only guilloche/micro-print). |
| Georgia (country) | first pass | See `georgia.md` — simple Latin-only case, no regional-script bilingualism. |
| Uzbekistan | first pass | See `uzbekistan.md` — foreign-citizen and foreign-company categories are distinct from diplomatic, more granular than most dossiers. |
| Azerbaijan | first pass, major finding | See `azerbaijan.md` — RFID microchip embedded in the physical plate since 2011, a step beyond every printed-code security feature found (Armenia, Romania, Peru) — deserves its own tier in a security-features taxonomy. |
| Brunei | first pass | See `brunei.md` — royal family has its own plate category, unique so far; region-code letter went purely nominal after a 2006 policy change, a live version of France's cosmetic-region-code finding. |
| Laos | first pass | See `laos.md` — category encoded via a Lao-script prefix character (2nd country doing category-as-script-character, after South Korea); 2024 EV sticker is a 5th distinct EV-encoding mechanism. |
| Maldives | first pass | See `maldives.md` — the earlier 404 was a bad URL guess, not a missing article; category may be encoded twice in the same serial, worth a photo check. |
| Bhutan | first pass | See `bhutan.md` — Royal Bodyguard as its own plate category, 2nd monarchy-specific category found (after Brunei). |
| North Korea | first pass, two novel findings | See `north-korea.md` — excludes "4" like Taiwan (confirms a real cross-East-Asian pattern); VIP plates encode a political anniversary date symbolically in the number, unlike any administrative date-encoding found elsewhere. |
| Macau | first pass, one novel finding | See `macau.md` — Hong Kong-plated vehicles capped at exactly 4,500, the first confirmed quota-limited plate category (a hard numeric cap, not just a design variant). |
| Kyrgyzstan | first pass | See `kyrgyzstan.md` — Soviet-era plates continued in use until 1994, 3 years past independence; 2015 regional-code overhaul explicitly modeled on Russia's. |
| Turkmenistan | first pass | See `turkmenistan.md` — typeface hybridizes DIN 1451 (the same lineage `PlateTypeface` itself derives from) with an old French plate font. |
| Tajikistan | first pass | See `tajikistan.md` — private vs. legal-entity plates distinguished by digit-count rather than a letter, a new mechanism; embedded security chip since 2014 (joins Azerbaijan's RFID). |
| Timor-Leste | first pass, deep colonial history | See `timor-leste.md` — 3-era history tracks Portuguese colonization, Indonesian occupation, and independence directly; bilingual TL/TLS country code. |
| Philippines | first pass | See `philippines.md` — green/white for EV *and* hybrid, a 4th distinct EV-encoding approach. |
| Thailand | first pass | See `thailand.md` — full province name spelled out in Thai script, not a code; requires Thai script rendering (7th script family). |
| Vietnam | first pass | See `vietnam.md` — every vehicle gets 2 physically different plates simultaneously (330×165 + 520×110), a new "both always" variant of the multi-size finding. |
| Malaysia | first pass | See `malaysia.md` — default white-on-black, an outlier vs. nearly every other dossier; Sabah/Sarawak use a 2nd letter for sub-state area (within-country format variance, 4th case after Egypt/Turkey/Pakistan). |
| South Korea | first pass | See `south-korea.md` — a Hangul character embedded mid-serial encodes vehicle type as a coded data field, not a decorative label — new script/validation pattern. |
| Kazakhstan | first pass | See `kazakhstan.md` — official egov.kz source found, worth fetching directly. |
| Sri Lanka | first pass | See `sri-lanka.md` — province codes removed from new plates since Jan 2023, a recent simplifying change (opposite direction from South Africa's unification). |
| Myanmar | first pass | See `myanmar.md` — current format only since July 2021; plate includes free-text make/model, not seen elsewhere. |
| Nepal | first pass | See `nepal.md` — province name in Devanagari, vehicle number in English; mixed-script-by-field pattern like Iran/Afghanistan. |
| Singapore | first pass | See `singapore.md` — two entirely different concurrent physical layouts (not just sizes), similar in kind to Kuwait's square motorcycle blank. |

## Americas

| Country | Status | Notes |
|---|---|---|
| Mexico | first pass | See `mexico.md` — national number format, but state-designed plates redesigned roughly every 3 years; a design-churn-over-time axis independent of format history. |
| Canada | **sub-tracker complete (first pass)** | See `canada.md` for the country-level overview and `canada-provinces/_tracker.md` for all 13 provinces/territories individually — format, slogan, front/rear rule per jurisdiction. Newfoundland's explicitly vehicle-bound plates and Nunavut's bear-shape-to-rectangle reversion are new since the country-level pass. |
| Costa Rica | first pass | See `costa-rica.md` — "CENTRAL AMERICA" text alongside country name, a regional-bloc convention shared with Guatemala. |
| Panama | first pass | See `panama.md` — 2013 format change caused by running out of all-numeric combinations, a capacity-exhaustion reason for format change not seen elsewhere; rear-only mounting. |
| Guatemala | first pass | See `guatemala.md` — explicitly modeled after Mercosur and neighboring Honduras per its own source, cross-country design influence outside the formal Mercosur bloc. |
| Cuba | first pass, architecturally important | See `cuba.md` — reported to identify the *driver*, not the vehicle; if accurate, breaks the vehicle-bound assumption every other country module (including Iraq's) is built on. Needs verification before treated as a real case. |
| Belize | first pass, good category coverage | See `belize.md` — kept its pre-independence "BH" road code even after renaming and independence, joining Botswana/Namibia's outlived-predecessor-code pattern. |
| Haiti | first pass, deep history | See `haiti.md` — 2006-2013 era used a single rear plate only with a windshield sticker replacing the front, an unusual mid-history mounting-rule change. |
| Barbados | first pass, novel naming basis | See `barbados.md` — parish letters follow saints' names, a religious/ecclesiastical basis for region codes, unlike every population/political-boundary scheme found elsewhere. |
| Bermuda | first pass | See `bermuda.md` — two sizes tied to plate *purpose* (personalized vs. standard) rather than vehicle type, a new axis for the multi-size finding. |
| Antigua and Barbuda | first pass | See `antigua-and-barbuda.md` — "LAND OF SEA AND SUN" slogan. |
| Grenada | first pass | See `grenada.md` — 1974-era plates were porcelain, a material not seen elsewhere; British typeface on North American dimensions, an explicit cross-standard hybrid. |
| Aruba | first pass, architecturally important | See `aruba.md` — issues an entirely new plate every year with a rotating color as the validity signal, replacing a sticker mechanism entirely; Governor's car uses reserved plate `A-1`. |
| United States | **sub-tracker complete (first pass)** | See `us-states/_tracker.md` — all 50 states + DC + 5 territories, one table: serial format, exclusion rules, colors, slogans. Confirms US/Canada share the literal 1956 dimension agreement; surfaces illustrated/pictorial backgrounds as a whole design tradition (~2/3 of states), Vermont's unique debossed (recessed) relief, and Tennessee's all-vowels exclusion — the most aggressive found anywhere. |
| Saint Lucia | first pass, good category coverage | See `saint-lucia.md` — taxi/minibus plates show licensed passenger capacity directly on the plate, a field type not seen elsewhere. |
| Saint Kitts and Nevis | first pass, thin | See `saint-kitts-and-nevis.md` — no country code, 3rd confirmed case. |
| Saint Vincent and the Grenadines | first pass, thin | See `saint-vincent-and-the-grenadines.md` — EU-size plate, an outlier in a mostly NA-standard Caribbean. |
| Dominica | first pass | See `dominica.md` — minimal single-letter category system. |
| Cayman Islands | first pass, novel finding | See `cayman-islands.md` — 2003 quincentennial plates recalled specifically for a character-legibility failure, a new "why redesigned" reason; Governor's vehicle gets a British-overseas-territory-specific category. |
| British Virgin Islands | first pass, good category coverage | See `british-virgin-islands.md` — switched from EU to NA plate dimensions outright in 1996, not just a format change. |
| Curaçao | first pass, most exhaustive category system found | See `curacao.md` — the entire alphabet is partitioned by category, not just a prefix rule. |
| Turks and Caicos Islands | first pass, sub-national customization finding | See `turks-and-caicos.md` — Dec 2022 redesign gives each individual island its own graphic, federation at a finer grain than even Palau's state-level case. |
| Anguilla | first pass, positional-migration finding | See `anguilla.md` — vehicle-type letter moved from suffix to prefix in the 2007 redesign, a positional migration distinct from Guinea's letter-to-number type change. |
| Sint Maarten | first pass | See `sint-maarten.md` — 2 category prefixes honestly flagged as unclear-purpose in the source rather than guessed at. |
| US Virgin Islands | first pass, deep slogan history | See `us-virgin-islands.md` — 5 named slogan eras; current design commemorates a specific 175th-anniversary date, the clearest slogan-as-commemoration case found. |
| Caribbean Netherlands | first pass, richly documented | See `caribbean-netherlands.md` — each of its 3 islands gets its own letter, slogan and imagery (matching Turks and Caicos' finding, but older); 1976 plates used the official US Bicentennial Commission logo, the only cross-national commemorative borrowing found. |
| Canal Zone | not started, deprioritized | Historical/defunct (Panama Canal Zone). |
| Brazil, Argentina | first pass, architecturally important | See `brazil.md`/`argentina.md` — confirmed (not just size-coincidence): both use the literal same Mercosur `PlateBlank` (400×130, blue top strip, Mercosur logo), differing only in the country name/flag on the strip. |
| Colombia | first pass | See `colombia.md` — private and official vehicles share one color (yellow), an unusual grouping; police and military each get distinct schemes rather than sharing "government." |
| Chile | first pass | See `chile.md` — coat of arms placed inline within the serial itself (between letter/number groups), a placement variant not seen elsewhere. |
| Peru | first pass, unusually elaborate | See `peru.md` — a two-layer color system (base category + transport-subtype stripe), the most granular color scheme found; actively adding EV support (4th distinct EV-encoding effort). |
| Venezuela | second pass, category gap partly closed | See `venezuela.md` — taxis split white vs. black by status tier (pre-INTT lines vs. hotel/port/airport affiliates), a distinction within one category not seen elsewhere. |
| Honduras | first pass, good category coverage | See `honduras.md` — QR code added 2018; forest-conservation slogan baked into the design, like Australia's state slogans. |
| El Salvador | second pass, category gap closed via a legal source | See `el-salvador.md` — taxi's checkered body stripe extends the category marking past the plate itself; private vehicles legally barred from yellow to protect the taxi category's identity, an exclusion reason with no equivalent elsewhere. |
| Nicaragua | second pass attempted, still thin (confirmed, not under-searched) | See `nicaragua.md` — historical `_Estatal_` text annotation for state ownership; category-color data would need a primary legal-text fetch, not another general search. |
| Jamaica | first pass, good category coverage | See `jamaica.md` — military scheme explicitly borrowed from the British design shared with Trinidad and Tobago. |
| Dominican Republic | first pass, deep history | See `dominican-republic.md` — 1930-1989 semi-annual reissue with alternating colors specifically to signal current registration; laminated-paper temporary plates, a new material. |
| Trinidad and Tobago | first pass, unique finding | See `trinidad-and-tobago.md` — owners legally choose their own plate color (white-on-black or the reverse), the only confirmed case of palette-as-personal-choice rather than derived value. |
| Ecuador | first pass, good category coverage | See `ecuador.md` — 2012 switch to color-only-on-upper-border specifically for camera/radar readability, a technology-driven design-change reason not seen elsewhere. |
| Bahamas | first pass, two novel findings | See `bahamas.md` — plates issued per-island (a small-scale federated case); a 1992-1996 Columbus-anniversary commemorative truck-plate edition, the first confirmed limited-run design found. |
| Uruguay | first pass, confirms Mercosur 3x | See `uruguay.md` — 3rd country confirmed on the literal shared Mercosur blank; Maldonado delayed adoption to 2019, an internal rollout-lag case. |
| Bolivia | first pass, good category coverage | See `bolivia.md` — adopted Mercosur-style numbering 2016 as an associate member, worth checking if it shares the literal blank. |
| Paraguay | first pass, confirms Mercosur 4x | See `paraguay.md` — 4th country on the shared Mercosur blank; previous system explicitly created to fight vehicle smuggling (Law 608/95), a law-enforcement-driven format origin. |
| Guyana | first pass, good category coverage | See `guyana.md` — President's/PM's vehicles get unique emblems, broadening the "royal-specific plate" finding to republics as a head-of-state pattern generally. |
| Suriname | second pass, one significant finding | See `suriname.md` — reportedly examining a switch to person-bound plates as of 2021, a potential 3rd driver-bound case caught mid-transition; category-color table still genuinely unavailable after two passes. |
| French Guiana | first pass, thin | See `french-guiana.md` — 5th confirmed territory in the French DOM-TOM 3-digit code pattern. |
| Easter Island | **covered by `chile.md`** — a Chilean territory, not a separate registration system | — |

## Oceania

| Country | Status | Notes |
|---|---|---|
| Australia | first pass, architecturally important | See `australia.md` — explicitly confirmed federated ("doesn't have one national system, but eight"); per-state slogans are part of the plate design itself, no equivalent modeled anywhere yet. |
| New Zealand | first pass | See `new-zealand.md` — 2001 letter-count increase from capacity exhaustion; 2022 optional black plates paired with an anti-fraud hologram, an aesthetic-choice-plus-security-feature combination. |
| Fiji | first pass | See `fiji.md` — "privately imported" category discontinued but still legally valid, a 3rd state beyond current/legacy; blanks manufactured in Australia. |
| Papua New Guinea | first pass, good category coverage | See `papua-new-guinea.md` — government sub-categorized by department (police/health/power each distinct); route-flexibility (fixed vs. not) encoded by color for public-motor-vehicles, a new dimension; personalized plates since 2023. |
| Samoa | first pass | See `samoa.md` — 2000 adoption of Australian/NZ dies included a slashed-zero convention, a typographic detail worth remembering for `PlateTypeface`. |
| Vanuatu | first pass, unique finding | See `vanuatu.md` — plates are the owner's legal responsibility to manufacture, not government-issued at all — the only confirmed case breaking the implicit government/licensed-vendor assumption in every other dossier. |
| Palau | first pass, most significant Pacific dossier | See `palau.md` — federated to the state level in a 340km² country; material varies by state (metal, hand-painted, wood, plexiglass, plastic); a 1990s national-unification attempt reverted, a 3rd confirmed format oscillation, this one conflict-driven. |
| Tonga | first pass | See `tonga.md` — owner-manufactured (Pacific pattern, not Vanuatu's one-off); a data-quality flag on apparent Cyrillic-looking characters in the source, likely a transcription artifact. |
| Kiribati | first pass, confirms Pacific self-manufacture pattern | See `kiribati.md` — 3rd Pacific nation confirmed with owner-manufactured plates; no country code displayed, 2nd case after Djibouti. |
| Solomon Islands | first pass | See `solomon-islands.md` — a dated transition (2014) from owner-manufactured to government-issued, a useful companion to the still-current Vanuatu/Tonga/Kiribati cases. |
| Marshall Islands | first pass | See `marshall-islands.md` — manufactured from silver or wood, confirming Palau's wood-material finding is a real Pacific pattern. |
| French Polynesia | first pass | See `french-polynesia.md` — uses France's own DOM-TOM 3-digit code system (987), inherited from the governing country's internal numbering, not locally designed. |
| New Caledonia | first pass, confirms French-territory code pattern | See `new-caledonia.md` — code 988, same French system as French Polynesia's 987. |
| Nauru | first pass | See `nauru.md` — 2015 format change (numeric-only → alphanumeric) with no color change at all, the mirror case of Senegal's color-only 2019 redesign. |
| Cook Islands | first pass | See `cook-islands.md` — "Kia Orana" slogan in Cook Islands Māori, the only indigenous-language slogan found (every other Pacific slogan is English). |
| Federated States of Micronesia | first pass, confirms Palau's federation pattern | See `micronesia.md` — 4 states each issue fully distinct plates, a 2nd Pacific state-level federation case; Yap's "ISLAND OF STONE MONEY" slogan is among the most culturally specific found. |
| Tuvalu | first pass, confirms self-manufacture pattern 4x | See `tuvalu.md` — 4th Pacific nation with owner-manufactured plates. |
| Niue | first pass | See `niue.md` — NZ stamping dies, slashed zero, joining Samoa/Cook Islands' NZ-associated-states cluster. |
| Wallis and Futuna | first pass, good history depth | See `wallis-and-futuna.md` — 6th confirmed territory in the French DOM-TOM code pattern. |

## Scale problems this tracker already surfaces, before any deep-dive

1. **"Federated, no single national scheme" is the norm, not an edge
   case.** Explicitly confirmed for the US, UAE, and Australia; effectively
   true for South Africa (9 provinces, unifying 2026) and Mexico (national
   numbers, state-designed plates). At least 5 of the ~35 countries touched
   so far are federated — at that rate, expect dozens more across the
   remaining ~200. This is the single biggest reason `plate_blank.dart`
   needs a `FederatedCountry`-shaped concept before going much further, not
   a per-country workaround each time it comes up.
2. **Vehicle propulsion type (EV) changes the plate in three different,
   incompatible ways** across the three countries checked so far (China:
   separate longer plate; India: color swap; Indonesia: added trim). Real,
   but not yet safe to build a single mechanism for — see
   `architecture-notes.md` finding #14.
3. **Non-Latin/non-Arabic scripts are real**: China (Hanzi), Japan (Hanzi +
   Hiragana + digits), Russia (restricted Cyrillic). The typeface/rendering
   system needs to generalize past "vector Latin skeleton + Arabic digit
   swap" sooner than expected.
4. **Small dimension discrepancies between "the country's own article" and
   "the cross-country comparative table" have now shown up repeatedly**
   (Jordan: 520×110 vs 430×110; Syria: 450×100 vs. a found 440×300; New
   Zealand vs. its Pacific-bucket figure) — treat any pattern-table-only
   figure as provisional until the country gets its own dossier.

## Progress so far

**217 individual country/territory dossiers** exist in `planning/countries/`,
plus the two federated sub-trackers (`us-states/_tracker.md`: 50 states + DC
+ 5 territories in one table; `canada-provinces/_tracker.md`: all 13
provinces/territories). Against the ~230-entry master list, what's left
unresearched is essentially just the deliberately deprioritized set:
Western Sahara, the 5 breakaway/disputed European territories (Abkhazia,
South Ossetia, Donetsk PR, Luhansk PR, Transnistria), and 3 historical/
defunct entities (German Democratic Republic, Soviet Union, Canal Zone) —
each flagged inline for a political-sensitivity or scope conversation
rather than skipped by oversight.

**What "dossiered" does not mean**: uniform depth. 3 (Jordan, Kuwait, Saudi
Arabia) are cross-referenced across multiple independent sources. The rest
are "first pass" — 1-2 targeted fetches each, real citations, honest gaps.
A category-completeness cleanup pass has been run on a portion of these
(see `architecture-notes.md` finding #49) and closed real gaps, but has
**not** been run against all ~210 remaining first-pass dossiers — assume
more incomplete category tables exist undetected until that sweep is
repeated. Zero photo verification has been done anywhere.
