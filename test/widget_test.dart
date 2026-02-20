import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comvest/main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(
      MaterialApp(
        home: MyApp(savedLocale: Locale('en')), // FIX: Added savedLocale: Locale('en')
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
          Locale('ar'),
        ],
      ),
    );

    // Verify that our counter starts at 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}