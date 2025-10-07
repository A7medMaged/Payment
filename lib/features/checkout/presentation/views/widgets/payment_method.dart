import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});
  final List<String> paymentMethodsItems = const [
    'assets/svgs/card.svg',
    'assets/svgs/paypal.svg',
    'assets/svgs/applepay.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PaymentMethodItem(
              isActive: false,
              svgPath: paymentMethodsItems[index],
            ),
          );
        },
      ),
    );
  }
}
