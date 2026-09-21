# Architecture notes — findings from the first 3 countries

Source: `planning/countries/{jordan,kuwait,saudi-arabia}.md`, checked against
Iraq's existing `_PlateSpec`/`PlatePalette`/`PlateCategory` in
`lib/src/iraqi_license_plate.dart` and `lib/src/iraqi_plate.dart`.

This exists so the generalized architecture is shaped by real evidence from
day one instead of guessed at from Iraq alone and reworked later. Draft code
implementing these is in `lib/src/core/plate_blank.dart` — unwired, doesn't
touch the shipped public API.

## What actually varies, evidenced

1. **Non-rectangular-in-spirit blanks exist.** Kuwait reportedly issues a
   155×155 *square* motorcycle plate, vs. Iraq's rectangular 200×125
   motorcycle blank. → `PlateBlank.isSquare`.

2. **The country-identification region isn't always a plain color band.**
   Saudi Arabia's is an emblem/seal graphic ("KSA" + official seal),
   positioned right or center depending on plate size — not a fixed-edge flat
   color the way Iraq's `IRQ`/`KR` band is. → split into
   `ColorBandStrip` / `EmblemStrip`, and made optional (`PlateBlank.strip`)
   since a strip-less plate is also plausible.

3. **Category encoding isn't always color-only.** Saudi Arabia shape-codes
   categories too (circle / triangle-direction) on top of color. Iraq and
   (apparently) Jordan are color-only. → `CategoryEncoding` as independent
   `usesColor`/`usesShape` flags rather than an enum, since a country could
   use both or neither.

4. **Script usage isn't fully captured by "format vs. legacy."** Iraq's
   current format is Latin-only, legacy is Arabic-only — two formats, one
   script each. Saudi Arabia's *current* format shows Arabic as primary with
   a Latin transliteration always alongside, on the same plate. That's an
   axis independent of format history. → `ScriptLayout` enum
   (`single` / `dualScriptAlwaysShown`), attached per format rather than
   folded into the format-vs-legacy split.

5. **One country can run multiple concurrent physical layouts for the same
   vehicle class** — confirmed independently for two countries now, not just
   a single-source claim. Kuwait offers 335×155, 520×110 *and* 520×85 as
   live sizes; Jordan's own ALPR literature separately describes concurrent
   "European style" (one row) and "American style" (two rows) plates. This
   is a real case, not Wikipedia imprecision: the format model needs to
   support "more than one live physical layout per current system," not just
   "current format vs. legacy format."

6. **Format history can run deeper than current+legacy.** Kuwait's Wikimedia
   Commons category alone documents distinct 1970s, 1980s, 1990s and 2010s+
   plate eras. Iraq's two-format model (current/legacy) may be the simple
   case, not the norm — the format-history abstraction should expect an
   ordered list of historical formats per country, not a boolean flag.

7. **Sources conflict with each other, not just with silence.** Saudi
   Arabia's category-color scheme and script-layout direction (stacked vs.
   side-by-side) have two incompatible answers across otherwise-plausible
   sources (see `planning/countries/saudi-arabia.md`). "Cross-referenced
   across N sources" is not the same as "settled" — a country dossier needs
   an explicit conflict list, not just a confidence label, until a photo
   breaks the tie.

## Deliberately not generalized yet (no evidence for it)

- Emboss/relief rendering is still assumed optional-per-country but no second
  data point yet confirms which countries stamp metal vs. print/sticker —
  every dossier so far just says "needs a real photo." Not building a
  material-style abstraction until at least one non-Iraq country is
  photo-confirmed either way.
- Exact geometry fields for rows/registration layout (Iraq's `_Row`,
  `contentLeft`/`contentRight`) are untouched in the draft — no evidence yet
  that registration-row layout varies in a way `_Row` can't already express.

## Scale findings from surveying the full country list

