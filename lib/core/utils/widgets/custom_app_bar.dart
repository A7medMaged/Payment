import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/theme/text_style.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    leading: SvgPicture.asset(
      'assets/svgs/arrow.svg',
      fit: BoxFit.scaleDown,
    ),
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: TextStyles.style25,
    ),
  );
}
