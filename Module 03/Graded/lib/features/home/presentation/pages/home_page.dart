import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'GC 11', route: AppRoutes.gc11, subtitle: 'Container similar to reference image'),
    (title: 'GC 12', route: AppRoutes.gc12, subtitle: 'Animated text on hover'),
    (title: 'GC 13', route: AppRoutes.gc13, subtitle: 'Slide animation with image'),
    (title: 'GC 14', route: AppRoutes.gc14, subtitle: 'Firestore users – email & name in ListTile'),
    (title: 'GC 15', route: AppRoutes.gc15, subtitle: 'Firestore image links in cards with slide transition'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 03 Graded'),
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
