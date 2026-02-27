/// Returns the sum of numbers in [list].
double sumOfList(List<num> list) {
  return list.fold<double>(0, (acc, n) => acc + n.toDouble());
}
