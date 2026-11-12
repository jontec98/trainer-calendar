# Training Calendar

Mobile web view of the TrainerApp plan (`planned_workouts`) and completed rides (`rides`) in Supabase.
Static page, no build step, served by GitHub Pages.

- Sign in with the TrainerApp account (email + password).
- The page holds only the project URL and the *publishable* key; row-level security limits every
  signed-in user to their own rows. Never put the secret / service-role key here.
- iPhone: open the Pages URL in Safari → Share → *Add to Home Screen*.
