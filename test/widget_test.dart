import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:journaling_app/screens/home_screen.dart';

void main() {
  testWidgets('Home screen displays title', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomeScreen(userName: 'Test User')),
    );
    expect(find.text('Welcome, Test User!'), findsOneWidget);
  });
}
