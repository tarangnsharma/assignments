import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

/// PC 40: Function to update a Firestore document (collection, docId, data).
/// Fails with NOT_FOUND if the document does not exist.
Future<void> updateFirestoreDocument(
  String collectionName,
  String documentId,
  Map<String, dynamic> data,
) async {
  await FirebaseFirestore.instance
      .collection(collectionName)
      .doc(documentId)
      .update(data);
}

/// Updates the document if it exists; creates it with the given data if it doesn't (merge).
Future<void> updateOrCreateFirestoreDocument(
  String collectionName,
  String documentId,
  Map<String, dynamic> data,
) async {
  await FirebaseFirestore.instance
      .collection(collectionName)
      .doc(documentId)
      .set(data, SetOptions(merge: true));
}

class FirestoreUpdatePage extends StatefulWidget {
  const FirestoreUpdatePage({super.key});

  @override
  State<FirestoreUpdatePage> createState() => _FirestoreUpdatePageState();
}

class _FirestoreUpdatePageState extends State<FirestoreUpdatePage> {
  final _colController = TextEditingController(text: 'pc40_demo');
  final _docController = TextEditingController();
  final _fieldController = TextEditingController();
  final _valueController = TextEditingController();
  bool _loading = false;

  bool get _isFirebaseReady => Firebase.apps.isNotEmpty;

  @override
  void dispose() {
    _colController.dispose();
    _docController.dispose();
    _fieldController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  Future<void> _update() async {
    if (!_isFirebaseReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Firebase not configured.')),
      );
      return;
    }
    final col = _colController.text.trim();
    final docId = _docController.text.trim();
    final field = _fieldController.text.trim();
    final value = _valueController.text.trim();
    if (col.isEmpty || docId.isEmpty || field.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Collection, document ID and field required.')),
      );
      return;
    }
    setState(() => _loading = true);
    try {
      await updateOrCreateFirestoreDocument(col, docId, {field: value});
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Document updated or created.')),
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
    return Scaffold(
      appBar: AppBar(title: const Text('PC 40 – Firestore Update')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _colController,
              decoration: const InputDecoration(labelText: 'Collection'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _docController,
              decoration: const InputDecoration(labelText: 'Document ID'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _fieldController,
              decoration: const InputDecoration(labelText: 'Field name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _valueController,
              decoration: const InputDecoration(labelText: 'Value'),
            ),
            const SizedBox(height: 12),
            Text(
              'If the document does not exist, it will be created with the field.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : _update,
              child: _loading
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : const Text('Update document'),
            ),
          ],
        ),
      ),
    );
  }
}
