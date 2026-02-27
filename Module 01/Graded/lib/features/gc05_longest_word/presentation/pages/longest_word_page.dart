import 'package:flutter/material.dart';

import '../../domain/longest_word.dart' show longestWord;

/// GC 05: Find the longest word in a given sentence.
class LongestWordPage extends StatelessWidget {
  const LongestWordPage({super.key});

  static const String _sentence = 'The quick brown fox jumps over the lazy dog';
  static final String _longest = longestWord(_sentence); // not const (runtime result)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 05 – Longest Word')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors -- string interpolation prevents const
              Text('Sentence: "$_sentence"'),
              const SizedBox(height: 16),
              Text('Longest word: $_longest', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ),
    );
  }
}
