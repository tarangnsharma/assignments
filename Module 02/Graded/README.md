# Module 02 | Graded

Graded assignments (GC 06–GC 10) and their solutions. This folder is the Flutter app.

## Layout

- **`lib/core/`** – Common code (theme, navigation).
- **`lib/features/home/`** – Home screen listing all graded assignments.
- **`lib/features/gc06_two_columns/`** … **`lib/features/gc10_riverpod_theme_sound/`** – Each folder holds **both** the assignment (README + assets) **and** the solution code (presentation, domain when needed).
- **`Module_02_Graded_notes.md`** – Notes for the graded assignments.

## Run the app

From this folder (Graded):

```bash
flutter pub get
flutter run
```

## Assignment + solution (per GC)

Each lives in one feature folder under **`lib/features/`**:

| GC  | Feature folder (assignment README + assets + solution code)     |
| --- | ----------------------------------------------------------------- |
| 06  | `lib/features/gc06_two_columns/`                                 |
| 07  | `lib/features/gc07_text_color/`                                  |
| 08  | `lib/features/gc08_shared_counter/`                              |
| 09  | `lib/features/gc09_about_home/`                                  |
| 10  | `lib/features/gc10_riverpod_theme_sound/`                        |

Problem statements are in **`lib/features/gcNN_*/README.md`**. See **`Module_02_Graded_notes.md`** for dependencies and summary.

All paths above are relative to this folder.
