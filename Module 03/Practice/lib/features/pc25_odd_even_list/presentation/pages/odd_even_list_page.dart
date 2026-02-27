import 'package:flutter/material.dart';

/// PC 25: List of numbers – even in green, odd in red (ListView.builder).
class OddEvenListPage extends StatelessWidget {
  const OddEvenListPage({super.key});

  static const List<int> numberList = [10, 12, 13, 56, 27, 29, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 25 – Odd/Even list')),
      body: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (context, index) {
          final n = numberList[index];
          final isEven = n % 2 == 0;
          return ListTile(
            title: Text(
              '$n',
              style: TextStyle(
                color: isEven ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
