/// Returns Fibonacci series up to (and not exceeding) [max].
/// Example: fibonacciUpTo(90) => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
List<int> fibonacciUpTo(int max) {
  if (max < 1) return [];
  final result = <int>[1];
  int a = 1, b = 1;
  while (b <= max) {
    result.add(b);
    final next = a + b;
    a = b;
    b = next;
  }
  return result;
}
