# Module 03 Practice – Notes

---

## Summary Table

| PC  | Topic                                 | Dependencies       | Notes                                                          |
| --- | ------------------------------------- | ------------------ | -------------------------------------------------------------- |
| 21  | Drawing app (white bg, paint)         | Flutter SDK        | `CustomPainter`, `GestureDetector`, stroke drawing             |
| 22  | Platform-specific text (web/Android)  | Flutter SDK        | `kIsWeb` from `foundation.dart`                                |
| 23  | Random lucky number (max 350)         | Flutter SDK        | `Random.nextInt`, `ElevatedButton`, state                      |
| 24  | Buttons A/B: image vs contact         | Flutter SDK        | Flag, `Image.network` or assets, `Column` for name/phone/email |
| 25  | Odd/even list (green/red)             | Flutter SDK        | `ListView.builder`, `numberList[index] % 2 == 0`               |
| 26  | AlertDialog form + SharedPreferences  | shared_preferences | `showDialog`, `TextFormField`, `SharedPreferences`             |
| 27  | Alternating images by index           | Flutter SDK        | `GridView.builder`, `Image.network`, odd/even index            |
| 28  | GIF with timer (≤15 s)                | Flutter SDK        | `Future.delayed`, flag, GIF (asset or network)                 |
| 29  | Move widget (top-left ↔ bottom-right) | Flutter SDK        | `Align`, `Alignment.topLeft` / `bottomRight`, state            |
| 30  | TextFormField label + save input      | Flutter SDK        | `TextFormField`, `TextEditingController`, variable             |

---

## Dependencies

- **PC 21–25, 27–30**: Flutter SDK only (no extra packages).
- **PC 26**: `shared_preferences` (in `pubspec.yaml`).
- **PC 27**: Network images via `Image.network` (no extra package).
- **PC 28**: GIF can be asset (`lib/features/pc28_gif_timer/assets/file_37706.gif`)

---

## Per-assignment detail

- **PC 21** – White background; user draws with finger/mouse; use `CustomPainter` and `GestureDetector` (Dart paint/CustomPainter, not a separate “paint library”).
- **PC 22** – One screen: if `kIsWeb` show “This is for the web!!”, else “This is for android!!”.
- **PC 23** – Button generates random number 1–350; display with `Text` + `ElevatedButton`.
- **PC 24** – Two buttons: A shows image (asset or network), B shows name, phone, email in a column.
- **PC 25** – Fixed list `[10,12,13,56,27,29,30]`; `ListView.builder`; even = green, odd = red.
- **PC 26** – AlertDialog with first name, last name, email, phone; on submit save to SharedPreferences and show saved data on screen.
- **PC 27** – 20 items; odd index → image1 URL, even → image2 URL; index number top-left; `GridView.builder` or `ListView.builder`.
- **PC 28** – Timer ≤15 s: show GIF; after 15 s show “Running time has been over.” (`Future.delayed`).
- **PC 29** – One widget (e.g. `Container` or `Image`); button toggles position between top-left and bottom-right using `Align`.
- **PC 30** – Single `TextFormField` with label; on save, store value in a variable (and optionally display it).
