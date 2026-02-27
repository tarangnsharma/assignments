import 'package:flutter/material.dart';

/// PC 16: Quiz result – true answers, wrong answers, total; image + text in containers.
/// Place result image at lib/features/pc16_quiz_result/assets/file_37693.png and register in pubspec if needed.
class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  static const int trueAnswers = 6;
  static const int wrongAnswers = 0;
  static const int totalQuestions = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 16 – Quiz Result')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.emoji_events,
                  size: 64,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _resultRow(context, 'True answers', trueAnswers),
                    _resultRow(context, 'Wrong answers', wrongAnswers),
                    _resultRow(context, 'Total questions', totalQuestions),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resultRow(BuildContext context, String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
          Text('$value', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
