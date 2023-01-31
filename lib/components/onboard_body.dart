import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/pageview_onboard_screen.dart';
import 'package:infoflight/utils/app_routes.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class OnboardBody extends StatelessWidget {
  const OnboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            height: size.height,
            width: size.width,
            child: Image.asset(
              "assets/images/clay-banks-O5hfuVWgsS8-unsplash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(20)),
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                const Text('InfoFlight',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: Constants.KHighLightColor,
                      fontSize: 70,
                    )),
                const PageViewOnboardScreen(),
                SizedBox(height: getProportionateScreenWidth(300)),
                ButtonMockUp(
                  labelText: 'Entrar',
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.AUTH_OR_APP);
                  },
                  backColor: Constants.KHighLightColor,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

