import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final List<String> paymentMethodsItems = const [
    'assets/svgs/card.svg',
    'assets/svgs/paypal.svg',
  ];

  int activeIndex = 0;

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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                svgPath: paymentMethodsItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
