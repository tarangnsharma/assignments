import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/navigation/app_routes.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Module02PracticeApp());
}

class Module02PracticeApp extends StatelessWidget {
  const Module02PracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 02 Practice Solutions',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
