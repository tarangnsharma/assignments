import 'package:flutter/material.dart';

// Deferred imports so feature screens load only when navigated to.
import '../../features/gc06_two_columns/presentation/pages/two_columns_page.dart' deferred as gc06_page;
import '../../features/gc07_text_color/presentation/pages/text_color_page.dart' deferred as gc07_page;
import '../../features/gc08_shared_counter/presentation/pages/shared_counter_page.dart' deferred as gc08_page;
import '../../features/gc09_about_home/presentation/pages/about_home_page.dart' deferred as gc09_page;
import '../../features/gc10_riverpod_theme_sound/presentation/pages/riverpod_theme_sound_page.dart' deferred as gc10_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String gc06 = '/gc06';
  static const String gc07 = '/gc07';
  static const String gc08 = '/gc08';
  static const String gc09 = '/gc09';
  static const String gc10 = '/gc10';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gc06:
        return _deferredRoute(gc06_page.loadLibrary(), () => gc06_page.TwoColumnsPage());
      case gc07:
        return _deferredRoute(gc07_page.loadLibrary(), () => gc07_page.TextColorPage());
      case gc08:
        return _deferredRoute(gc08_page.loadLibrary(), () => gc08_page.SharedCounterPage());
      case gc09:
        return _deferredRoute(gc09_page.loadLibrary(), () => gc09_page.AboutHomePage());
      case gc10:
        return _deferredRoute(gc10_page.loadLibrary(), () => gc10_page.RiverpodThemeSoundPage());
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
