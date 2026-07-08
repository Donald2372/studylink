# Study Space continuation update

This update keeps StudyLink as a normal Vercel/Render/Supabase web application.

## Planning
- Personal blocks can be created, edited, and deleted.
- Real tutor bookings are displayed inside the calendar as synchronized, locked blocks.
- Unplanned tasks can be scheduled in one click.
- Day/week views and week navigation remain available.

## Goals
- Goal creation now includes deadline and weekly effort.
- Priority and milestones remain persisted per user.

## Notes
- Search includes title, content, and tags.
- Sorting works by recent, favorites, or alphabetical order.
- Editing uses debounced autosave to avoid a backend request for every keystroke.

No Android/APK deployment module was added.
