import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// PC 26: AlertDialog form (name, last name, email, phone) → SharedPreferences → show in UI.
class AlertFormPrefsPage extends StatefulWidget {
  const AlertFormPrefsPage({super.key});

  @override
  State<AlertFormPrefsPage> createState() => _AlertFormPrefsPageState();
}

class _AlertFormPrefsPageState extends State<AlertFormPrefsPage> {
  static const _kFirstName = 'pc26_firstName';
  static const _kLastName = 'pc26_lastName';
  static const _kEmail = 'pc26_email';
  static const _kPhone = 'pc26_phone';

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';

  @override
  void initState() {
    super.initState();
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString(_kFirstName) ?? '';
      _lastName = prefs.getString(_kLastName) ?? '';
      _email = prefs.getString(_kEmail) ?? '';
      _phone = prefs.getString(_kPhone) ?? '';
    });
  }

  Future<void> _showFormDialog() async {
    final nameCtrl = TextEditingController(text: _firstName);
    final lastNameCtrl = TextEditingController(text: _lastName);
    final emailCtrl = TextEditingController(text: _email);
    final phoneCtrl = TextEditingController(text: _phone);

    final submitted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'First name'),
              ),
              TextFormField(
                controller: lastNameCtrl,
                decoration: const InputDecoration(labelText: 'Last name'),
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Submit'),
          ),
        ],
      ),
    );

    if (submitted == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kFirstName, nameCtrl.text);
      await prefs.setString(_kLastName, lastNameCtrl.text);
      await prefs.setString(_kEmail, emailCtrl.text);
      await prefs.setString(_kPhone, phoneCtrl.text);
      _loadFromPrefs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 26 – Form + SharedPreferences')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _showFormDialog,
              child: const Text('Open form'),
            ),
            const SizedBox(height: 24),
            if (_firstName.isEmpty && _lastName.isEmpty && _email.isEmpty && _phone.isEmpty)
              const Text('No data saved yet. Open form to submit.')
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First name: $_firstName'),
                  Text('Last name: $_lastName'),
                  Text('Email: $_email'),
                  Text('Phone: $_phone'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
