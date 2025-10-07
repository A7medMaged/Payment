import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/theme/text_style.dart';

AppBar buildAppBar({required String title, required void Function()? onTap}) {
  void Function()? onTap;
  return AppBar(
    centerTitle: true,
    elevation: 0,
    leading: GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        'assets/svgs/arrow.svg',
        fit: BoxFit.scaleDown,
      ),
    ),
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: TextStyles.style25,
    ),
  );
}
