import 'package:flutter/material.dart';

/// GC 07: Button changes the color of all text widgets in the app.
class TextColorPage extends StatefulWidget {
  const TextColorPage({super.key});

  @override
  State<TextColorPage> createState() => _TextColorPageState();
}

class _TextColorPageState extends State<TextColorPage> {
  Color _textColor = Colors.black;

  void _cycleColor() {
    setState(() {
      _textColor = _textColor == Colors.black
          ? Colors.blue
          : _textColor == Colors.blue
              ? Colors.red
              : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 07 – Text Color')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sample text one', style: TextStyle(color: _textColor, fontSize: 20)),
            const SizedBox(height: 8),
            Text('Sample text two', style: TextStyle(color: _textColor, fontSize: 20)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _cycleColor,
              child: const Text('Change text color'),
            ),
          ],
        ),
      ),
    );
  }
}
