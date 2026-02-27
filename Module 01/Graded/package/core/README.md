# Core package – Module 01 Graded (Clean Architecture)

This is the **core** Flutter project under `package/core/`. All **5** Module 01 Graded assignments (GC 01–GC 05) are implemented in one app. Common code (theme, navigation) used across assignments lives here.

## Run

From this directory (`package/core/`):

```bash
flutter pub get
flutter run
```

Use the home list to open each GC solution.

## Structure

- **`lib/core/`** – Shared infrastructure (theme, routes).
- **`lib/features/home/`** – Entry list (presentation).
- **`lib/features/gc01_web_title/`** … **`gc05_longest_word/`** – Per-assignment folder: solution code (presentation, domain) **and** assignment problem statement (README.md, assets) inside the same feature folder.

## Reference

- Problem statements: `lib/features/gc01_web_title/README.md` … `lib/features/gc05_longest_word/README.md`
- Notes: `../Module_01_Graded_notes.md`
