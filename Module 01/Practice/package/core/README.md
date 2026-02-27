# Core package – Module 01 Practice (Clean Architecture)

This is the **core** Flutter project under `package/core/`. All **10** Module 01 Practice assignments (PC 01–PC 10) are implemented in one app. Common code (theme, navigation) used across assignments lives here.

## Run

From this directory (`package/core/`):

```bash
flutter pub get
flutter run
```

Use the home list to open each PC solution.

## Structure

- **`lib/core/`** – Shared infrastructure (theme, routes).
- **`lib/features/home/`** – Entry list (presentation).
- **`lib/features/pc01_wrap_products/`** … **`pc10_grid_layout/`** – Per-assignment folder: solution code (presentation, domain) **and** assignment problem statement (README.md, assets) inside the same feature folder.

## Reference

- Problem statements: `lib/features/pc01_wrap_products/README.md` … `lib/features/pc10_grid_layout/README.md`
- Original solutions: `docs/resources to help scrape.txt` (Module 1 Practice Q1–Q10)
- Solvability summary: `../Module_01_notes.md`
