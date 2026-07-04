# Project

Wedding website for Jen & Cristian, deployed at lamejorbodadelaputahistoria.com. Built with Astro,
static-hosted on GitHub Pages, backed by Supabase for RSVP submissions. All user-facing copy is
in Spanish; code, comments, and docs stay in English.

## RSVP / invite-code gating

The homepage (`src/pages/index.astro`) shows an RSVP form only to visitors with a valid
`?invite=` query param. Because this is a static site, the frontend never knows whether the code
is actually correct — it only checks that *some* code is present, as a cheap UX filter. The real
enforcement is a Supabase row-level security policy in `supabase/schema.sql` that rejects inserts
with the wrong `invite_code`. Do not reintroduce a client-side secret comparison (e.g. baking the
code into a `PUBLIC_*` env var) — anything under `import.meta.env.PUBLIC_*` ships in the built JS
bundle and is trivially readable by anyone.

## Development

When starting the dev server, use background mode:

```
astro dev --background
```

Manage the background server with `astro dev stop`, `astro dev status`, and `astro dev logs`.

## Documentation

Full documentation: https://docs.astro.build

Consult these guides before working on related tasks:

- [Adding pages, dynamic routes, or middleware](https://docs.astro.build/en/guides/routing/)
- [Working with Astro components](https://docs.astro.build/en/basics/astro-components/)
- [Using React, Vue, Svelte, or other framework components](https://docs.astro.build/en/guides/framework-components/)
- [Adding or managing content](https://docs.astro.build/en/guides/content-collections/)
- [Adding styles or using Tailwind](https://docs.astro.build/en/guides/styling/)
- [Supporting multiple languages](https://docs.astro.build/en/guides/internationalization/)
