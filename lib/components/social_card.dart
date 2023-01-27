import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class SocialCard extends StatelessWidget {
  final String icon;
  final void Function()? press;

  const SocialCard({
    super.key,
    required this.icon,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(45),
        width: getProportionateScreenHeight(45),
        decoration: const BoxDecoration(
          color: Constants.kNeutralColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
