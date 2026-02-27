import 'package:flutter/material.dart';

/// PC 29: Move widget from top-left to bottom-right on button click (Align).
class MoveWidgetPage extends StatefulWidget {
  const MoveWidgetPage({super.key});

  @override
  State<MoveWidgetPage> createState() => _MoveWidgetPageState();
}

class _MoveWidgetPageState extends State<MoveWidgetPage> {
  bool _atBottomRight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 29 – Move widget')),
      body: Stack(
        children: [
          Align(
            alignment: _atBottomRight ? Alignment.bottomRight : Alignment.topLeft,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.blue,
              child: const Icon(Icons.star, color: Colors.white, size: 40),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: ElevatedButton(
                onPressed: () => setState(() => _atBottomRight = !_atBottomRight),
                child: Text(_atBottomRight ? 'Move to top-left' : 'Move to bottom-right'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
