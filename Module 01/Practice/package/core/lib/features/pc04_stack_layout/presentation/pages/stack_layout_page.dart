import 'package:flutter/material.dart';

/// PC 04: Stack layout – full-size green, then red (400x300), then purple (200x200).
/// Test Case 1: Stack. Test Case 2: Container with color and height (and one without).
class StackLayoutPage extends StatelessWidget {
  const StackLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PC 04 – Stack layout'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
            height: 400,
            width: 300,
          ),
          Container(
            color: Colors.deepPurple,
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