8. **Some "countries" aren't single design systems — confirmed for a second
   country, not just suspected for the US.** The UAE has no unified scheme
   at all: each of its 7 emirates issues its own design (Dubai codes
   category through letter-prefix/format, Abu Dhabi through a numbered strip
   system, and they don't match each other). One source found while
   researching it explicitly warned that most existing web content on this
   topic recycles an outdated, wrong table — a caution worth generalizing:
   for any federated country (UAE, likely US, likely Canada), a single
   secondary source is not enough, and the *unit of implementation* may need
   to be "state/emirate/province," not "country," at the registry level in
   `plate_blank.dart`'s eventual registry.

9. **Vehicle propulsion type can change the blank**, evidenced by China's
   separate New Energy Vehicle plate dimensions (440×140 standard vs.
   480×140 NEV) — a new axis beyond category/format/region, not yet modeled
   anywhere in `plate_blank.dart`. Not building for it yet on one data
   point; flagged for when a second country confirms the same pattern.

## Findings from the first global (non-MENA) pass

10. **"Federated, no single national scheme" is now the norm, not an
    edge case.** Confirmed explicitly or effectively for US, UAE,
    Australia ("doesn't have one national system, but eight"), South
    Africa (9 provinces, transitioning to unified in 2026), and Mexico
    (national numbering, but state-designed and redesigned every ~3
    years). This needs to be a first-class registry concept —
    `FederatedCountry` composed of named subdivisions, each able to define
    its own `PlateBlank`/palette/format — not a special case bolted onto a
    handful of countries after the fact.

11. **A blank can be shared across country modules, not owned by one.**
    Brazil's current "Mercosul" plate is the same regional standard used by
    Argentina, Uruguay and Paraguay. The registry should let a `PlateBlank`
    be referenced by multiple country entries instead of forcing a
    duplicate definition per country.

12. **Non-Latin, non-Arabic scripts are real and already plural.** China
    needs Hanzi; Japan needs Hanzi *and* Hiragana *and* Arabic numerals on
    the same plate; Russia needs a restricted 12-letter Cyrillic subset.
    `PlateTypeface`'s Latin/digit vector skeletons and the
    Arabic-digit-conversion helpers cover neither — real font rendering
    (already anticipated for Saudi/legacy-Arabic) needs to generalize to
    "whatever script this country needs," not stay Arabic-specific.

13. **Visual-confusion character exclusion is a universal, not
    country-specific, validator need.** Now confirmed for Saudi (17 of 28
    Arabic letters), Russia (12 of 33 Cyrillic letters), Egypt (3 excluded
    Arabic letters), and Pakistan (I/O/U excluded) — 4 independent
    countries doing the same kind of thing for the same reason. The
    per-country validator abstraction (`plate_blank.dart` doesn't have one
    yet) should take an excluded-character set as a standard parameter, not
    something each country module reinvents.

14. **Propulsion type (EV) is real but implemented three different ways.**
    China: a separate plate format, longer than standard, distinct green
    color. India: green *replaces* the category color entirely for EVs.
    Indonesia: a blue trim is *added on top of* the existing category color.
    This is now confirmed enough to be a real requirement, but genuinely
    unresolved *how* to model it — not building a propulsion-type field
    until this is deliberately decided, since guessing wrong here means
    reworking three different countries' data, not just adding a field.

15. **Format design can change over time in more ways than "current vs.
    legacy."** South Africa has an *announced future* uniform design
    rolling out from 2026 (a forward-looking change, unlike every other
    country's backward-looking legacy formats found so far). Mexico's
    states redesign roughly every 3 years, independent of the number format
    itself changing. The format-history model needs a time axis that isn't
    just "before now" — it may need "announced, not yet effective" and
    "design churns independently of format" as states too.

16. **A registration can belong to no subdivision at all.** India's BH
    ("Bharat") series is a nationwide-portable plate class that exists
    specifically to not be tied to any one state — the first case where
    "which subdivision issued this" doesn't have an answer by design.

## Findings from the second global pass (~60 countries total)

17. **A plate can be bound to a person, not a vehicle.** Cuba's plates are
    reported to identify the *driver*. Not yet verified, but if true it
    breaks an assumption every country module so far — including Iraq's
    own `IraqiPlate` — is implicitly built on. Worth a deliberate check
    before this is dismissed as one country's oddity.
18. **Reusable, off-the-shelf typefaces exist alongside the "every country
    needs a bespoke vector face" default.** Mongolia mandates plain
    Calibri; Zambia and Brazil's Mercosur standard both use the German
    FE-Schrift anti-counterfeiting face. Worth keeping a small library of
    known reusable faces rather than treating `PlateTypeface` as the only
    option for every country.
19. **Character exclusion has (at least) two distinct causes**, not one.
    Saudi/Russia/Egypt/Pakistan/Malaysia exclude characters for *visual
    confusion* (looks like another character or digit). Taiwan excludes the
    digit 4 for *cultural/superstition* reasons — nothing to do with how it
    looks. The validator's excluded-character concept (finding #13) needs a
    reason tag, not just a blocklist, since the two cases might interact
    differently with user-facing error messages.
20. **Format changes for reasons beyond politics or unification.** Panama's
    2013 format change was pure capacity exhaustion — it ran out of
    all-numeric combinations. A new category of "why does a format change
    over time" alongside South Africa/Ethiopia's unification and Sri
    Lanka's simplification.
21. **The Mercosur shared-blank finding (#11) is now confirmed, not just
    plausible.** Argentina's plate is the same `PlateBlank` as Brazil's,
    differing only in the country name/flag on the strip — this is safe to
    build as one shared blank with a per-country strip override, not
    speculative.
22. **Federation can vary the physical mounting rule, not just the
    design.** Canada: which provinces require front+rear vs. rear-only
    varies by province. Panama and Zimbabwe also have rear-only rules (for
    the whole country, and for certain vehicle types respectively). Worth a
    `requiresFrontPlate` — or per-vehicle-class — flag somewhere in the
    eventual blank/country model, not just color/geometry per subdivision.
23. **Physical shape variance can go well beyond "different rectangle."**
    Canada's Northwest Territories issues a polar-bear-*shaped* plate —
    the most extreme case found, beyond Kuwait's square motorcycle blank.
    `PlateBlank.isSquare` is not enough; genuinely non-rectangular blanks
    are real, at least as an outlier worth a documented escape hatch rather
    than a first-class feature to build now.

## Findings from the Europe pass — the exclusion-reason taxonomy is now settled at 4

24. **Character exclusion has (at least) 4 distinct causes**, refining
    finding #19: (a) visual confusion within one script (Saudi, Russia,
    Egypt, Pakistan, Malaysia, Poland), (b) cultural/superstition (Taiwan's
    excluded 4), (c) cross-script visual compatibility — using only
    characters that read identically in two scripts at once (Greece:
    Latin letters shaped like Greek ones; Ukraine: Cyrillic letters shaped
    like Roman ones, arrived at independently), (d) political sensitivity —
    omitting a combination because it reads as something else unwanted
    (Ukraine's dropped BP/CC region codes). The validator's excluded-
    character concept needs a reason tag with (at least) these 4 values.
25. **A region/area code on the plate is not always load-bearing.** France
    is explicit that its right-side department code is "purely cosmetic,"
    unrelated to where the vehicle is actually registered. Don't assume
    every region-shaped field on a plate is functional — some are
    decorative holdovers.
26. **A plate's visual design can change for reasons entirely about how
    outsiders misread it.** Portugal removed a date ribbon specifically
    because foreign authorities mistook it for an expiry date — a genuinely
    new "why did the design change" reason alongside capacity-exhaustion
    (#20, also now confirmed 3x more: Sweden, Netherlands, Panama) and
    political/simplification (#15).

## Belgium confirms Cuba's finding — plate-to-driver binding is real

27. **Finding #17 is no longer a single unverified claim.** Belgium's
    Wikipedia article states outright that its plates are driver-specific
    and transfer between vehicles, with the explicit consequence that plate
    age can't be used to infer a vehicle's registration year. Combined with
    Cuba, that's 2 independent countries. `IraqiPlate` and every module
    drafted so far assume `plate → one vehicle`; at least a `boundTo`
    concept (vehicle vs. person) needs to be a real, early design decision,
    not a later add-on, given how much of the validation/UI logic would
    implicitly assume the wrong binding otherwise.

## Category-data coverage note

Ghana's dossier (and a few others) shipped with region/format info but no
taxi/private/government color table — the search pass simply didn't surface
it. Confirmed with a targeted second look at 3 more African countries
(Republic of Congo, Gabon: good category coverage on retry with a category-
specific prompt; Mali: genuinely no category differentiation in the source
itself, not a search miss). Worth remembering for later cleanup passes: a
country flagged "first pass" with no category table needs a second,
specifically-targeted fetch before assuming the data doesn't exist.

## Findings from the Americas/Oceania pass

28. **Plate color can be a personal choice, not a determined value.**
    Trinidad and Tobago's law lets an owner pick white-on-black or
    black-on-white for their plate — the palette isn't derived from
    category/region/propulsion at all in this one case. Every resolution
    model built so far (`widget → theme → category default`) assumes the
    palette is *derived*; this is the first confirmed case where it's
    simply *chosen*, which such a model already technically supports (an
    explicit widget-level `palette` override) but is worth naming as a real
    use case rather than an edge case.
29. **`PlatePalette`'s band/field split doesn't cover every color-
    application model.** Iceland encodes most categories by changing the
    *frame and character* color while the field stays white — not the field
    itself, the way Iraq's (and every model built so far) works. Only a
    minority of Iceland's categories change the field color. This is a
    genuinely different mechanism, not a data-fitting problem — worth a
    real design decision (a 3rd color slot? a "what changes" flag?) rather
    than forcing Iceland's data into the existing 4-color shape.
30. **A discontinued-but-still-valid status is real**, not just current vs.
    legacy. Fiji's "privately imported" category is no longer issued but
    remains legally valid on existing vehicles — a third state beyond
    "current" and "legacy," since legacy implies a format that's been
    fully superseded, while this is a closed-but-still-active category
    within the current era.

## Findings from the small-market sweep

31. **A whole plate can rotate as the validity signal.** Aruba issues an
    entirely new plate every year with a different color, replacing a
    sticker/date mechanism outright — the year *is* the color. Distinct
    from the Dominican Republic's twice-yearly alternating reissue.
32. **Head-of-state/royal-specific plates are a recurring, not rare,
    category** — now confirmed for Brunei, Bhutan, Guyana (President/PM),
    Barbados (Presidential), Luxembourg (Grand-Ducal), and Aruba (Governor's
    reserved `A-1`). Worth a real modeled category rather than treating
    each as a one-off exception.
33. **Quota caps, discontinued-but-valid statuses, and legally-chosen
    palettes are all real, confirmed multiple times now**: Macau's 4,500-
    plate HK quota; Fiji's/Albania's discontinued-but-still-legal
    categories; Trinidad and Tobago's owner-chosen color. None of these
    fit the `derived from category/region/propulsion` palette-resolution
    model the widget already has — they're a growing list of exceptions to
    design for explicitly rather than keep bolting on.
34. **A breakaway/disputed territory can freeze a shared *predecessor*
    format** rather than diverging into something new — Northern Cyprus
    still uses the island's 1973-1990 design. Different in kind from
    Abkhazia/South Ossetia/Somaliland (separate new designs) — worth
    distinguishing "adopted an old shared format" from "invented a new
    one" when eventually handling disputed territories.

## Two findings that directly challenge existing assumptions in this codebase

35. **Eswatini's plate background is a full illustrated landscape** — hills
    and traditional beehive huts over a sunset, not a flat or gradient
    fill. Every material-style assumption made so far (`_emboss`'s flat
    field + relief characters) doesn't have anywhere to put this. Would
    need its own material-style case if built, not a palette tweak.
36. **Mauritania's plate layout is confirmed to flip to right-to-left when
    Arabic is used**, per an official 2017/2023 policy. This directly
    contradicts the assumption already written into this package's own
    README: "the widget pins itself to `TextDirection.ltr` internally...
    never mirrored, even in an RTL app." That rule is true *for Iraq*
    specifically (its registration stays LTR even in an RTL app shell) —
    but Mauritania shows it isn't a universal truth about license plates
    in general. Any multi-country RTL support needs to be a real per-
    country layout capability, not carry forward Iraq's "never" as if it
    generalizes.

## Two more assumption-breakers

37. **A country's format history can oscillate, not just progress.**
    Slovenia adopted the EU blue-band design in 2004 and partially reverted
    part of it (a green border) by 2008. Every format-history model
    considered so far (current + N legacy) assumes one-directional change;
    this is the first confirmed case of a design partially reversing
    itself.
38. **Plate manufacture isn't always a government/licensed-vendor
    process.** Vanuatu's law makes it the vehicle owner's own
    responsibility to have a plate made — no official manufacturer at all.
    Every other dossier implicitly assumes a government or licensed
    supplier issues the physical object; this breaks that assumption for
    at least one real country.

## License plate design as a genuine political flashpoint — not just a data quality note

39. **At least 3 confirmed cases where plate design itself is bound up
    with real ethnic/political conflict, not just administrative
    history.** Bosnia and Herzegovina's current uniform format (1998)
    directly replaced entity-specific plates *because* vehicles bearing
    one entity's plates were being vandalized crossing into the other —
    a freedom-of-movement/safety measure, not a style choice. Kosovo's
    2022 plate-standardization requirement caused real protests and
    ongoing conflict in its Serbian-majority north, delayed a month for
    US/EU consultation. Northern Cyprus continues using a frozen 1973-1990
    shared predecessor format rather than either side's current one. This
    is a different category of caution than the "flag for a licensing/
    political-sensitivity conversation" note already on Abkhazia/South
    Ossetia/Somaliland/Transnistria in `_tracker.md` — those are about
    whether to build a *disputed territory* at all; this is about how a
    *recognized* country's own current, mainstream plate design carries
    real political weight. Building Bosnia, Kosovo, or similar countries
    for a commercial SDK deserves the same care as the disputed-territory
    conversation, not just a data-accuracy check.

## US and Canada sub-trackers — the federated pattern's biggest test case

40. **The US and Canada share the literal same 1956 dimension standard** —
    not a coincidence, a joint agreement. A third confirmed shared-regional-
    standard case after Mercosur, and the oldest one found by decades.
41. **Illustrated/pictorial backgrounds are a whole design tradition, not
    Eswatini's one-off.** Roughly two-thirds of US states use a scenic
    photo/graphic field (mountains, skylines, wildlife, landmarks) instead
    of a flat or gradient color. Finding #35 undersold this — it isn't an
    outlier to accommodate, it's a first-class material style this project
    needs if it ever builds most of the United States.
42. **Vermont debosses its characters — the only confirmed *recessed*-
    character case**, the opposite relief direction from every material
    assumption in `_PlatePainter`'s `_emboss` (which always raises the
    face). A real second relief mode, not a variant of the first.
43. **Tennessee excludes every vowel** — the single most aggressive
    character restriction found across every jurisdiction (state or
    country) researched.
44. **Newfoundland and Labrador confirms the *opposite* end of the driver-
    vs-vehicle-bound axis explicitly** — its plates are stated to stay with
    the vehicle, not the owner, giving finding #27 a clean documented
    baseline on both sides now.
45. **Format oscillation (finding #37) is confirmed a second time.**
    Nunavut's plates were bear-shaped, then became rectangular in 2012 — a
    reversion, not just Slovenia's one instance.

## Findings from the category-completeness cleanup pass

46. **A country can be actively considering the driver-bound model right
    now, not just already have it.** Suriname was reported (Aug 2021) to
    be examining a switch to a person-bound license plate. If it went
    through, that's a 3rd confirmed case of finding #17/#27 — and the
    first one caught mid-transition rather than after the fact, worth
    revisiting this dossier specifically to check current status before
    building Suriname.
47. **A category can be protected by excluding another category from its
    colors**, not just protected by giving itself one. El Salvador legally
    bars private vehicles from yellow (with or without the taxi's black/
    white stripe) specifically to preserve taxis' visual identity — the
    inverse of every other exclusion reason found (which protect
    legibility or cultural sensitivity, not one category's exclusivity
    over another).
48. **A category rule can govern more than the plate.** El Salvador's taxi
    requirement includes a mandatory 30cm black-and-white checkered body
    stripe with a "Taxi" legend — the marking scheme extends past the
    plate itself, the first confirmed case of that.
49. **The cleanup pass confirms the "first pass" honesty label is doing its
    job.** Of 7 dossiers flagged as missing category data, a genuinely
    targeted second search closed the gap for 4 (Ghana, Venezuela,
    El Salvador, Moldova) and confirmed the other 3 (Nicaragua, Suriname,
    Sudan) are actually unreachable by search, not under-searched. Worth
    running this same second-pass process across the rest of the ~150
    "first pass" dossiers rather than assuming every gap is a search miss.

## Findings from the Pacific micro-states

50. **Federation can go all the way down to 16 states in a 340km² country.**
    Palau's states each control their own plate design and even their own
    *material* — stamped metal, hand-painted, stencilled, printed
    laminated paper on wood, plexiglass, plastic, all coexisting. Material
    diversity this wide means "the plate is metal or reflective sheeting"
    can't be a baseline assumption once Pacific micro-states are in scope.
    Palau also confirms a 3rd format oscillation (a 1990s unification
    attempt reverted back to state-by-state) — and this one is tied
    directly to political conflict, like Bosnia/Kosovo, not a design
    preference.
51. **Owner-manufactured plates (finding #38) are a real Pacific-islands
    pattern, not Vanuatu's one-off.** Confirmed independently, with nearly
    identical wording, for Tonga and Kiribati too; Solomon Islands only
    moved away from it in 2014. Worth reframing #38 as a regional pattern
    to expect, not a single exception to design around.
52. **French DOM-TOM territories inherit their country/region code from
    France's own internal numbering system**, not a locally designed one —
    French Polynesia (987) and New Caledonia (988) both come from the
    3-digit system France assigned its overseas territories, originally
    all sharing one code (97). Expect the same for any other French
    overseas territory researched later.

## Two more from the Caribbean sweep

53. **A redesign can be forced by a production/legibility failure**, not
    just politics or capacity. Cayman Islands' 2003 quincentennial plates
    used white characters on scenic backgrounds, proved illegible, and
    were recalled and reissued — a new "why did the design change"
    reason distinct from every other one logged (#15, #20, #26, #34).
54. **Sub-national design customization can happen at the individual-
    island level within an already-small country.** Turks and Caicos'
    Dec 2022 redesign gives each island its own graphic — finer-grained
    than even Palau's state-level federation, inside one small territory
    that otherwise runs a single official format/color scheme.

## Findings from the European micro-states

55. **Desirable registrations are a real secondary market with large
    confirmed sums, not a hypothetical feature.** Guernsey's "007" sold
    for £240,000 (2015); Jersey's "J4" sold for £380,000 (2020) and
    directly funded a government EV purchase. Worth remembering for the
    business side of a paid SDK — a "which plates are desirable" concept
    isn't speculative in every market, it's an existing economy in at
    least these two jurisdictions.
56. **A design element can be removed for leaving a supranational body,
    not just for a treaty renaming one.** Gibraltar dropped the EU flag/
    stars in Jan 2021 post-Brexit — distinct from North Macedonia's
    Prespa-Agreement code rename (#North Macedonia): this is a symbol
    removed because membership ended, not a code changed because a name
    changed.
57. **An EV-encoding scheme can be tried and then retired**, not just vary
    by country. San Marino's `VE` electric-vehicle prefix ran 2019-2023
    and was discontinued — the first confirmed rollback of an EV
    mechanism itself, alongside the 6+ different EV-encoding approaches
    already catalogued.
58. **Liechtenstein is the only sovereign European state defaulting to a
    black field** (not just black ink) for ordinary passenger cars since
    2001 — the most committed dark-default case found, beyond Belgium's
    red ink or Guyana's white/black split.

## Next input needed

Real photos for Jordan, Kuwait and Saudi Arabia — every open question listed
in the three dossiers ultimately reduces to "confirm against a photo." This
is the highest-leverage next step before writing any more core/ code, since
another data point could just as easily collapse `ColorBandStrip`/
`EmblemStrip` into one shape or add a third.
