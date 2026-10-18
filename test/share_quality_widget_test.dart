import 'package:bullpen/utils/investment_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ShareQuantityWidget', () {
    testWidgets('displays the initial share price and quantity', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ShareQuantityWidget(sharePrice: 100)),
        ),
      );

      expect(find.text('Share price: ₦100.00'), findsOneWidget);
      expect(find.text('Quantity: 1'), findsOneWidget);
      expect(find.text('Total: ₦100.00'), findsOneWidget);
    });

    testWidgets('increases quantity when Add share is tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ShareQuantityWidget(sharePrice: 100)),
        ),
      );
      // Act
      await tester.tap(find.text('Add share'));
      await tester.pump();

      expect(find.text('Quantity: 2'), findsOneWidget);
      expect(find.text('Total: ₦200.00'), findsOneWidget);
    });
  });
}
