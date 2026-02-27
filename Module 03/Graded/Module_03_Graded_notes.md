# Module 03 Graded – Notes

---

## Summary Table

| GC    | Topic                                           | Dependencies   | Notes                                                                 |
| ----- | ----------------------------------------------- | -------------- | --------------------------------------------------------------------- |
| GC 11 | Container similar to reference image            | Flutter SDK    | Match layout from `lib/features/gc11_container_ui/assets/file_37751.png` (add asset if needed) |
| GC 12 | Animated text on hover                           | Flutter SDK    | Transform text appearance on hover (e.g. `MouseRegion`, `AnimatedDefaultTextStyle`) |
| GC 13 | Slide animation with image                       | Flutter SDK    | Slide animation featuring an image                                    |
| GC 14 | Firestore users – email & name in ListTile       | Firebase       | Collection "users"; display in ListTiles. Requires Firebase config.   |
| GC 15 | Firestore image links in cards + slide transition| Firebase       | Fetch image links + text; cards with left-to-right slide; scrollable. Requires Firebase config. |

---

## Per-assignment detail

- **GC 11** – One screen: build a container matching the reference image (see README assets). Add image to `lib/features/gc11_container_ui/assets/` and register in `pubspec.yaml` if needed.
- **GC 12** – One screen: animated text that changes appearance on hover (e.g. color, size, or style). Use `MouseRegion` and `AnimatedDefaultTextStyle` or similar.
- **GC 13** – One screen: slide animation that features an image (e.g. `SlideTransition` or `AnimationController` with image).
- **GC 14** – Firestore: read from collection "users"; show each user’s email and name in a `ListTile`. Requires Firebase project and `Firebase.initializeApp()` before use.
- **GC 15** – Firestore: fetch documents with image links and text; show in cards with a left-to-right slide transition; make the list scrollable. Requires Firebase project.

---

## References

- Problem statements: `lib/features/gcNN_*/README.md`
- Track layout and run instructions: **`README.md`** (this folder)
