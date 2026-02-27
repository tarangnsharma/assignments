// Basic Flutter widget test for Module 03 Graded app.
import 'package:flutter_test/flutter_test.dart';
import 'package:module03_graded_solutions/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Module03GradedApp());
    expect(find.text('Module 03 Graded'), findsOneWidget);
  });
}
