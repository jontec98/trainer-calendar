-- Daily fitness snapshot copied from intervals.icu by the coach (service role).
-- The web calendar reads it; signed-in users can only read their own rows. Safe to re-run.
create table if not exists public.daily_fitness (
  user_id     uuid not null default auth.uid() references auth.users on delete cascade,
  date        date not null,
  ctl         numeric,      -- fitness (42-day load)
  atl         numeric,      -- fatigue (7-day load)
  ramp        numeric,      -- CTL ramp rate
  load        numeric,      -- that day's training load (all activities in intervals.icu)
  eftp        numeric,      -- intervals.icu estimated FTP (Ride)
  resting_hr  int,
  hrv         numeric,
  sleep_s     int,
  weight      numeric,
  updated_at  timestamptz not null default now(),
  primary key (user_id, date)
);

alter table public.daily_fitness enable row level security;
drop policy if exists "own fitness read" on public.daily_fitness;
create policy "own fitness read" on public.daily_fitness for select to authenticated
  using (auth.uid() = user_id);

grant select on public.daily_fitness to authenticated;
grant all on public.daily_fitness to service_role;
