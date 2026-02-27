import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// GC 10: Riverpod – button changes AppBar/Scaffold color and plays one of 10 notes.

// ---------------------------------------------------------------------------
// Constants (single source of truth; supports reusability)
// ---------------------------------------------------------------------------

const int _noteCount = 10;

const List<Color> _themeColors = [
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

/// Asset paths relative to the assets/ folder (AssetSource does not use "assets/" prefix).
const List<String> _noteAssetPaths = [
  'gc10/file_37744.m4a',
  'gc10/file_37745.m4a',
  'gc10/file_37758.m4a',
  'gc10/file_37760.m4a',
  'gc10/file_37762.m4a',
  'gc10/file_37765.m4a',
  'gc10/file_37767.m4a',
  'gc10/file_37771.m4a',
  'gc10/file_37772.m4a',
  'gc10/file_37773.m4a',
];

// ---------------------------------------------------------------------------
// Riverpod providers
// ---------------------------------------------------------------------------

final colorIndexProvider = StateProvider<int>((ref) => 0);
final noteIndexProvider = StateProvider<int>((ref) => 0);

final _audioPlayerProvider = Provider<AudioPlayer>((ref) {
  final player = AudioPlayer();
  ref.onDispose(() => player.dispose());
  return player;
});

/// Audio context so Android uses media volume and plays through speakers.
AudioContext get _audioContext => AudioContext(
      android: const AudioContextAndroid(
        contentType: AndroidContentType.music,
        usageType: AndroidUsageType.media,
        audioFocus: AndroidAudioFocus.gain,
      ),
    );

// ---------------------------------------------------------------------------
// Page widget
// ---------------------------------------------------------------------------

class RiverpodThemeSoundPage extends ConsumerWidget {
  const RiverpodThemeSoundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorIndex = ref.watch(colorIndexProvider);
    final noteIndex = ref.watch(noteIndexProvider);
    final color = _themeColors[colorIndex % _noteCount];

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
            Text(
              'Note ${(noteIndex % _noteCount) + 1} of $_noteCount',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _onChangeThemeAndPlayNote(context, ref),
              child: const Text('Change color & play note'),
            ),
          ],
        ),
      ),
    );
  }

  /// Updates color and note indices, plays the corresponding note, and shows feedback.
  static Future<void> _onChangeThemeAndPlayNote(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final nextColorIndex = (ref.read(colorIndexProvider) + 1) % _noteCount;
    final nextNoteIndex = (ref.read(noteIndexProvider) + 1) % _noteCount;

    ref.read(colorIndexProvider.notifier).state = nextColorIndex;
    ref.read(noteIndexProvider.notifier).state = nextNoteIndex;

    final player = ref.read(_audioPlayerProvider);
    final played = await _playNote(player, nextNoteIndex);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          played
              ? 'Note ${nextNoteIndex + 1} of $_noteCount'
              : 'Note ${nextNoteIndex + 1} – playback failed',
        ),
        backgroundColor: played ? null : Colors.red,
      ),
    );
  }

  /// Plays the note at [noteIndex]. Returns true if playback started successfully.
  static Future<bool> _playNote(AudioPlayer player, int noteIndex) async {
    try {
      await player.stop();
      await player.setAudioContext(_audioContext);
      await player.setReleaseMode(ReleaseMode.release);
      await player.setSource(
        AssetSource(_noteAssetPaths[noteIndex % _noteCount]),
      );
      await player.resume();
      return true;
    } catch (e, st) {
      debugPrint('Audio error: $e\n$st');
      return false;
    }
  }
}
