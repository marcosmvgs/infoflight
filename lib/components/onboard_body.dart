import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/splash_content.dart';
import 'package:infoflight/utils/app_routes.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class OnboardBody extends StatefulWidget {
  const OnboardBody({super.key});

  @override
  State<OnboardBody> createState() => _OnboardBodyState();
}

class _OnboardBodyState extends State<OnboardBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'text':
          'Seja Bem vindo.\n\nAqui você vai adquirir e compartilhar experiências na Aviação!',
      'image': 'assets/images/john-mcarthur-8KLLgqHMAv4-unsplash.jpg'
    },
    {

      'text': 'Faça consultas de meteorologia para planejar seu voo...',
      'image': 'assets/images/john-mcarthur-8KLLgqHMAv4-unsplash.jpg',
    },
    {
      'text': 'Registre suas horas de voo diretamente na CIV - Digital',
      'image': 'assets/images/john-mcarthur-8KLLgqHMAv4-unsplash.jpg'
    },
    {
      'text':
          'Encontre seus amigos aviadores e compartilhe suas experiências...',
      'image': 'assets/images/john-mcarthur-8KLLgqHMAv4-unsplash.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
          child: Stack(
              alignment: Alignment.center,
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
              vertical: getProportionateScreenHeight(20)
            ),
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
              Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              height: size.height * 0.2,
              width: size.width,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) {
                    return SplashContent(
                      splashData: splashData,
                      index: index,
                    );
                  }),
                      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(context, index: index),
                    ),
                  ),
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

  AnimatedContainer buildDot(BuildContext context, {required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Constants.KHighLightColor
            : const Color.fromARGB(255, 26, 26, 26),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
