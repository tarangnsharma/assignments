import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'PC 01', route: AppRoutes.pc01, subtitle: 'Wrap – responsive product rows'),
    (title: 'PC 02', route: AppRoutes.pc02, subtitle: 'Avoid bottom overflow'),
    (title: 'PC 03', route: AppRoutes.pc03, subtitle: 'Box with text (Container + border)'),
    (title: 'PC 04', route: AppRoutes.pc04, subtitle: 'Stack layout'),
    (title: 'PC 05', route: AppRoutes.pc05, subtitle: 'Counter +10 on FAB'),
    (title: 'PC 06', route: AppRoutes.pc06, subtitle: 'Exit confirmation dialog'),
    (title: 'PC 07', route: AppRoutes.pc07, subtitle: 'Toggle text visibility'),
    (title: 'PC 08', route: AppRoutes.pc08, subtitle: 'SelectableText (copy/paste)'),
    (title: 'PC 09', route: AppRoutes.pc09, subtitle: 'Reverse numbers even/odd (async*)'),
    (title: 'PC 10', route: AppRoutes.pc10, subtitle: 'Grid layout'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 01 Practice'),
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
