import 'package:flutter/material.dart';

// Deferred imports so feature screens load only when navigated to.
import '../../features/gc11_container_ui/presentation/pages/container_ui_page.dart' deferred as gc11_page;
import '../../features/gc12_animated_text_hover/presentation/pages/animated_text_hover_page.dart' deferred as gc12_page;
import '../../features/gc13_slide_animation_image/presentation/pages/slide_animation_image_page.dart' deferred as gc13_page;
import '../../features/gc14_firestore_users/presentation/pages/firestore_users_page.dart' deferred as gc14_page;
import '../../features/gc15_firestore_cards_slide/presentation/pages/firestore_cards_slide_page.dart' deferred as gc15_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String gc11 = '/gc11';
  static const String gc12 = '/gc12';
  static const String gc13 = '/gc13';
  static const String gc14 = '/gc14';
  static const String gc15 = '/gc15';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gc11:
        return _deferredRoute(gc11_page.loadLibrary(), () => gc11_page.ContainerUiPage());
      case gc12:
        return _deferredRoute(gc12_page.loadLibrary(), () => gc12_page.AnimatedTextHoverPage());
      case gc13:
        return _deferredRoute(gc13_page.loadLibrary(), () => gc13_page.SlideAnimationImagePage());
      case gc14:
        return _deferredRoute(gc14_page.loadLibrary(), () => gc14_page.FirestoreUsersPage());
      case gc15:
        return _deferredRoute(gc15_page.loadLibrary(), () => gc15_page.FirestoreCardsSlidePage());
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
