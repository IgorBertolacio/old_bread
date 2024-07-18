// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:old_bread/main.dart';
import 'package:old_bread/themeBread.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Define um tema de teste
    final testTheme = MaterialTheme(const TextTheme()).light();

    // Constrói o aplicativo e dispara um quadro.
    await tester.pumpWidget(OldBreadApp(theme: testTheme));

    // Verifica se o contador começa em 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Toca no ícone de '+' e dispara um quadro.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica se o contador foi incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
