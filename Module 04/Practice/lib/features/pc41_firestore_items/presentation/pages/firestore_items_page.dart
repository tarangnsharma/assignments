import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const String _kCollection = 'pc41_items';

/// PC 41: Add item (text + button) and display list from Firestore.
class FirestoreItemsPage extends StatefulWidget {
  const FirestoreItemsPage({super.key});

  @override
  State<FirestoreItemsPage> createState() => _FirestoreItemsPageState();
}

class _FirestoreItemsPageState extends State<FirestoreItemsPage> {
  final _controller = TextEditingController();
  bool _loading = false;

  bool get _isFirebaseReady => Firebase.apps.isNotEmpty;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_isFirebaseReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Firebase not configured.')),
      );
      return;
    }
    final name = _controller.text.trim();
    if (name.isEmpty) return;
    setState(() => _loading = true);
    try {
      await FirebaseFirestore.instance.collection(_kCollection).add({
        'name': name,
        'createdAt': FieldValue.serverTimestamp(),
      });
      if (mounted) {
        _controller.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item added.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isFirebaseReady) {
      return Scaffold(
        appBar: AppBar(title: const Text('PC 41 – Firestore Items')),
        body: const Center(child: Text('Firebase not configured.')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('PC 41 – Firestore Items')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Item name',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _submit(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  child: _loading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Submit'),
                ),
              ],
            ),
          ),
          const Expanded(
            child: _ItemsList(),
          ),
        ],
      ),
    );
  }
}

class _ItemsList extends StatelessWidget {
  const _ItemsList();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection(_kCollection)
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snapshot.data?.docs ?? [];
        if (docs.isEmpty) {
          return const Center(child: Text('No items yet. Add one above.'));
        }
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, i) {
            final d = docs[i];
            final name = d.data()['name'] as String? ?? '';
            return ListTile(title: Text(name));
          },
        );
      },
    );
  }
}
