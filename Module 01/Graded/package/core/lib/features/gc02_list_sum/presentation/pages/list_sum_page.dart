import 'package:flutter/material.dart';

import '../../domain/list_sum.dart' show sumOfList;

/// GC 02: Find the sum of numbers in a List.
class ListSumPage extends StatelessWidget {
  const ListSumPage({super.key});

  static const List<num> _numbers = [10, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    final sum = sumOfList(_numbers);
    return Scaffold(
      appBar: AppBar(title: const Text('GC 02 – Sum of List')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('List: $_numbers'),
              const SizedBox(height: 16),
              Text('Sum: $sum', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ),
    );
  }
}
