/// PC 09: Domain – stream of reverse numbers with even/odd labels.
/// Uses async* (generator). No Flutter dependency.
library;

Future<String> _loadMessageForNumber(int i) async {
  await Future.delayed(const Duration(milliseconds: 50));
  if (i % 2 == 0) {
    return '$i is even';
  } else {
    return '$i is odd';
  }
}

/// Yields messages for n, n-1, ..., 0 with even/odd beside each.
Stream<String> reverseNumbersWithEvenOdd(int n) async* {
  int k = n;
  while (k >= 0) {
    yield await _loadMessageForNumber(k--);
  }
}
