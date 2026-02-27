import 'package:flutter/material.dart';

/// PC 14: Input a sentence and display word count.
class WordCountPage extends StatefulWidget {
  const WordCountPage({super.key});

  @override
  State<WordCountPage> createState() => _WordCountPageState();
}

class _WordCountPageState extends State<WordCountPage> {
  final TextEditingController _controller = TextEditingController();
  int _wordCount = 0;

  void _updateWordCount() {
    final text = _controller.text.trim();
    setState(() {
      _wordCount = text.isEmpty ? 0 : text.split(RegExp(r'\s+')).length;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateWordCount);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 14 – Word Count')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter a sentence...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            Text(
              'Number of words: $_wordCount',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
