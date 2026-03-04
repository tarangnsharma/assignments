import 'package:flutter/material.dart';

import '../../features/cp01_cake_ordering/presentation/pages/cake_ordering_flow.dart';

abstract class AppRoutes {
  static const String home = '/';
  static const String cp01 = '/cp01';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cp01:
        return MaterialPageRoute(
          builder: (_) => const CakeOrderingFlow(),
        );
      default:
        return null;
    }
  }
}
