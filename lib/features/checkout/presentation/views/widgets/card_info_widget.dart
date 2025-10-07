import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/theme/text_style.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/logo.svg'),
          const SizedBox(
            width: 23,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit Card',
                style: TextStyles.style18,
              ),
              Text(
                'Mastercard **78',
                style: TextStyles.style16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
