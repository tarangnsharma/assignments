import 'package:flutter/material.dart';

import '../../domain/counter_view_model.dart';

/// GC 19: Counter app with MVVM – View observes ViewModel via ListenableBuilder.
class MvvmCounterPage extends StatefulWidget {
  const MvvmCounterPage({super.key});

  @override
  State<MvvmCounterPage> createState() => _MvvmCounterPageState();
}

class _MvvmCounterPageState extends State<MvvmCounterPage> {
  final CounterViewModel _viewModel = CounterViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 19 – MVVM Counter')),
      body: Center(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have pushed the button this many times:'),
                Text(
                  '${_viewModel.count}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
