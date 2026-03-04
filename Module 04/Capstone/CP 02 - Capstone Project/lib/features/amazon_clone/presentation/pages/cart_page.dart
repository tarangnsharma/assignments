import 'package:flutter/material.dart';

import 'package:cp02_amazon_clone/core/theme/app_theme.dart';
import 'package:cp02_amazon_clone/core/navigation/app_routes.dart';
import 'package:cp02_amazon_clone/features/amazon_clone/domain/cart_model.dart';

/// Cart screen. Shows emptyCart.png when cart is empty; otherwise list and Proceed to Checkout.
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  static const String _assets = 'assets/Images';

  @override
  Widget build(BuildContext context) {
    final items = CartModel.items;
    final isEmpty = items.isEmpty;
    return Scaffold(
      backgroundColor: AppTheme.amazonLightBg,
      appBar: AppBar(
        backgroundColor: AppTheme.amazonDark,
        title: const Text('Cart', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: isEmpty ? _buildEmptyCart() : _buildCartList(),
      bottomNavigationBar: isEmpty
          ? null
          : SafeArea(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.checkout),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.amazonOrange,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Proceed to Checkout'),
                ),
              ),
            ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '$_assets/emptyCart.png',
              height: 220,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Icon(Icons.shopping_cart_outlined, size: 120, color: Colors.grey[400]),
            ),
            const SizedBox(height: 24),
            Text(
              'Your cart is empty',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add items to get started',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.shopping_bag_outlined, size: 20),
              label: const Text('Continue Shopping'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.amazonOrange,
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartList() {
    final items = CartModel.items;
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, i) {
        final item = items[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Image.asset(
              item.imagePath ?? '$_assets/testing.png',
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.image),
            ),
            title: Text(item.title),
            subtitle: Text('${item.price} × ${item.quantity}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                CartModel.removeAt(i);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }
}
