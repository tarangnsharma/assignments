import 'package:flutter/material.dart';

import '../../domain/reverse_number_stream.dart';

/// PC 09: Print reverse numbers with even/odd beside value using async*.
/// Domain logic in [reverseNumbersWithEvenOdd]; UI consumes stream.
class ReverseAsyncPage extends StatefulWidget {
  const ReverseAsyncPage({super.key});

  @override
  State<ReverseAsyncPage> createState() => _ReverseAsyncPageState();
}

class _ReverseAsyncPageState extends State<ReverseAsyncPage> {
  final List<String> _messages = [];
  bool _isLoading = false;

  Future<void> _runStream() async {
    setState(() {
      _messages.clear();
      _isLoading = true;
    });
    await for (final msg in reverseNumbersWithEvenOdd(5)) {
      if (!mounted) return;
      setState(() => _messages.add(msg));
    }
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 09 – Reverse numbers (async*)')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _runStream,
              child: Text(_isLoading ? 'Running…' : 'Run reverse 5→0 (even/odd)'),
            ),
            const SizedBox(height: 16),
            if (_messages.isEmpty && !_isLoading)
              const Text(
                'Tap the button to stream: 5 is odd, 4 is even, …',
                style: TextStyle(color: Colors.grey),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: CircleAvatar(
                      child: Text('${i + 1}'),
                    ),
                    title: Text(_messages[i]),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
