import 'package:flutter/material.dart';

// Deferred imports so feature screens load only when navigated to.
import '../../features/gc16_persistent_textfield/presentation/pages/persistent_textfield_page.dart' deferred as gc16_page;
import '../../features/gc17_auth/presentation/pages/auth_page.dart' deferred as gc17_page;
import '../../features/gc18_comments_api/presentation/pages/comments_api_page.dart' deferred as gc18_page;
import '../../features/gc19_mvvm_counter/presentation/pages/mvvm_counter_page.dart' deferred as gc19_page;
import '../../features/gc20_todo_firebase/presentation/pages/todo_firebase_page.dart' deferred as gc20_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String gc16 = '/gc16';
  static const String gc17 = '/gc17';
  static const String gc18 = '/gc18';
  static const String gc19 = '/gc19';
  static const String gc20 = '/gc20';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gc16:
        return _deferredRoute(gc16_page.loadLibrary(), () => gc16_page.PersistentTextfieldPage());
      case gc17:
        return _deferredRoute(gc17_page.loadLibrary(), () => gc17_page.AuthPage());
      case gc18:
        return _deferredRoute(gc18_page.loadLibrary(), () => gc18_page.CommentsApiPage());
      case gc19:
        return _deferredRoute(gc19_page.loadLibrary(), () => gc19_page.MvvmCounterPage());
      case gc20:
        return _deferredRoute(gc20_page.loadLibrary(), () => gc20_page.TodoFirebasePage());
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
