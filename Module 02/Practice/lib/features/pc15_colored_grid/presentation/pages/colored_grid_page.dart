import 'dart:math';

import 'package:flutter/material.dart';

/// PC 15: 4×4 grid of colored squares; random colors at launch.
class ColoredGridPage extends StatelessWidget {
  const ColoredGridPage({super.key});

  static final List<Color> _colors = List.generate(16, (_) {
    return Color(0xFF000000 + Random().nextInt(0xFFFFFF));
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 15 – Colored Grid')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: _colors[index],
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
