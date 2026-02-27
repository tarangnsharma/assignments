import 'package:flutter/material.dart';

/// PC 01: E-commerce responsive layout – products in rows; on tablet/mobile
/// they wrap to the next section. Uses [Wrap] (Test Case 1).
class WrapProductsPage extends StatelessWidget {
  const WrapProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 01 – Wrap')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 12,
          runSpacing: 12,
          children: List.generate(
            12,
            (i) => _ProductChip(label: 'Product ${i + 1}'),
          ),
        ),
      ),
    );
  }
}

class _ProductChip extends StatelessWidget {
  const _ProductChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo),
      ),
      child: Text(label),
    );
  }
}
