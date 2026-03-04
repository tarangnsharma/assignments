import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// PC 33: Provider list of strings + add; display in another widget.

class StringListModel extends ChangeNotifier {
  final List<String> _items = [];
  List<String> get items => List.unmodifiable(_items);

  void add(String s) {
    _items.add(s);
    notifyListeners();
  }
}

class ProviderListPage extends StatefulWidget {
  const ProviderListPage({super.key});

  @override
  State<ProviderListPage> createState() => _ProviderListPageState();
}

class _ProviderListPageState extends State<ProviderListPage> {
  final StringListModel _listModel = StringListModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StringListModel>.value(
      value: _listModel,
      child: Scaffold(
        appBar: AppBar(title: const Text('PC 33 – Provider List')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _AddRow(),
              const SizedBox(height: 16),
              const Expanded(child: _ListDisplay()),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddRow extends StatefulWidget {
  @override
  State<_AddRow> createState() => _AddRowState();
}

class _AddRowState extends State<_AddRow> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'New item',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _add(),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _add,
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _add() {
    final s = _controller.text.trim();
    if (s.isNotEmpty) {
      context.read<StringListModel>().add(s);
      _controller.clear();
    }
  }
}

class _ListDisplay extends StatelessWidget {
  const _ListDisplay();

  @override
  Widget build(BuildContext context) {
    return Consumer<StringListModel>(
      builder: (context, model, _) {
        if (model.items.isEmpty) {
          return const Center(child: Text('No items yet. Add some above.'));
        }
        return ListView.builder(
          itemCount: model.items.length,
          itemBuilder: (context, i) => ListTile(title: Text(model.items[i])),
        );
      },
    );
  }
}
