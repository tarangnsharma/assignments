# Module 01 | Graded

Graded assignments (GC 01–GC 05) and their solutions.

## Layout

- **`package/core/`** – Core Flutter app and shared code for all assignments.
  - **`lib/core/`** – Common code (theme, navigation).
  - **`lib/features/gc01_web_title/`** … **`lib/features/gc05_longest_word/`** – Each folder holds **both** the assignment (README + assets) **and** the solution code (presentation, domain).
- **`Module_01_Graded_notes.md`** – Notes for the graded assignments.

## Run the app

```bash
cd package/core
flutter pub get
flutter run
```

## Assignment + solution (per GC)

Each lives in one feature folder under **`package/core/lib/features/`**:

| GC  | Feature folder (assignment README + assets + solution code) |
| --- | ----------------------------------------------------------- |
| 01  | `lib/features/gc01_web_title/`                               |
| 02  | `lib/features/gc02_list_sum/`                                |
| 03  | `lib/features/gc03_fibonacci/`                              |
| 04  | `lib/features/gc04_image_appbar/`                           |
| 05  | `lib/features/gc05_longest_word/`                          |

All paths above are relative to **`package/core/`**.
