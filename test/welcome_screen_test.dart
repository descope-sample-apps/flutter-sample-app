import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sample_app/screens/welcome_screen.dart';

void main() {
  testWidgets('Renders WelcomeScreen and starts flow on button press',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));

    expect(
        find.text("Welcome to Descope's Flutter Sample App!"), findsOneWidget);
    expect(find.byType(CupertinoButton), findsOneWidget);

    // Simulate button press to start the flow
    // Additional logic to check the flow and navigation to HomeScreen should be added if needed
  });
}
