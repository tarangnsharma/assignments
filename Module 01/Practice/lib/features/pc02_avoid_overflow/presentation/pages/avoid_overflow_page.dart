import 'package:flutter/material.dart';

/// PC 02: Avoid bottom overflow by 30px.
/// Test Case 1: resizeToAvoidBottomInset (replaces deprecated resizeToAvoidBottomPadding)
/// Test Case 2: SingleChildScrollView wrapping body.
class AvoidOverflowPage extends StatelessWidget {
  const AvoidOverflowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 02 – Avoid overflow')),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'When the keyboard opens, overflow is avoided by: '
                'resizeToAvoidBottomInset: false and SingleChildScrollView.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Tap to show keyboard',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                8,
                (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: Text('Item ${i + 1}'),
                    tileColor: Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
