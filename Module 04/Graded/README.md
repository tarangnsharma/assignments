# Module 04 | Graded

Graded assignments (GC 16–GC 20) and their solutions. This folder is the Flutter app.

## Layout

- **`lib/core/`** – Common code (theme, navigation).
- **`lib/features/home/`** – Home screen listing all graded assignments.
- **`lib/features/gc16_persistent_textfield/`** … **`lib/features/gc20_todo_firebase/`** – Each folder holds **both** the assignment (README + assets) **and** the solution code (presentation, domain when used).
- **`Module_04_Graded_notes.md`** – Notes for the graded assignments (dependencies, summary).

## Run the app

From this folder (Graded):

```bash
flutter pub get
flutter run
```

## Assignment + solution (per GC)

Each lives in one feature folder under **`lib/features/`**:

| GC  | Feature folder (assignment README + assets + solution code)   |
| --- | -------------------------------------------------------------- |
| 16  | `lib/features/gc16_persistent_textfield/`                     |
| 17  | `lib/features/gc17_auth/`                                      |
| 18  | `lib/features/gc18_comments_api/`                              |
| 19  | `lib/features/gc19_mvvm_counter/`                              |
| 20  | `lib/features/gc20_todo_firebase/`                             |

Problem statements: see **`lib/features/<feature>/README.md`** for each assignment.  
Module-level notes (dependencies, solvability): **`Module_04_Graded_notes.md`**.

All paths above are relative to this folder.
