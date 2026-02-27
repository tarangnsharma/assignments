import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'GC 06', route: AppRoutes.gc06, subtitle: 'Two columns – First Name / Last Name'),
    (title: 'GC 07', route: AppRoutes.gc07, subtitle: 'Button changes color of all text'),
    (title: 'GC 08', route: AppRoutes.gc08, subtitle: 'Two screens, shared number, FAB increments'),
    (title: 'GC 09', route: AppRoutes.gc09, subtitle: 'About + Home, routing, Scaffold color from Home'),
    (title: 'GC 10', route: AppRoutes.gc10, subtitle: 'Riverpod – theme + music notes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 02 Graded'),
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
