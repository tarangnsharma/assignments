import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/navigation/app_routes.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: Module02GradedApp()));
}

class Module02GradedApp extends StatelessWidget {
  const Module02GradedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 02 Graded Solutions',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
