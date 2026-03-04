import 'package:flutter/material.dart';

// Deferred imports so feature screens load only when navigated to.
import '../../features/pc31_form_provider/presentation/pages/form_provider_page.dart' deferred as pc31_page;
import '../../features/pc32_provider_counter/presentation/pages/provider_counter_page.dart' deferred as pc32_page;
import '../../features/pc33_provider_list/presentation/pages/provider_list_page.dart' deferred as pc33_page;
import '../../features/pc34_provider_reset/presentation/pages/provider_reset_page.dart' deferred as pc34_page;
import '../../features/pc35_reorder_list/presentation/pages/reorder_list_page.dart' deferred as pc35_page;
import '../../features/pc36_list_add_delete/presentation/pages/list_add_delete_page.dart' deferred as pc36_page;
import '../../features/pc37_merge_lists/presentation/pages/merge_lists_page.dart' deferred as pc37_page;
import '../../features/pc38_json_list/presentation/pages/json_list_page.dart' deferred as pc38_page;
import '../../features/pc39_firestore_form/presentation/pages/firestore_form_page.dart' deferred as pc39_page;
import '../../features/pc40_firestore_update/presentation/pages/firestore_update_page.dart' deferred as pc40_page;
import '../../features/pc41_firestore_items/presentation/pages/firestore_items_page.dart' deferred as pc41_page;
import '../../features/pc42_firebase_auth/presentation/pages/firebase_auth_page.dart' deferred as pc42_page;
import '../../features/pc43_firebase_auth/presentation/pages/firebase_auth_page.dart' deferred as pc43_page;

abstract class AppRoutes {
  static const String home = '/';
  static const String pc31 = '/pc31';
  static const String pc32 = '/pc32';
  static const String pc33 = '/pc33';
  static const String pc34 = '/pc34';
  static const String pc35 = '/pc35';
  static const String pc36 = '/pc36';
  static const String pc37 = '/pc37';
  static const String pc38 = '/pc38';
  static const String pc39 = '/pc39';
  static const String pc40 = '/pc40';
  static const String pc41 = '/pc41';
  static const String pc42 = '/pc42';
  static const String pc43 = '/pc43';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pc31:
        return _deferredRoute(pc31_page.loadLibrary(), () => pc31_page.FormProviderPage());
      case pc32:
        return _deferredRoute(pc32_page.loadLibrary(), () => pc32_page.ProviderCounterPage());
      case pc33:
        return _deferredRoute(pc33_page.loadLibrary(), () => pc33_page.ProviderListPage());
      case pc34:
        return _deferredRoute(pc34_page.loadLibrary(), () => pc34_page.ProviderResetPage());
      case pc35:
        return _deferredRoute(pc35_page.loadLibrary(), () => pc35_page.ReorderListPage());
      case pc36:
        return _deferredRoute(pc36_page.loadLibrary(), () => pc36_page.ListAddDeletePage());
      case pc37:
        return _deferredRoute(pc37_page.loadLibrary(), () => pc37_page.MergeListsPage());
      case pc38:
        return _deferredRoute(pc38_page.loadLibrary(), () => pc38_page.JsonListPage());
      case pc39:
        return _deferredRoute(pc39_page.loadLibrary(), () => pc39_page.FirestoreFormPage());
      case pc40:
        return _deferredRoute(pc40_page.loadLibrary(), () => pc40_page.FirestoreUpdatePage());
      case pc41:
        return _deferredRoute(pc41_page.loadLibrary(), () => pc41_page.FirestoreItemsPage());
      case pc42:
        return _deferredRoute(pc42_page.loadLibrary(), () => pc42_page.FirebaseAuthPage());
      case pc43:
        return _deferredRoute(pc43_page.loadLibrary(), () => pc43_page.FirebaseAuthPage());
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
