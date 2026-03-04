import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// PC 38: Load JSON from assets, ListView.builder, CircleAvatar (yellow).

class JsonListPage extends StatefulWidget {
  const JsonListPage({super.key});

  @override
  State<JsonListPage> createState() => _JsonListPageState();
}

class _JsonListPageState extends State<JsonListPage> {
  List<Map<String, dynamic>> _data = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    try {
      final s = await rootBundle.loadString(
        'lib/features/pc38_json_list/assets/data.json',
      );
      final map = jsonDecode(s) as Map<String, dynamic>;
      final list = map['Data'] as List<dynamic>;
      setState(() {
        _data = list.cast<Map<String, dynamic>>();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('PC 38 – JSON List')),
        body: Center(child: Text('Error: $_error')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('PC 38 – JSON List')),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, i) {
          final item = _data[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text(
                (item['name'] as String? ?? '?').substring(0, 1).toUpperCase(),
              ),
            ),
            title: Text(item['name'] as String? ?? ''),
            subtitle: Text(
              '${item['email']} • ${item['rollNumber']}',
            ),
          );
        },
      ),
    );
  }
}
