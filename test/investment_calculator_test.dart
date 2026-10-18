import 'package:bullpen/utils/investment_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InvestmentCalculator.calculateProfit', () {
    test('calculates profit when selling price is higher', () {
      const buyPrice = 100.0;
      const sellPrice = 130.0;
      const quantity = 10;

     final profit = InvestmentCalculator.calculateProfit(
        buyPrice: buyPrice,
        sellPrice: sellPrice,
        quantity: quantity,
      );

      expect(profit, 300.0);
    });

    test('calculates a loss when selling price is lower', () {
      final profit = InvestmentCalculator.calculateProfit(
        buyPrice: 100,
        sellPrice: 80,
        quantity: 10,
      );

      expect(profit, -200.0);
    });
test('throws an error when quantity is negative', () {
  expect(
    () => InvestmentCalculator.calculateProfit(
      buyPrice: 100,
      sellPrice: 130,
      quantity: -5,
    ),
    throwsArgumentError,
  );
});

test('throws an error when buy price is negative', () {
  expect(
    () => InvestmentCalculator.calculateProfit(
      buyPrice: -100,
      sellPrice: 130,
      quantity: 5,
    ),
    throwsArgumentError,
  );
});
    test('returns zero when buying and selling prices are equal', () {
      final profit = InvestmentCalculator.calculateProfit(
        buyPrice: 100,
        sellPrice: 100,
        quantity: 10,
      );

      expect(profit, 0.0);
    });
  });
}