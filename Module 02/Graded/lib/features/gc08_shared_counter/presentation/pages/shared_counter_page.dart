import 'package:flutter/material.dart';

/// GC 08: Two screens sharing one counter; FAB on home increases value for both.
class SharedCounterPage extends StatefulWidget {
  const SharedCounterPage({super.key});

  @override
  State<SharedCounterPage> createState() => _SharedCounterPageState();
}

class _SharedCounterPageState extends State<SharedCounterPage> {
  final ValueNotifier<int> _value = ValueNotifier<int>(0);

  @override
  void dispose() {
    _value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _value,
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('GC 08 – Screen 1')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Value: $value', style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _Screen2(valueNotifier: _value),
                    ),
                  ),
                  child: const Text('Go to Screen 2'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _value.value++,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class _Screen2 extends StatelessWidget {
  const _Screen2({required this.valueNotifier});

  final ValueNotifier<int> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: valueNotifier,
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('GC 08 – Screen 2')),
          body: Center(
            child: Text('Value: $value', style: const TextStyle(fontSize: 32)),
          ),
        );
      },
    );
  }
}
