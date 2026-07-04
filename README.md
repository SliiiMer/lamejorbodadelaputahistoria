# La Mejor Boda de la Puta Historia 💍

Wedding website for Jen & Cristian — lamejorbodadelaputahistoria.com

Built with [Astro](https://astro.build), deployed to GitHub Pages, backed by [Supabase](https://supabase.com) for RSVP submissions.

The homepage doubles as the RSVP form. It's only unlocked for visitors carrying the invite
code printed as a QR on the invitation (`?invite=...`); anyone else just sees a "invalid link"
message. The real enforcement lives in the Supabase row-level security policy (see
[`supabase/schema.sql`](supabase/schema.sql)), not in the frontend — see that file's comments
before changing the invite-gating logic.

## 🚀 Project Structure

```text
/
├── public/
│   └── favicon.svg
├── src
│   ├── layouts
│   │   └── Layout.astro
│   ├── lib
│   │   └── supabase.ts
│   └── pages
│       └── index.astro
├── supabase
│   └── schema.sql
└── package.json
```

## Environment variables

Copy `.env.example` to `.env` and fill in the Supabase anon key (Project Settings > API in the
Supabase dashboard). These are also required as GitHub Actions secrets for deploys.

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `bun install`             | Installs dependencies                            |
| `bun run dev`             | Starts local dev server at `localhost:4321`      |
| `bun run build`           | Build your production site to `./dist/`          |
| `bun run preview`         | Preview your build locally, before deploying     |
| `bun run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `bun run astro -- --help` | Get help using the Astro CLI                     |
