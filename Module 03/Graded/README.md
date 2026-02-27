# Module 03 | Graded

Graded assignments (GC 11–GC 15) and their solutions. This folder is the Flutter app.

## Layout

- **`lib/core/`** – Common code (theme, navigation).
- **`lib/features/home/`** – Home screen listing all graded assignments.
- **`lib/features/gc11_container_ui/`** … **`lib/features/gc15_firestore_cards_slide/`** – Each folder holds **both** the assignment (README + assets) **and** the solution code (presentation, domain when needed).
- **`Module_03_Graded_notes.md`** – Notes for the graded assignments.

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
| 11  | `lib/features/gc11_container_ui/`                                 |
| 12  | `lib/features/gc12_animated_text_hover/`                          |
| 13  | `lib/features/gc13_slide_animation_image/`                        |
| 14  | `lib/features/gc14_firestore_users/`                              |
| 15  | `lib/features/gc15_firestore_cards_slide/`                        |

Problem statements are in **`lib/features/gcNN_*/README.md`**. See **`Module_03_Graded_notes.md`** for dependencies and summary.

All paths above are relative to this folder.
