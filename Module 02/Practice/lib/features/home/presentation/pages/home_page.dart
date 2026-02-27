import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'PC 11', route: AppRoutes.pc11, subtitle: 'Counter – increment by 1'),
    (title: 'PC 12', route: AppRoutes.pc12, subtitle: 'Shopping app – products in grid'),
    (title: 'PC 13', route: AppRoutes.pc13, subtitle: 'About Us page'),
    (title: 'PC 14', route: AppRoutes.pc14, subtitle: 'Word count from sentence'),
    (title: 'PC 15', route: AppRoutes.pc15, subtitle: '4×4 colored grid (random colors)'),
    (title: 'PC 16', route: AppRoutes.pc16, subtitle: 'Quiz result (true/wrong/total)'),
    (title: 'PC 17', route: AppRoutes.pc17, subtitle: 'Date picker – end 29 days before start'),
    (title: 'PC 18', route: AppRoutes.pc18, subtitle: 'Clock (timer 1 sec)'),
    (title: 'PC 19', route: AppRoutes.pc19, subtitle: 'Form validation (name, email, phone)'),
    (title: 'PC 20', route: AppRoutes.pc20, subtitle: 'Image rotation (clockwise/anticlockwise)'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 02 Practice'),
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
