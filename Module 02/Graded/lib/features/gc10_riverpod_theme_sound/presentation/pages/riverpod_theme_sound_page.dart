import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// GC 10: Riverpod – button changes AppBar/Scaffold color and plays one of 10 notes.
final colorIndexProvider = StateProvider<int>((ref) => 0);
final noteIndexProvider = StateProvider<int>((ref) => 0);

const _colors = [
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.pink,
  Colors.brown,
];

class RiverpodThemeSoundPage extends ConsumerWidget {
  const RiverpodThemeSoundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorIndex = ref.watch(colorIndexProvider);
    final noteIndex = ref.watch(noteIndexProvider);
    final color = _colors[colorIndex % _colors.length];

    return Scaffold(
      backgroundColor: color.withValues(alpha: 0.3),
      appBar: AppBar(
        title: const Text('GC 10 – Riverpod theme + notes'),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Note ${(noteIndex % 10) + 1} of 10', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ref.read(colorIndexProvider.notifier).state =
                    (ref.read(colorIndexProvider) + 1) % 10;
                ref.read(noteIndexProvider.notifier).state =
                    (ref.read(noteIndexProvider) + 1) % 10;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Note ${(ref.read(noteIndexProvider) % 10) + 1}')),
                );
              },
              child: const Text('Change color & play note'),
            ),
          ],
        ),
      ),
    );
  }
}
