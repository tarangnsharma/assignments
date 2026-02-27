import 'package:flutter/material.dart';

/// PC 28: Show GIF while timer ≤ 15s; after that show "running time has been over".
class GifTimerPage extends StatefulWidget {
  const GifTimerPage({super.key});

  @override
  State<GifTimerPage> createState() => _GifTimerPageState();
}

class _GifTimerPageState extends State<GifTimerPage> {
  static const int durationSeconds = 15;
  bool _timeOver = false;
  bool _started = false;

  Future<void> _startTimer() async {
    setState(() {
      _started = true;
      _timeOver = false;
    });
    await Future.delayed(const Duration(seconds: durationSeconds));
    if (mounted) setState(() => _timeOver = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 28 – GIF timer')),
      body: Center(
        child: _started
            ? (_timeOver
                ? const Text(
                    'Running time has been over.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                : Image.asset(
                    'lib/features/pc28_gif_timer/assets/file_37706.gif',
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Text('GIF loading…'),
                  ))
            : ElevatedButton(
                onPressed: _startTimer,
                child: const Text('Start ($durationSeconds s)'),
              ),
      ),
    );
  }
}
