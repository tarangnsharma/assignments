import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'PC 21', route: AppRoutes.pc21, subtitle: 'Drawing app (white background, paint)'),
    (title: 'PC 22', route: AppRoutes.pc22, subtitle: 'Platform-specific text (web vs Android)'),
    (title: 'PC 23', route: AppRoutes.pc23, subtitle: 'Random lucky number (max 350)'),
    (title: 'PC 24', route: AppRoutes.pc24, subtitle: 'Buttons A/B: image vs contact info'),
    (title: 'PC 25', route: AppRoutes.pc25, subtitle: 'Odd/even list (green/red)'),
    (title: 'PC 26', route: AppRoutes.pc26, subtitle: 'AlertDialog form + SharedPreferences'),
    (title: 'PC 27', route: AppRoutes.pc27, subtitle: 'Alternating images by index (odd/even)'),
    (title: 'PC 28', route: AppRoutes.pc28, subtitle: 'GIF with timer (≤15s)'),
    (title: 'PC 29', route: AppRoutes.pc29, subtitle: 'Move widget top-left to bottom-right'),
    (title: 'PC 30', route: AppRoutes.pc30, subtitle: 'TextFormField label + save input'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 03 Practice'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(item.title.split(' ').last),
            ),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, item.route),
          );
        },
      ),
    );
  }
}
