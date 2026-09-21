# Mexico — evidence dossier

**Status: first pass.** [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Mexico) plus a couple of plate-hobbyist sites.

## What's known
- **Single national numbering system, but state-designed physical plates**
  — a middle case between a unitary country (Iraq) and a fully federated one
  (US/UAE/Australia/South Africa): the *format* is national, the *visual
  design* (colors, state name, coat of arms) is per-state, and **each state
  redesigns roughly every 3 years**. A third axis (design churn over time,
  independent of the format itself) not modeled anywhere yet.
- Format: `ABC1234` (3 letters + 4 digits) nationally, with letter blocks
  allocated per state; a newer `AAA-000-A` variant also in use.
- Dimensions: 300×150mm.

## Open questions
- Whether "state redesigns every ~3 years" means the SDK would need to
  track *dated* per-state design versions to stay accurate, or whether one
  representative design per state is an acceptable simplification for v1 —
  a scope decision, not just a data question.
- Full state color/design table — not gathered yet.
