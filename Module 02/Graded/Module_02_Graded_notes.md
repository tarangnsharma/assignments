# Module 02 Graded – Notes

---

## Summary Table

| GC    | Topic                                      | Dependencies     | Notes                                                                 |
| ----- | ------------------------------------------ | ---------------- | --------------------------------------------------------------------- |
| GC 06 | Two columns – First Name / Last Name       | Flutter SDK      | `Row` + two `Expanded` + `Column` with centered `Text`                 |
| GC 07 | Button changes color of all text           | Flutter SDK      | `StatefulWidget`, single `Color` in state, apply to all `Text`        |
| GC 08 | Two screens, shared number, FAB increments | Flutter SDK      | `ValueNotifier` (or InheritedWidget) to share counter; FAB on home     |
| GC 09 | About + Home, routing, Scaffold color      | Flutter SDK      | Dedicated routing class; pass colors from Home to About screen        |
| GC 10 | Riverpod – theme + music notes             | flutter_riverpod | `StateProvider` for color/note index; optional audio for real notes  |

---

## Per-assignment detail

- **GC 06** – One screen: `Row` with two `Expanded` children, each a `Column` with `MainAxisAlignment.center` and a `Text` ("First Name" / "Last Name").
- **GC 07** – One screen: hold a `Color` in state; button updates it; all `Text` widgets use that color.
- **GC 08** – Two screens, one counter. Use `ValueNotifier<int>` (or similar) so both screens show the same value; FAB on the home screen increments it. Navigation to switch between screens.
- **GC 09** – Two screens: Home and About. Use a dedicated routing class (e.g. `onGenerateRoute` or a small `Navigator` with named routes). Home has controls to set the About screen’s Scaffold background color and AppBar color; pass those values when building the About screen.
- **GC 10** – Riverpod app: button changes AppBar and Scaffold background color and “plays” one of 10 notes. Uses `flutter_riverpod`; note playback can be SnackBar/indicator or an audio package (e.g. `audioplayers`) for real sound.

---

## References

- Problem statements: `lib/features/gcNN_*/README.md`
- Track layout and run instructions: **`README.md`** (this folder)
