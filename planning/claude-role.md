# Claude role

Scope: what I do directly, without you having to hand-hold each step. Status
markers reflect what's actually done as of this writing.

1. [x] **Propose a launch batch**, later superseded — the scope is now
   confirmed global, not a fixed batch. `planning/countries/_tracker.md` is
   the master list: ~230 countries/territories, region-grouped, each with a
   status (not started / pattern only / cross-referenced / photo-verified /
   shipped) and a suggested (not decided) batch order radiating out from the
   4 MENA countries already touched.
2. [x] **Build and cross-reference the evidence dossier per launch-scope
   country** — `planning/countries/{jordan,kuwait,saudi-arabia}.md`. First
   pass was a single Wikipedia summary each; second pass cross-checked each
   against 2-4 independent sources (academic paper for Jordan, Wikimedia
   Commons real-photo categories for Kuwait/Saudi, matriculasdelmundo — the
   same domain already trusted in this package's own README — for all
   three). Outcome wasn't uniform: Kuwait's category list, initially flagged
   as possibly fabricated, turned out to be real; Saudi Arabia's
   category-color scheme and script-layout direction turned up a genuine
   conflict between two source clusters, not just a confidence gap. Both
   outcomes are recorded, not smoothed over.
3. [x] **Draft the `CountryPlateSpec`-equivalent interfaces** —
   `lib/src/core/plate_blank.dart`. Unwired, additive only; `flutter analyze`
   and `flutter test` both still pass clean against the shipped package.
4. [x] **Write up the architecture implications** of what the dossiers
   surfaced — `planning/architecture-notes.md` — so the next round of code
   is justified by evidence (square blanks, emblem strips, shape-coded
   categories, always-dual-script) rather than by guessing ahead of data.
5. [ ] **Port Iraq into the new architecture.** Deliberately not started yet
   — see `flutter-role.md` for why (only one confirmed non-Iraq data point
   so far isn't enough to commit Iraq to a shape that might need to change
   again for country #2).
6. [ ] **Implement each new country module** once its dossier is
   photo-verified. Blocked on real photos, not on anything I can source
   myself from an automated web pass.
7. [ ] **Golden tests + citation files per country**, alongside each
   implementation as it lands.
8. [ ] **Keep README/docs updated** per country added.
9. [x] **Report back with the current state and open blockers** instead of
   pushing further into code that unverified data would make throwaway —
   this document.

## What I need from you to keep moving

Text/API-based research is now genuinely exhausted for these three —
multiple independent sources, cross-referenced, with real disagreements
surfaced rather than papered over (see each dossier's "Open questions"
section). What's left needs **actual vision**: real photos, specifically to
resolve Saudi Arabia's stacked-vs-side-by-side layout conflict and
category-color conflict, and to confirm Jordan's temporary-plate color and
Kuwait's per-category colors. I have a way to get that (browser screenshots,
which I can actually see) but held off after it was declined earlier this
session — say the word and I'll use it, or share photos/links yourself and
I'll work from those instead.
