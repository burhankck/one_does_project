// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_does_project/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // SharedPreferences için başlangıç değerlerini ayarla
    SharedPreferences.setMockInitialValues({'counter': 0});

    // SharedPreferences örneğini al
    final preferences = await SharedPreferences.getInstance();

    // MyApp widget'ını preferences ile başlat
    await tester.pumpWidget(MyApp(preferences: preferences, navigatorKey: navigatorKey,));

    // Counter başlangıçta 0 mı?
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // '+' ikonuna tıkla ve çerçeveyi yeniden oluştur
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Counter artmış mı?
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

