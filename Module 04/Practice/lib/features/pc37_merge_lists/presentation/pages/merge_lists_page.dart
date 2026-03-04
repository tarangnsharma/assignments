import 'package:flutter/material.dart';

/// PC 37: Merge two lists of objects, no duplicates; show in UI.

class Person {
  Person(this.name, this.age, this.occupation);
  final String name;
  final String age;
  final String occupation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          name == other.name &&
          age == other.age &&
          occupation == other.occupation;

  @override
  int get hashCode => Object.hash(name, age, occupation);
}

class MergeListsPage extends StatelessWidget {
  const MergeListsPage({super.key});

  static List<Person> get _list1 => [
        Person('Annu Rathour', '25', 'mobile application developer'),
        Person('Menu Gupta', '26', 'rectjs developer'),
        Person('Shubham Sharma', '26', 'java developer'),
      ];

  static List<Person> get _list2 => [
        Person('Annu Rathour', '25', 'mobile application developer'),
        Person('Menu Gupta', '26', 'rectjs developer'),
        Person('Shubham1 Sharma', '26', 'java developer'),
      ];

  static List<Person> _mergeNoDuplicates(List<Person> a, List<Person> b) {
    final set = <Person>{...a, ...b};
    return [...set];
  }

  static Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget _personTile(Person p) {
    return ListTile(
      title: Text(p.name),
      subtitle: Text('${p.age} – ${p.occupation}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final merged = _mergeNoDuplicates(_list1, _list2);
    return Scaffold(
      appBar: AppBar(title: const Text('PC 37 – Merge Lists')),
      body: ListView(
        children: [
          _sectionHeader('List 1 (${_list1.length} items)'),
          ..._list1.map(_personTile),
          _sectionHeader('List 2 (${_list2.length} items)'),
          ..._list2.map(_personTile),
          _sectionHeader('Merged – no duplicates (${merged.length} items)'),
          ...merged.map(_personTile),
        ],
      ),
    );
  }
}
