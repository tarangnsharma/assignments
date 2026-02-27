/// Returns the longest word in [sentence]. Words are split by whitespace.
/// If multiple words tie for longest, returns the first one.
String longestWord(String sentence) {
  if (sentence.trim().isEmpty) return '';
  final words = sentence.trim().split(RegExp(r'\s+'));
  return words.reduce((a, b) => a.length >= b.length ? a : b);
}
