import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:antide/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      var emailField = find.byType(TextFormField).first;
      var passwordField = find.byType(TextFormField).last;
      var loginButton = find.byType(ElevatedButton).first;

      // Enter text for the email address
      await tester.enterText(emailField, 'flutterexp@gmail.com');
      await Future.delayed(Duration(seconds: 1));

      // Enter text for the password
      await tester.enterText(passwordField, '1234564155');
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      var lessonButton = find.byType(ElevatedButton).first;

      await tester.tap(lessonButton);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 1));

      //expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text("45:00"), findsWidgets);
      //expect(find.text("46:00"), findsWidgets); // is failing so it's correct
    });
  });
}
