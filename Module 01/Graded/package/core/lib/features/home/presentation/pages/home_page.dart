import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'GC 01', route: AppRoutes.gc01, subtitle: 'Change Flutter Web App title'),
    (title: 'GC 02', route: AppRoutes.gc02, subtitle: 'Sum of numbers in a List'),
    (title: 'GC 03', route: AppRoutes.gc03, subtitle: 'Fibonacci series up to given number'),
    (title: 'GC 04', route: AppRoutes.gc04, subtitle: 'Image with title, contrasting app bar & body'),
    (title: 'GC 05', route: AppRoutes.gc05, subtitle: 'Longest word in a sentence'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 01 Graded'),
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
