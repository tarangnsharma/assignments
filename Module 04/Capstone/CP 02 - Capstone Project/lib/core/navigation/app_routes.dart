import 'package:flutter/material.dart';

import '../../features/amazon_clone/presentation/pages/home_page.dart';
import '../../features/amazon_clone/presentation/pages/product_detail_page.dart';
import '../../features/amazon_clone/presentation/pages/cart_page.dart';
import '../../features/amazon_clone/presentation/pages/checkout_page.dart';
import '../../features/amazon_clone/presentation/pages/offers_page.dart';
import '../../features/amazon_clone/presentation/pages/auth_flow_page.dart';

abstract class AppRoutes {
  static const String home = '/';
  static const String productDetail = '/product';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String offers = '/offers';
  static const String auth = '/auth';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case productDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => ProductDetailPage(
            productId: args?['id'] as String? ?? '',
            title: args?['title'] as String? ?? 'Product',
            price: args?['price'] as String? ?? '0',
            imagePath: args?['imagePath'] as String?,
          ),
        );
      case cart:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutPage());
      case offers:
        return MaterialPageRoute(builder: (_) => const OffersPage());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthFlowPage());
      default:
        return null;
    }
  }
}
