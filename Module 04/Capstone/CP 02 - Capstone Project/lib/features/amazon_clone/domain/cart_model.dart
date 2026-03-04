/// Shared cart state. Add from product detail; read from cart page.
class CartModel {
  CartModel._();

  static final List<CartItem> items = [];

  static void add(CartItem item) {
    items.add(item);
  }

  static void removeAt(int index) {
    if (index >= 0 && index < items.length) items.removeAt(index);
  }

  static void clear() {
    items.clear();
  }

  static int get count => items.length;
}

class CartItem {
  final String productId;
  final String title;
  final String price;
  final String? imagePath;
  final int quantity;

  CartItem({
    required this.productId,
    required this.title,
    required this.price,
    this.imagePath,
    this.quantity = 1,
  });
}
