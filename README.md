# Training Calendar

Mobile web view of the TrainerApp plan (`planned_workouts`) and completed rides (`rides`) in Supabase.
Static page, no build step, served by GitHub Pages.

- Sign in with the TrainerApp account (email + password).
- The page holds only the project URL and the *publishable* key; row-level security limits every
  signed-in user to their own rows. Never put the secret / service-role key here.
- iPhone: open the Pages URL in Safari → Share → *Add to Home Screen*.

Database: the SQL for every table this page reads (incl. `daily_fitness`, `outdoor_activities`) lives in the app repo
(`jontec98/TrainerApp-Android`, `supabase/schema.sql` + `supabase/migrations/`). `daily_fitness` and
`outdoor_activities` are filled per rider by the coach's intervals.icu sync.
