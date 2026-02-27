import 'package:flutter/material.dart';

// Deferred imports so feature screens load only when navigated to.
import '../../features/pc11_counter/presentation/pages/counter_page.dart' deferred as pc11_page;
import '../../features/pc12_shopping_grid/presentation/pages/shopping_grid_page.dart' deferred as pc12_page;
import '../../features/pc13_about_us/presentation/pages/about_us_page.dart' deferred as pc13_page;
import '../../features/pc14_word_count/presentation/pages/word_count_page.dart' deferred as pc14_page;
import '../../features/pc15_colored_grid/presentation/pages/colored_grid_page.dart' deferred as pc15_page;
import '../../features/pc16_quiz_result/presentation/pages/quiz_result_page.dart' deferred as pc16_page;
import '../../features/pc17_date_picker/presentation/pages/date_picker_page.dart' deferred as pc17_page;
import '../../features/pc18_clock/presentation/pages/clock_page.dart' deferred as pc18_page;
import '../../features/pc19_form_validation/presentation/pages/form_validation_page.dart' deferred as pc19_page;
import '../../features/pc20_image_rotation/presentation/pages/image_rotation_page.dart' deferred as pc20_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String pc11 = '/pc11';
  static const String pc12 = '/pc12';
  static const String pc13 = '/pc13';
  static const String pc14 = '/pc14';
  static const String pc15 = '/pc15';
  static const String pc16 = '/pc16';
  static const String pc17 = '/pc17';
  static const String pc18 = '/pc18';
  static const String pc19 = '/pc19';
  static const String pc20 = '/pc20';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pc11:
        return _deferredRoute(pc11_page.loadLibrary(), () => pc11_page.CounterPage());
      case pc12:
        return _deferredRoute(pc12_page.loadLibrary(), () => pc12_page.ShoppingGridPage());
      case pc13:
        return _deferredRoute(pc13_page.loadLibrary(), () => pc13_page.AboutUsPage());
      case pc14:
        return _deferredRoute(pc14_page.loadLibrary(), () => pc14_page.WordCountPage());
      case pc15:
        return _deferredRoute(pc15_page.loadLibrary(), () => pc15_page.ColoredGridPage());
      case pc16:
        return _deferredRoute(pc16_page.loadLibrary(), () => pc16_page.QuizResultPage());
      case pc17:
        return _deferredRoute(pc17_page.loadLibrary(), () => pc17_page.DatePickerPage());
      case pc18:
        return _deferredRoute(pc18_page.loadLibrary(), () => pc18_page.ClockPage());
      case pc19:
        return _deferredRoute(pc19_page.loadLibrary(), () => pc19_page.FormValidationPage());
      case pc20:
        return _deferredRoute(pc20_page.loadLibrary(), () => pc20_page.ImageRotationPage());
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
