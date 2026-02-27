import 'package:flutter/material.dart';

import '../../features/gc01_web_title/presentation/pages/web_title_page.dart' deferred as gc01_page;
import '../../features/gc02_list_sum/presentation/pages/list_sum_page.dart' deferred as gc02_page;
import '../../features/gc03_fibonacci/presentation/pages/fibonacci_page.dart' deferred as gc03_page;
import '../../features/gc04_image_appbar/presentation/pages/image_appbar_page.dart' deferred as gc04_page;
import '../../features/gc05_longest_word/presentation/pages/longest_word_page.dart' deferred as gc05_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String gc01 = '/gc01';
  static const String gc02 = '/gc02';
  static const String gc03 = '/gc03';
  static const String gc04 = '/gc04';
  static const String gc05 = '/gc05';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gc01:
        return _deferredRoute(gc01_page.loadLibrary(), () => gc01_page.WebTitlePage());
      case gc02:
        return _deferredRoute(gc02_page.loadLibrary(), () => gc02_page.ListSumPage());
      case gc03:
        return _deferredRoute(gc03_page.loadLibrary(), () => gc03_page.FibonacciPage());
      case gc04:
        return _deferredRoute(gc04_page.loadLibrary(), () => gc04_page.ImageAppbarPage());
      case gc05:
        return _deferredRoute(gc05_page.loadLibrary(), () => gc05_page.LongestWordPage());
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
