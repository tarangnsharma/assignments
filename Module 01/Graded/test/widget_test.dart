// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:module01_graded_solutions/main.dart';

void main() {
  testWidgets('App loads and shows Module 01 Graded home', (WidgetTester tester) async {
    await tester.pumpWidget(const Module01GradedApp());
    expect(find.text('Module 01 Graded'), findsOneWidget);
  });
}
