import 'package:flutter/material.dart';

/// PC 30: TextFormField with label; save user input to a variable.
class TextFormFieldPage extends StatefulWidget {
  const TextFormFieldPage({super.key});

  @override
  State<TextFormFieldPage> createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  String _savedInput = '';
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 30 – TextFormField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (v) => setState(() => _savedInput = v),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => _savedInput = _controller.text),
              child: const Text('Save to variable'),
            ),
            if (_savedInput.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text('Saved value: $_savedInput'),
            ],
          ],
        ),
      ),
    );
  }
}
