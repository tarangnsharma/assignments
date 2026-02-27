// Basic Flutter widget test for Module 03 Practice app.

import 'package:flutter_test/flutter_test.dart';

import 'package:module03_practice_solutions/main.dart';

void main() {
  testWidgets('App starts and shows Module 03 Practice', (WidgetTester tester) async {
    await tester.pumpWidget(const Module03PracticeApp());
    expect(find.text('Module 03 Practice'), findsOneWidget);
  });
}
