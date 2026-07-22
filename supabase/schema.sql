-- Run this in the Supabase SQL editor (Project > SQL Editor).
-- Safe to re-run: it only creates what's missing and replaces the policy.

create table if not exists public.rsvps (
	id uuid primary key default gen_random_uuid(),
	created_at timestamptz not null default now(),
	name text not null,
	attending boolean not null,
	allergy text,
	guests jsonb not null default '[]'::jsonb, -- [{ "name": "...", "allergy": "..." }]
	comments text
);

alter table public.rsvps add column if not exists pre_wedding boolean not null default false;

alter table public.rsvps add column if not exists invite_code text not null default '';
alter table public.rsvps alter column invite_code drop default;

alter table public.rsvps enable row level security;

drop policy if exists "Anyone can submit an RSVP" on public.rsvps;
drop policy if exists "Only invited guests can submit an RSVP" on public.rsvps;

-- Only submissions carrying the secret code printed (as a QR) on the invitation
-- are accepted. The anon key alone is not enough to insert a row.
--
-- This file is committed to the repo, so it must never contain the real code.
-- Before running in the SQL editor, replace <INVITE_CODE> below with the actual
-- value from your local .env (INVITE_CODE=...) — then discard your edited copy,
-- don't commit it.
create policy "Only invited guests can submit an RSVP"
	on public.rsvps
	for insert
	to anon
	with check (invite_code = '<INVITE_CODE>');
