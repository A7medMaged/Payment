import 'package:flutter/material.dart';
import 'package:payment/core/utils/widgets/custom_button.dart';
import 'package:payment/features/checkout/presentation/views/widgets/oreder_info_item.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/cart.png',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrederInfoItem(
            orderName: 'Order Subtotal',
            orderPrice: '\$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrederInfoItem(
            orderName: 'Discount',
            orderPrice: '\$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrederInfoItem(
            orderName: 'Shipping',
            orderPrice: '\$8',
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            thickness: 2,
            endIndent: 18,
            indent: 18,
            color: Color(0xFFC7C7C7),
          ),
          const SizedBox(
            height: 12,
          ),
          const TotalPrice(totalPrice: '\$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(text: 'Proceed to Checkout', onPressed: () {}),
        ],
      ),
    );
  }
}
