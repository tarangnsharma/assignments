import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../domain/todo_model.dart';

const String _kTodosCollection = 'todos';

/// GC 20: GET IT DONE–style app with Firebase Auth + Firestore for todos.
class TodoFirebasePage extends StatefulWidget {
  const TodoFirebasePage({super.key});

  @override
  State<TodoFirebasePage> createState() => _TodoFirebasePageState();
}

class _TodoFirebasePageState extends State<TodoFirebasePage> {
  User? _user;
  final _authListener = FirebaseAuth.instance.authStateChanges();

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _authListener.listen((User? user) {
      if (mounted) setState(() => _user = user);
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return _AuthGate(onSignedIn: () => setState(() => _user = FirebaseAuth.instance.currentUser));
    }

    final userId = _user!.uid;
    final itemsCol = FirebaseFirestore.instance
        .collection(_kTodosCollection)
        .doc(userId)
        .collection('items');
    final todosQuery = itemsCol.snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GC 20 – Get It Done'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: todosQuery,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data?.docs ?? [];
          final todos = docs
              .map((d) => TodoModel.fromMap(d.id, d.data()))
              .toList();

          if (todos.isEmpty) {
            return const Center(
              child: Text('No todos. Add one with the + button.'),
            );
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              final ref = itemsCol.doc(todo.id);
              return Dismissible(
                key: Key(todo.id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => ref.delete(),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: CheckboxListTile(
                  value: todo.completed,
                  onChanged: (v) =>
                      ref.update({'completed': v ?? false}),
                  title: Text(
                    todo.title,
                    style: todo.completed
                        ? TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          )
                        : null,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodo(context, userId),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddTodo(BuildContext context, String userId) async {
    final controller = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New todo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          onSubmitted: (_) => Navigator.of(context).pop(true),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Add'),
          ),
        ],
      ),
    );
    if (result == true && controller.text.trim().isNotEmpty) {
      await FirebaseFirestore.instance
          .collection(_kTodosCollection)
          .doc(userId)
          .collection('items')
          .add({
        'title': controller.text.trim(),
        'completed': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}

/// Sign-in/sign-up gate for GC 20 (email/password auth).
class _AuthGate extends StatefulWidget {
  const _AuthGate({required this.onSignedIn});

  final VoidCallback onSignedIn;

  @override
  State<_AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<_AuthGate> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  bool _isSignUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _loading = true);
    try {
      if (_isSignUp) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
      }
      if (mounted) widget.onSignedIn();
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? e.code)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 20 – Get It Done')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign in to view your todos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(_isSignUp ? 'Sign up' : 'Sign in'),
            ),
            TextButton(
              onPressed: _loading ? null : () => setState(() => _isSignUp = !_isSignUp),
              child: Text(_isSignUp ? 'Already have an account? Sign in' : 'Need an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
