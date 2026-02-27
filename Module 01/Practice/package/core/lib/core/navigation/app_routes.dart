import 'package:flutter/material.dart';

// Deferred imports so feature screens load only when navigated to,
// reducing main-thread work at startup and avoiding "Skipped N frames".
import '../../features/pc01_wrap_products/presentation/pages/wrap_products_page.dart' deferred as pc01_page;
import '../../features/pc02_avoid_overflow/presentation/pages/avoid_overflow_page.dart' deferred as pc02_page;
import '../../features/pc03_box_with_text/presentation/pages/box_with_text_page.dart' deferred as pc03_page;
import '../../features/pc04_stack_layout/presentation/pages/stack_layout_page.dart' deferred as pc04_page;
import '../../features/pc05_counter/presentation/pages/counter_page.dart' deferred as pc05_page;
import '../../features/pc06_exit_dialog/presentation/pages/exit_dialog_page.dart' deferred as pc06_page;
import '../../features/pc07_toggle_text/presentation/pages/toggle_text_page.dart' deferred as pc07_page;
import '../../features/pc08_selectable_text/presentation/pages/selectable_text_page.dart' deferred as pc08_page;
import '../../features/pc09_reverse_async/presentation/pages/reverse_async_page.dart' deferred as pc09_page;
import '../../features/pc10_grid_layout/presentation/pages/grid_layout_page.dart' deferred as pc10_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String pc01 = '/pc01';
  static const String pc02 = '/pc02';
  static const String pc03 = '/pc03';
  static const String pc04 = '/pc04';
  static const String pc05 = '/pc05';
  static const String pc06 = '/pc06';
  static const String pc07 = '/pc07';
  static const String pc08 = '/pc08';
  static const String pc09 = '/pc09';
  static const String pc10 = '/pc10';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pc01:
        return _deferredRoute(pc01_page.loadLibrary(), () => pc01_page.WrapProductsPage());
      case pc02:
        return _deferredRoute(pc02_page.loadLibrary(), () => pc02_page.AvoidOverflowPage());
      case pc03:
        return _deferredRoute(pc03_page.loadLibrary(), () => pc03_page.BoxWithTextPage());
      case pc04:
        return _deferredRoute(pc04_page.loadLibrary(), () => pc04_page.StackLayoutPage());
      case pc05:
        return _deferredRoute(pc05_page.loadLibrary(), () => pc05_page.CounterPage());
      case pc06:
        return _deferredRoute(pc06_page.loadLibrary(), () => pc06_page.ExitDialogPage());
      case pc07:
        return _deferredRoute(pc07_page.loadLibrary(), () => pc07_page.ToggleTextPage());
      case pc08:
        return _deferredRoute(pc08_page.loadLibrary(), () => pc08_page.SelectableTextPage());
      case pc09:
        return _deferredRoute(pc09_page.loadLibrary(), () => pc09_page.ReverseAsyncPage());
      case pc10:
        return _deferredRoute(pc10_page.loadLibrary(), () => pc10_page.GridLayoutPage());
      default:
        return null;
    }
  }

  static MaterialPageRoute<dynamic> _deferredRoute(
    Future<void> loadFuture,
    Widget Function() builder,
  ) {
    return MaterialPageRoute(
      builder: (context) => FutureBuilder<void>(
        future: loadFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return builder();
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
