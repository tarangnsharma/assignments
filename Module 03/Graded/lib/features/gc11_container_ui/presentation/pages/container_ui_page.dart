import 'package:flutter/material.dart';

/// GC 11: Container matching reference – pill shape, mint fill, "Hello I'm" text, magenta glow.
class ContainerUiPage extends StatelessWidget {
  const ContainerUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 11 – Container UI')),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFA9FBDc), // light mint / turquoise
            borderRadius: BorderRadius.circular(999), // pill / stadium shape
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFCA91E6).withValues(alpha: 0.8),
                blurRadius: 24,
                spreadRadius: 2,
              ),
              BoxShadow(
                color: const Color(0xFFCA91E6).withValues(alpha: 0.5),
                blurRadius: 40,
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Text(
            "Hello I'm",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
