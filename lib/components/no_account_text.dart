import 'package:flutter/material.dart';
import 'package:infoflight/utils/app_routes.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Não tem uma conta? ',
          style: Constants.kTextStyleNeutral,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SIGNUP),
          child: Text(
            'Cadastre-se? ',
            style: TextStyle(
              color: Constants.kNeutralColor,
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
