import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'PC 31', route: AppRoutes.pc31, subtitle: 'Form + Provider (pass form data)'),
    (title: 'PC 32', route: AppRoutes.pc32, subtitle: 'Provider counter + increment'),
    (title: 'PC 33', route: AppRoutes.pc33, subtitle: 'Provider list of strings + add'),
    (title: 'PC 34', route: AppRoutes.pc34, subtitle: 'Provider counter + reset'),
    (title: 'PC 35', route: AppRoutes.pc35, subtitle: 'Reorder list by drag and drop'),
    (title: 'PC 36', route: AppRoutes.pc36, subtitle: 'List add/delete items'),
    (title: 'PC 37', route: AppRoutes.pc37, subtitle: 'Merge two lists, no duplicates'),
    (title: 'PC 38', route: AppRoutes.pc38, subtitle: 'JSON data + CircleAvatar'),
    (title: 'PC 39', route: AppRoutes.pc39, subtitle: 'Firestore add items via Form'),
    (title: 'PC 40', route: AppRoutes.pc40, subtitle: 'Firestore update document'),
    (title: 'PC 41', route: AppRoutes.pc41, subtitle: 'Firestore add and display items'),
    (title: 'PC 42', route: AppRoutes.pc42, subtitle: 'Firebase Auth sign up / log in'),
    (title: 'PC 43', route: AppRoutes.pc43, subtitle: 'Firebase Auth sign up / log in'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 04 Practice'),
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
