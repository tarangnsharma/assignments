import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// PC 32: Provider counter + increment button; display in another widget.

class CounterModel extends ChangeNotifier {
  int _value = 0;
  int get value => _value;
  void increment() {
    _value++;
    notifyListeners();
  }
}

class ProviderCounterPage extends StatefulWidget {
  const ProviderCounterPage({super.key});

  @override
  State<ProviderCounterPage> createState() => _ProviderCounterPageState();
}

class _ProviderCounterPageState extends State<ProviderCounterPage> {
  final CounterModel _counter = CounterModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>.value(
      value: _counter,
      child: Scaffold(
        appBar: AppBar(title: const Text('PC 32 – Provider Counter')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _CounterDisplay(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _counter.increment(),
                child: const Text('Increment'),
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
    return Consumer<CounterModel>(
      builder: (context, model, _) => Text(
        '${model.value}',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
