import 'package:flutter/material.dart';

class CartVeiw extends StatelessWidget {
  const CartVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart View',
        ),
      ),
      body: const Center(
        child: Text(
          'Cart View',
        ),
      ),
    );
  }
}
