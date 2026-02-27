import 'package:flutter/material.dart';

/// GC 06: Two columns – "First Name" and "Last Name", evenly spaced and centered.
class TwoColumnsPage extends StatelessWidget {
  const TwoColumnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 06 – Two Columns')),
      body: const Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('First Name'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Last Name'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
