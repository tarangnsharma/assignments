import 'package:flutter/material.dart';

/// PC 35: Reorder list by drag and drop (ReorderableListView).

class ReorderListPage extends StatefulWidget {
  const ReorderListPage({super.key});

  @override
  State<ReorderListPage> createState() => _ReorderListPageState();
}

class _ReorderListPageState extends State<ReorderListPage> {
  final List<String> _items = ['item1', 'item2', 'item3', 'item4', 'item5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 35 – Reorder List')),
      body: ReorderableListView.builder(
        itemCount: _items.length,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;
          setState(() {
            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
        itemBuilder: (context, index) {
          final name = _items[index];
          return ListTile(
            key: ValueKey(name),
            leading: const Icon(Icons.drag_handle),
            title: Text(name),
          );
        },
      ),
    );
  }
}
