import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/theme/text_style.dart';

class CartVeiw extends StatelessWidget {
  const CartVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: SvgPicture.asset(
          'assets/svgs/arrow.svg',
          fit: BoxFit.scaleDown,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart View',
          style: TextStyles.style25,
        ),
      ),
      body: Center(
        child: Text(
          'Payment App',
          style: TextStyles.style24,
        ),
      ),
    );
  }
}
