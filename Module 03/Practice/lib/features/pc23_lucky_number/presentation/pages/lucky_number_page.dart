import 'dart:math';

import 'package:flutter/material.dart';

/// PC 23: Random lucky number (max 350) on button click.
class LuckyNumberPage extends StatefulWidget {
  const LuckyNumberPage({super.key});

  @override
  State<LuckyNumberPage> createState() => _LuckyNumberPageState();
}

class _LuckyNumberPageState extends State<LuckyNumberPage> {
  static const int maxLimit = 350;
  int _lucky = 0;
  final _random = Random();

  int _generateLucky() => _random.nextInt(maxLimit) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 23 – Lucky number')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_lucky',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => setState(() => _lucky = _generateLucky()),
              child: const Text('Get lucky number'),
            ),
          ],
        ),
      ),
    );
  }
}
