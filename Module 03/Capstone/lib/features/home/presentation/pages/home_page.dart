import 'package:flutter/material.dart';

import '../../../../core/navigation/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, String route, String subtitle})> _items = [
    (title: 'CP 01', route: AppRoutes.cp01, subtitle: 'Cake ordering app – User & Admin UI'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 03 Capstone'),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFE91E63),
              child: Text('CP', style: TextStyle(color: Colors.white, fontSize: 12)),
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
