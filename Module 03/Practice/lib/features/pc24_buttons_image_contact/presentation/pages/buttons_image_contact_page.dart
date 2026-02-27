import 'package:flutter/material.dart';

enum _ShowMode { none, image, contact }

/// PC 24: Button A shows image, Button B shows name, phone, email.
class ButtonsImageContactPage extends StatefulWidget {
  const ButtonsImageContactPage({super.key});

  @override
  State<ButtonsImageContactPage> createState() => _ButtonsImageContactPageState();
}

class _ButtonsImageContactPageState extends State<ButtonsImageContactPage> {
  _ShowMode _mode = _ShowMode.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 24 – Buttons A & B')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _mode = _ShowMode.image),
                  child: const Text('A – Image'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _mode = _ShowMode.contact),
                  child: const Text('B – Contact'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: _mode == _ShowMode.image
                    ? Image.network(
                        'https://picsum.photos/250/250',
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported, size: 80),
                      )
                    : _mode == _ShowMode.contact
                        ? const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name: Your Name'),
                              Text('Phone: +91 98765 43210'),
                              Text('Email: your.email@example.com'),
                            ],
                          )
                        : const Text('Tap A or B'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
