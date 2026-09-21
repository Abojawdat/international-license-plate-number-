# Backend role

Scope: everything needed to sell and maintain the multi-country plate SDK that
sits *outside* the Flutter package itself. No license-key enforcement — this
is a service a buyer may use or not, not a DRM'd product. The package must
keep working fully offline; nothing here may become a hard runtime dependency
of the SDK.

## 1. Delivery / storefront

Get paid, hand over the code. No license check required.

- Pick a channel: hosted checkout (Gumroad/LemonSqueezy-style), a private
  pub.dev-style registry, or a plain "buy → get a Git/zip link" flow.
- Decide what a purchase actually grants: the whole multi-country package, or
  tiers by country count/bundle.
- Handle delivery of updates to existing buyers (new country added, bug fix)
  without needing a licensing/auth layer.

## 2. Evidence-intake pipeline

The README already invites "open an issue with a photo" for corrections; that
needs to scale from one country to many.

- A submission form (photo + country + what's wrong) and a review queue.
- Storage for submitted photos and reviewer notes.
- A path from "accepted correction" into the per-country evidence dossier
  that the Flutter/Claude roles consume (see `planning/` sibling docs once
  written).

## 3. Optional update channel

For pushing corrected plate data between package releases (a country changes
its scheme faster than you can ship a new package version).

- Must be strictly **opt-in** — the SDK ships fully correct and fully
  functional with zero network calls by default. This is a nice-to-have, not
  infrastructure the package depends on.
- If built: a simple versioned data endpoint per country, and a way for the
  SDK to check "is my bundled data current" without requiring it.

## 4. Usage / interest analytics (optional)

Not required to ship. Useful only for prioritizing which countries to build
next.

- Keep it privacy-light: which countries/formats are requested or used, not
  who's using them.
- Decide whether this is worth building at all before the country catalogue
  is large enough for the data to mean anything.

## 5. Admin tooling for evidence curation

A place to see per-country status at a glance as the catalogue grows.

- "Sourced and cited" vs. "gap flagged, needs a photo/spec" per country.
- Surfaces incoming submissions from the intake pipeline (#2) for review.
- Doesn't need to be more than an internal dashboard/spreadsheet-replacement
  until the number of countries makes that unworkable.

---

Open decision this doc doesn't resolve: which storefront/delivery mechanism
(#1) to use — that choice affects how buyers receive updates (#1) and whether
analytics (#4) are even collectible.
