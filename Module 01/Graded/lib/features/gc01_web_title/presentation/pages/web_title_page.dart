import 'package:flutter/material.dart';

/// GC 01: Change the title of the Flutter Web App.
/// The app title is set in [MaterialApp.title] in main.dart (e.g. "Module 01 Graded Solutions").
/// For web, this becomes the browser tab title.
class WebTitlePage extends StatelessWidget {
  const WebTitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 01 – Web App Title')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'The Flutter Web App title is set in main.dart via MaterialApp.title '
            'and appears as the browser tab title when running on web.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
