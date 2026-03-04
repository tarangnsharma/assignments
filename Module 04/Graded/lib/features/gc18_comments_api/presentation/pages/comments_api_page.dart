import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/comment_model.dart';

const String _kCommentsUrl = 'https://jsonplaceholder.typicode.com/comments';

final Map<String, String> _kHeaders = {
  'User-Agent': 'Module04Graded/1.0 (Flutter)',
  'Accept': 'application/json',
};

/// GC 18: Fetch and display comments from JSONPlaceholder (name + email).
class CommentsApiPage extends StatefulWidget {
  const CommentsApiPage({super.key});

  @override
  State<CommentsApiPage> createState() => _CommentsApiPageState();
}

class _CommentsApiPageState extends State<CommentsApiPage> {
  List<CommentModel> _comments = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  Future<void> _fetchComments() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final response = await http.get(
        Uri.parse(_kCommentsUrl),
        headers: _kHeaders,
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        final List<dynamic> list = response.body.isNotEmpty
            ? jsonDecode(response.body) as List<dynamic>
            : <dynamic>[];
        setState(() {
          _comments = list
              .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList();
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'HTTP ${response.statusCode}';
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('GC 18 – Comments API')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('GC 18 – Comments API')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $_error', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _fetchComments,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('GC 18 – Comments API'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchComments,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final c = _comments[index];
          return ListTile(
            title: Text(c.name),
            subtitle: Text(c.email),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
