import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// PC 34: Provider counter + reset; display in another widget.

class CounterResetModel extends ChangeNotifier {
  int _value = 0;
  int get value => _value;
  void increment() {
    _value++;
    notifyListeners();
  }
  void reset() {
    _value = 0;
    notifyListeners();
  }
}

class ProviderResetPage extends StatefulWidget {
  const ProviderResetPage({super.key});

  @override
  State<ProviderResetPage> createState() => _ProviderResetPageState();
}

class _ProviderResetPageState extends State<ProviderResetPage> {
  final CounterResetModel _model = CounterResetModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterResetModel>.value(
      value: _model,
      child: Scaffold(
        appBar: AppBar(title: const Text('PC 34 – Provider Reset')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _CounterDisplay(),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () => _model.increment(),
                    child: const Text('Increment'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () => _model.reset(),
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CounterDisplay extends StatelessWidget {
  const _CounterDisplay();

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterResetModel>(
      builder: (context, model, _) => Text(
        '${model.value}',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
