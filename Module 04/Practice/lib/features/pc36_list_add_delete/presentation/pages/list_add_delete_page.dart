import 'package:flutter/material.dart';

/// PC 36: List with delete per item and add button to add item.

class ListAddDeletePage extends StatefulWidget {
  const ListAddDeletePage({super.key});

  @override
  State<ListAddDeletePage> createState() => _ListAddDeletePageState();
}

class _ListAddDeletePageState extends State<ListAddDeletePage> {
  final List<String> _data = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  void _addItem() {
    setState(() {
      _data.add('Item ${_data.length + 1}');
    });
  }

  void _removeAt(int index) {
    setState(() => _data.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 36 – List Add/Delete')),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index]),
            subtitle: Text('Index: $index'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeAt(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
