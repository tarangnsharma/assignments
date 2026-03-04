import 'package:flutter/material.dart';

import 'package:cp02_amazon_clone/core/theme/app_theme.dart';
import 'package:cp02_amazon_clone/core/navigation/app_routes.dart';
import 'package:cp02_amazon_clone/features/amazon_clone/domain/cart_model.dart';
import 'cart_page.dart';

/// Product description screen with Add to Cart. Uses testing.png as product image when provided.
class ProductDetailPage extends StatefulWidget {
  final String productId;
  final String title;
  final String price;
  final String? imagePath;

  const ProductDetailPage({
    super.key,
    required this.productId,
    required this.title,
    required this.price,
    this.imagePath,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  static const String _assets = 'assets/Images';
  int _quantity = 1;
  bool _addedToCart = false;

  @override
  Widget build(BuildContext context) {
    final imagePath = widget.imagePath ?? '$_assets/testing.png';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.amazonDark,
        title: const Text('Product', style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: AppTheme.amazonLightBg,
                padding: const EdgeInsets.all(24),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Center(
                    child: Icon(Icons.image_not_supported, size: 80),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Inclusive of all taxes',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Product description placeholder. Features, specifications, and delivery info would go here.',
                    style: TextStyle(color: Colors.black87, height: 1.4),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Text('Quantity: ', style: TextStyle(fontWeight: FontWeight.w500)),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          if (_quantity > 1) setState(() => _quantity--);
                        },
                      ),
                      Text('$_quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => setState(() => _quantity++),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    CartModel.add(CartItem(
                      productId: widget.productId,
                      title: widget.title,
                      price: widget.price,
                      imagePath: widget.imagePath,
                      quantity: _quantity,
                    ));
                    setState(() => _addedToCart = true);
                  },
                  icon: Icon(_addedToCart ? Icons.check : Icons.add_shopping_cart, color: AppTheme.amazonOrange),
                  label: Text(
                    _addedToCart ? 'Added to Cart' : 'Add to Cart',
                    style: const TextStyle(color: Colors.black87),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppTheme.amazonOrange),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.checkout),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.amazonOrange,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Buy Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
