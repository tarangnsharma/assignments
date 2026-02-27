import 'package:flutter/material.dart';

/// PC 10: Grid layout. Test Case 1: Container + Text in center.
/// Test Case 2: GridView.builder – lazy building to avoid main-thread jank.
class GridLayoutPage extends StatelessWidget {
  const GridLayoutPage({super.key});

  static const int _itemCount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 10 – Grid layout')),
      body: Container(
        color: Colors.black,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 1,
          ),
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Item $index',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
