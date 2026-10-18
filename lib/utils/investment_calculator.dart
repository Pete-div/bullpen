import 'package:flutter/material.dart';


class InvestmentCalculator {
  static double calculateProfit({
    required double buyPrice,
    required double sellPrice,
    required int quantity,
  }) {
    if (buyPrice < 0) {
      throw ArgumentError('Buy price cannot be negative');
    }

    if (sellPrice < 0) {
      throw ArgumentError('Sell price cannot be negative');
    }

    if (quantity < 0) {
      throw ArgumentError('Quantity cannot be negative');
    }

    return (sellPrice - buyPrice) * quantity;
  }
}


class ShareQuantityWidget extends StatefulWidget {
  const ShareQuantityWidget({
    super.key,
    required this.sharePrice,
  });

  final double sharePrice;

  @override
  State<ShareQuantityWidget> createState() =>
      _ShareQuantityWidgetState();
}

class _ShareQuantityWidgetState extends State<ShareQuantityWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Share price: ₦${widget.sharePrice.toStringAsFixed(2)}'),
        Text('Quantity: $quantity'),
        Text(
          'Total: ₦${(widget.sharePrice * quantity).toStringAsFixed(2)}',
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
          child: const Text('Add share'),
        ),
      ],
    );
  }
}