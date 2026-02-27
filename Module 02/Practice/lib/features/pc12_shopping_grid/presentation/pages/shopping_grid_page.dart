import 'package:flutter/material.dart';

/// PC 12: Shopping app – products in grid (GridView).
class ShoppingGridPage extends StatelessWidget {
  const ShoppingGridPage({super.key});

  static const List<String> _productNames = [
    'Product 1', 'Product 2', 'Product 3', 'Product 4',
    'Product 5', 'Product 6', 'Product 7', 'Product 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 12 – Shopping Grid')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _productNames.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, size: 48, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 8),
                  Text(
                    _productNames[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
