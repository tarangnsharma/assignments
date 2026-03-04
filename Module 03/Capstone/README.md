# Module 03 | [CP 01 | Capstone Project](https://tataneuskills.instructure.com/courses/572/assignments/16130)

This folder is the Flutter app for the Module 03 | [CP 01 | Capstone Project](https://tataneuskills.instructure.com/courses/572/assignments/16130). All assignment content and solution code live in feature folders under `lib/features/`.

## Layout

- **`lib/core/`** – Shared theme (`app_theme.dart`) and navigation (`app_routes.dart`).
- **`lib/features/home/`** – Home screen that lists Capstone assignments and navigates to each.
- **`lib/features/cp01_cake_ordering/`** – CP 01 Capstone: cake-ordering app (User & Admin UI). Contains the assignment README, assets, and presentation pages. UI matches the design assets (admin panel, admin dialog, user login, user menu, user drawer, order status).

## How to run

From this folder:

```bash
flutter pub get
flutter run
```

If platform folders (`android/`, `ios/`) are missing, run:

```bash
flutter create .
```

Then `flutter pub get` and `flutter run`.

## Assignment

| Assignment | Feature folder                     |
| ---------- | ---------------------------------- |
| CP 01      | `lib/features/cp01_cake_ordering/` |
