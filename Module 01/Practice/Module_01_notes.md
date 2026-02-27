# Module 01 Practice – Notes

---

## Summary Table

| PC    | Topic                                 | Dependencies | Notes                                                                              |
| ----- | ------------------------------------- | ------------ | ---------------------------------------------------------------------------------- |
| PC 01 | E-commerce responsive rows (Wrap)     | Flutter SDK  | `Wrap` widget                                                                      |
| PC 02 | Avoid bottom overflow 30px            | Flutter SDK  | `resizeToAvoidBottomInset` / `SingleChildScrollView`                               |
| PC 03 | Box with text                         | Flutter SDK  | `Container` + `BoxDecoration` / `Border`                                           |
| PC 04 | Stack layout                          | Flutter SDK  | `Stack` + `Container` (color, height, width)                                       |
| PC 05 | Counter +10 on FAB                    | Flutter SDK  | `StatefulWidget`, `FloatingActionButton`, state                                    |
| PC 06 | Exit confirmation dialog              | Flutter SDK  | `showDialog`, `AlertDialog`, `WillPopScope`/`PopScope`                             |
| PC 07 | Button to hide/show text              | Flutter SDK  | `StatefulWidget`, `bool`, conditional `Text`                                       |
| PC 08 | Select and copy text                  | Flutter SDK  | `SelectableText`                                                                   |
| PC 09 | Reverse numbers even/odd with async\* | Dart core    | `async*`, `Stream`, `Future` (no Flutter UI required for logic; can add simple UI) |
| PC 10 | Grid layout                           | Flutter SDK  | `GridView.count` / `GridView.builder`, `Container`, `Text`                         |

---

## Per-assignment detail

- **PC 01** – Layout only; `Wrap` with `direction: Axis.vertical` (or horizontal) so items wrap to next row/column. No network, no storage.
- **PC 02** – Scaffold: `resizeToAvoidBottomInset: false` and/or wrap body in `SingleChildScrollView`.
- **PC 03** – Single screen: `Container` with `decoration: BoxDecoration(border: Border.all(...))` and a `Text` child. No assets required if you use a placeholder string.
- **PC 04** – Single screen: `Stack` with multiple `Container`s (with/without explicit height/width).
- **PC 05** – Counter in state; on FAB press increment counter and display `counter * 10`.
- **PC 06** – Back button: use `PopScope` (or `WillPopScope`) and show `AlertDialog` with Yes/No; on Yes call exit or `Navigator.pop`.
- **PC 07** – `StatefulWidget` with `bool _isShown`; button toggles it; conditionally show `Text`.
- **PC 08** – One screen with `SelectableText` for the paragraph.
- **PC 09** – Dart console or a simple Flutter screen: `async*` function that yields reverse count with even/odd labels; consume with `await for`. Only `dart:async` / core Dart.
- **PC 10** – One screen: `GridView.count` (or `GridView.builder`) with `Container` + `Text` in each cell.

---
