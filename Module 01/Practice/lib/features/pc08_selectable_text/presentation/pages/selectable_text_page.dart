import 'package:flutter/material.dart';

/// PC 08: User can select and copy text. Test Case 1: SelectableText (inbuilt).
class SelectableTextPage extends StatelessWidget {
  const SelectableTextPage({super.key});

  static const String _lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 08 – SelectableText')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          SelectableText(
            _lorem,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Long-press to select and copy this text.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
