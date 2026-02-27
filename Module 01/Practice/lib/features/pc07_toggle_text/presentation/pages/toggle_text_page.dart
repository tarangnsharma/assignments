import 'package:flutter/material.dart';

/// PC 07: Tap button to hide/show text. Test Case 1: Boolean. Test Case 2: StatefulWidget.
class ToggleTextPage extends StatefulWidget {
  const ToggleTextPage({super.key});

  @override
  State<ToggleTextPage> createState() => _ToggleTextPageState();
}

class _ToggleTextPageState extends State<ToggleTextPage> {
  bool _isTextVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 07 – Toggle text')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() => _isTextVisible = !_isTextVisible);
                },
                child: Text(_isTextVisible ? 'Hide text' : 'Show text'),
              ),
              const SizedBox(height: 24),
              if (_isTextVisible)
                const Text(
                  'This is dummy data to test the delete text functionality.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
