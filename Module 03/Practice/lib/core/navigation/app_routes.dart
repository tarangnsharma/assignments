import 'package:flutter/material.dart';

// Deferred imports so feature screens load only when navigated to.
import '../../features/pc21_drawing_app/presentation/pages/drawing_app_page.dart' deferred as pc21_page;
import '../../features/pc22_platform_text/presentation/pages/platform_text_page.dart' deferred as pc22_page;
import '../../features/pc23_lucky_number/presentation/pages/lucky_number_page.dart' deferred as pc23_page;
import '../../features/pc24_buttons_image_contact/presentation/pages/buttons_image_contact_page.dart' deferred as pc24_page;
import '../../features/pc25_odd_even_list/presentation/pages/odd_even_list_page.dart' deferred as pc25_page;
import '../../features/pc26_alert_form_prefs/presentation/pages/alert_form_prefs_page.dart' deferred as pc26_page;
import '../../features/pc27_alternating_images/presentation/pages/alternating_images_page.dart' deferred as pc27_page;
import '../../features/pc28_gif_timer/presentation/pages/gif_timer_page.dart' deferred as pc28_page;
import '../../features/pc29_move_widget/presentation/pages/move_widget_page.dart' deferred as pc29_page;
import '../../features/pc30_text_form_field/presentation/pages/text_form_field_page.dart' deferred as pc30_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String pc21 = '/pc21';
  static const String pc22 = '/pc22';
  static const String pc23 = '/pc23';
  static const String pc24 = '/pc24';
  static const String pc25 = '/pc25';
  static const String pc26 = '/pc26';
  static const String pc27 = '/pc27';
  static const String pc28 = '/pc28';
  static const String pc29 = '/pc29';
  static const String pc30 = '/pc30';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pc21:
        return _deferredRoute(pc21_page.loadLibrary(), () => pc21_page.DrawingAppPage());
      case pc22:
        return _deferredRoute(pc22_page.loadLibrary(), () => pc22_page.PlatformTextPage());
      case pc23:
        return _deferredRoute(pc23_page.loadLibrary(), () => pc23_page.LuckyNumberPage());
      case pc24:
        return _deferredRoute(pc24_page.loadLibrary(), () => pc24_page.ButtonsImageContactPage());
      case pc25:
        return _deferredRoute(pc25_page.loadLibrary(), () => pc25_page.OddEvenListPage());
      case pc26:
        return _deferredRoute(pc26_page.loadLibrary(), () => pc26_page.AlertFormPrefsPage());
      case pc27:
        return _deferredRoute(pc27_page.loadLibrary(), () => pc27_page.AlternatingImagesPage());
      case pc28:
        return _deferredRoute(pc28_page.loadLibrary(), () => pc28_page.GifTimerPage());
      case pc29:
        return _deferredRoute(pc29_page.loadLibrary(), () => pc29_page.MoveWidgetPage());
      case pc30:
        return _deferredRoute(pc30_page.loadLibrary(), () => pc30_page.TextFormFieldPage());
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
