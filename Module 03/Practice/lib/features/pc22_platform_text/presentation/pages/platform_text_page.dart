import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// PC 22: Platform-specific text – web vs Android.
class PlatformTextPage extends StatelessWidget {
  const PlatformTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 22 – Platform text')),
      body: Center(
        child: Text(
          kIsWeb ? 'This is for the web!!' : 'This is for android!!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
