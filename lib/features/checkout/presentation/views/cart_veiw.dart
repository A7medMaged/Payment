import 'package:flutter/material.dart';
import 'package:payment/core/utils/widgets/custom_app_bar.dart';
import 'package:payment/features/checkout/presentation/views/cart_view_body.dart';

class CartVeiw extends StatelessWidget {
  const CartVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const CartViewBody(),
    );
  }
}
