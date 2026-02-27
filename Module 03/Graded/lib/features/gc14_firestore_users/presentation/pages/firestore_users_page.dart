import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// GC 14: Display each user's email and name from Firestore "users" collection in ListTiles.
class FirestoreUsersPage extends StatelessWidget {
  const FirestoreUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 14 – Firestore Users')),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,
                        size: 48, color: Colors.red.shade700),
                    const SizedBox(height: 16),
                    Text(
                      'Firestore error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ensure Firebase is configured (google-services.json / GoogleService-Info.plist) and the "users" collection exists.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) {
            return const Center(
              child: Text('No users in the "users" collection yet.'),
            );
          }
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              debugPrint('data: $data');
              final name = data['name']?.toString() ?? '—';
              final email = data['email']?.toString() ?? '—';
              return ListTile(
                leading: CircleAvatar(
                  child: Text((name.isNotEmpty ? name[0] : '?').toUpperCase()),
                ),
                title: Text(name),
                subtitle: Text(email),
              );
            },
          );
        },
      ),
    );
  }
}
