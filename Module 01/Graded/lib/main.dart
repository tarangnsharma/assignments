import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/navigation/app_routes.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Module01GradedApp());
}

class Module01GradedApp extends StatelessWidget {
  const Module01GradedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 01 Graded Solutions',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
