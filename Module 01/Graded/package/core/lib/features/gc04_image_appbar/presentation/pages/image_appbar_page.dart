import 'package:flutter/material.dart';

/// GC 04: Display an image with a title; app bar and body have contrasting colors.
class ImageAppbarPage extends StatelessWidget {
  const ImageAppbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GC 04 – Image & Title'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.amber.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, size: 120, color: Colors.deepPurple.shade300),
              const SizedBox(height: 16),
              Text(
                'Image with defined title',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.deepPurple.shade900,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
