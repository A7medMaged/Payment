import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/theme/text_style.dart';
import 'package:payment/features/settings/presentation/views/settings_view.dart';

AppBar buildAppBar({
  required String title,
  void Function()? onTap,
  BuildContext? context,
}) {
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
    actions: [
      if (context != null)
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsView()),
            );
          },
          icon: const Icon(Icons.settings),
        ),
    ],
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: TextStyles.style25,
    ),
  );
}
