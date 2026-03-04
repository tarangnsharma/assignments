import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'GC 16', route: AppRoutes.gc16, subtitle: 'TextFormField + local storage'),
    (title: 'GC 17', route: AppRoutes.gc17, subtitle: 'Email & password authentication'),
    (title: 'GC 18', route: AppRoutes.gc18, subtitle: 'Fetch comments from JSONPlaceholder API'),
    (title: 'GC 19', route: AppRoutes.gc19, subtitle: 'MVVM counter app'),
    (title: 'GC 20', route: AppRoutes.gc20, subtitle: 'GET IT DONE + Firebase + auth'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 04 Graded'),
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
