import 'dart:async';

import 'package:flutter/material.dart';

/// PC 18: Clock – updates every 1 second using Timer.
class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime _now = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PC 18 – Clock')),
      body: Center(
        child: Text(
          '${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}:${_now.second.toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontFeatures: [const FontFeature.tabularFigures()],
              ),
        ),
      ),
    );
  }
}
