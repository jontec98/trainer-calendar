-- Outdoor / non-TrainerApp activities (Garmin rides, commutes, runs) copied from intervals.icu by the coach
-- (service role). The web calendar uses them to mark a planned session "Done outside". Safe to re-run.
create table if not exists public.outdoor_activities (
  user_id     uuid not null default auth.uid() references auth.users on delete cascade,
  id          text not null,         -- intervals.icu activity id, e.g. i209951444
  date        date not null,         -- local date
  start_local timestamp,             -- local start time
  type        text,                  -- Ride, Run, Walk, ...
  name        text,
  device      text,
  moving_s    int,
  distance_m  numeric,
  load        numeric,               -- intervals.icu training load
  avg_hr      int,
  updated_at  timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.outdoor_activities enable row level security;
drop policy if exists "own outdoor read" on public.outdoor_activities;
create policy "own outdoor read" on public.outdoor_activities for select to authenticated
  using (auth.uid() = user_id);

grant select on public.outdoor_activities to authenticated;
grant all on public.outdoor_activities to service_role;
