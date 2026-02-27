import 'package:flutter/material.dart';

/// PC 20: Image rotation – single button toggles clockwise / anti-clockwise (RotationTransition).
class ImageRotationPage extends StatefulWidget {
  const ImageRotationPage({super.key});

  @override
  State<ImageRotationPage> createState() => _ImageRotationPageState();
}

class _ImageRotationPageState extends State<ImageRotationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleRotation() {
    if (_controller.value == 0) {
      _controller.forward(); // clockwise (positive angle)
    } else {
      _controller.reverse(); // back = anticlockwise
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 20 – Image Rotation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: Tween<double>(begin: 0, end: 0.25).animate(_controller),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.access_time,
                  size: 64,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _toggleRotation,
              icon: const Icon(Icons.rotate_right),
              label: Text(_controller.value == 0 ? 'Rotate clockwise' : 'Rotate anticlockwise'),
            ),
          ],
        ),
      ),
    );
  }
}
