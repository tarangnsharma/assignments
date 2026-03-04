import 'package:flutter/foundation.dart';

/// ViewModel for the counter (MVVM). Holds state and business logic.
class CounterViewModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
