# Module 02 Practice – Notes

---

## Summary Table

| PC    | Topic                           | Dependencies | Notes                                                                                                                                                                                           |
| ----- | ------------------------------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PC 11 | Counter (increment by 1)        | Flutter SDK  | `StatefulWidget`, button, setState                                                                                                                                                              |
| PC 12 | Shopping grid                   | Flutter SDK  | `GridView.builder`, product cards                                                                                                                                                               |
| PC 13 | About Us page                   | Flutter SDK  | Column with name, company, description, motto                                                                                                                                                   |
| PC 14 | Word count from sentence        | Flutter SDK  | `TextField`, split on whitespace for word count                                                                                                                                                 |
| PC 15 | 4×4 colored grid                | Flutter SDK  | `GridView`, `Random` for colors at launch                                                                                                                                                       |
| PC 16 | Quiz result (true/wrong/total)  | Flutter SDK  | Containers for image + text; optional asset in `assets/`                                                                                                                                        |
| PC 17 | Date picker (end = start − 29d) | Flutter SDK  | `showDatePicker`, `Duration(days: 29)`                                                                                                                                                          |
| PC 18 | Clock (1 sec timer)             | Flutter SDK  | `Timer.periodic(Duration(seconds: 1))`, `DateTime.now()`                                                                                                                                        |
| PC 19 | Form validation                 | Flutter SDK  | Form, 5–15 chars name, email regex, 10-digit phone. Assignment hint suggests `FormBuilderTextField` (package: `flutter_form_builder`); solution uses standard `TextFormField` so no extra deps. |
| PC 20 | Image rotation                  | Flutter SDK  | `RotationTransition`, single button toggles clockwise/anticlockwise                                                                                                                             |

---

## Per-assignment detail

- **PC 11** – Counter: one button, increment by 1, display value.
- **PC 12** – Grid of products: `GridView.builder` or `GridView.count` with 2 columns.
- **PC 13** – About Us: single page with Column of name, company name, description, motto.
- **PC 14** – Sentence input, show word count (trim + split on whitespace).
- **PC 15** – 4×4 grid, random colors per run (e.g. `Random().nextInt(0xFFFFFF)`).
- **PC 16** – Result screen: image + text for true/wrong/total. Asset `file_37693.png` can be placed in `lib/features/pc16_quiz_result/assets/` and wired in pubspec if needed.
- **PC 17** – Pick start date with `showDatePicker`; end date = start − 29 days.
- **PC 18** – Clock updating every 1 second via `Timer.periodic`.
- **PC 19** – Form: firstName/lastName 5–15 chars, email validation, phone 10 digits. Assignment hint says “Only use FormBuilderTextField” (from `flutter_form_builder`); this solution uses built-in `TextFormField`.
- **PC 20** – One button toggles rotation (e.g. `RotationTransition` with `AnimationController`).

---
