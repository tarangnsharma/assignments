import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kPersistentTextKey = 'gc16_persistent_text';

/// GC 16: TextFormField with persistent local storage via SharedPreferences.
class PersistentTextfieldPage extends StatefulWidget {
  const PersistentTextfieldPage({super.key});

  @override
  State<PersistentTextfieldPage> createState() => _PersistentTextfieldPageState();
}

class _PersistentTextfieldPageState extends State<PersistentTextfieldPage> {
  final TextEditingController _controller = TextEditingController();
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadSavedText();
  }

  Future<void> _loadSavedText() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_kPersistentTextKey);
    if (saved != null && mounted) {
      _controller.text = saved;
    }
    if (mounted) setState(() => _loaded = true);
  }

  Future<void> _saveText(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kPersistentTextKey, value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 16 – Persistent TextField')),
      body: _loaded
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter text (saved locally)',
                      hintText: 'Text persists after app restart',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    onChanged: _saveText,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Data is stored in SharedPreferences and restored when you reopen the app.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
