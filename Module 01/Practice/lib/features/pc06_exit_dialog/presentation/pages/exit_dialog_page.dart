import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// PC 06: Confirmation dialog on back button – Yes/No, centered.
/// Test Case 1: AlertDialog with showDialog. No package required.
class ExitDialogPage extends StatefulWidget {
  const ExitDialogPage({super.key});

  @override
  State<ExitDialogPage> createState() => _ExitDialogPageState();
}

class _ExitDialogPageState extends State<ExitDialogPage> {
  Future<bool> _onWillPop() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Please Confirm'),
          content: const Text(
            'Are you sure you want to close the application?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    if (shouldExit == true) {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else {
        exit(0);
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _onWillPop();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('PC 06 – Exit confirmation')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Press the system back button to see the exit confirmation dialog.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
