import 'package:flutter/material.dart';

/// GC 12: Animated text that transforms its appearance when the user hovers over it.
class AnimatedTextHoverPage extends StatefulWidget {
  const AnimatedTextHoverPage({super.key});

  @override
  State<AnimatedTextHoverPage> createState() => _AnimatedTextHoverPageState();
}

class _AnimatedTextHoverPageState extends State<AnimatedTextHoverPage> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GC 12 – Animated Text on Hover')),
      body: Center(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: TextStyle(
              fontSize: _isHovering ? 32 : 24,
              fontWeight: _isHovering ? FontWeight.bold : FontWeight.w500,
              color: _isHovering ? Colors.deepPurple : Colors.grey.shade700,
              letterSpacing: _isHovering ? 2 : 0,
              decoration: _isHovering ? TextDecoration.underline : TextDecoration.none,
              decorationColor: Colors.deepPurple,
            ),
            child: const Text('Hover over me!'),
          ),
        ),
      ),
    );
  }
}
