# Module 04 Practice – Notes

---

## Summary Table

| PC  | Topic                           | Dependencies      | Notes                                                               |
| --- | ------------------------------- | ----------------- | ------------------------------------------------------------------- |
| 31  | Form + Provider (pass data)     | Flutter, provider | Form with 2 TextFormFields, submit, Provider to another widget      |
| 32  | Provider counter                | Flutter, provider | Counter value + increment button, display in another widget         |
| 33  | Provider list of strings        | Flutter, provider | List + add function, display in another widget                      |
| 34  | Provider counter + reset        | Flutter, provider | Counter + reset to zero, display + reset button                     |
| 35  | Reorder list drag and drop      | Flutter SDK       | ReorderableListView                                                 |
| 36  | List add/delete items           | Flutter SDK       | ListTile with delete; add button                                    |
| 37  | Merge two lists, no duplicates  | Dart/Flutter      | Two lists of objects, merge and dedupe (e.g. toSet), show in UI     |
| 38  | JSON from assets + CircleAvatar | Flutter SDK       | Load JSON from assets, ListView.builder, CircleAvatar (e.g. yellow) |
| 39  | Firestore add items via Form    | Firebase          | Form to add documents to Firestore                                  |
| 40  | Firestore update document       | Firebase          | Function(collection, docId, data) to update a doc                   |
| 41  | Firestore add and display       | Firebase          | Text field + submit, list from Firestore                            |
| 42  | Firebase Auth sign up / log in  | Firebase          | Email/password sign up and sign in                                  |
| 43  | Firebase Auth sign up / log in  | Firebase          | Same as PC 42                                                       |

---

## Dependencies

- **PC 31–34**: `provider` package.
- **PC 35–38**: No external packages (Flutter SDK / Dart only).
- **PC 39–43**: Firebase (Firestore and/or Auth).

---

## Solvability without external services

- **PC 31–38** can be run and solved with no backend: Provider and local JSON/assets only.
- **PC 39–43** require a Firebase project (Firestore and/or Auth enabled) to work fully.
