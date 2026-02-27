import 'package:flutter/material.dart';

import '../../domain/fibonacci.dart' show fibonacciUpTo;

/// GC 03: Fibonacci series up to a given number.
class FibonacciPage extends StatelessWidget {
  const FibonacciPage({super.key});

  static const int _max = 90;
  static final List<int> _series = fibonacciUpTo(_max);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 03 – Fibonacci')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Fibonacci up to $_max:', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(_series.join(', '), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
