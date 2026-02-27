import 'package:flutter/material.dart';

/// PC 03: Box with text in Flutter.
/// Test Case 1: Container with decoration (border).
/// Can also be done with custom widget or Text + Border.
class BoxWithTextPage extends StatelessWidget {
  const BoxWithTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 03 – Box with text')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'My Awesome Border',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
