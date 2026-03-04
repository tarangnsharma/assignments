// Basic Flutter widget test for Module 04 Practice app.

import 'package:flutter_test/flutter_test.dart';

import 'package:module04_practice_solutions/main.dart';

void main() {
  testWidgets('App loads and shows Module 04 Practice home', (WidgetTester tester) async {
    await tester.pumpWidget(const Module04PracticeApp());
    expect(find.text('Module 04 Practice'), findsOneWidget);
  });
}
