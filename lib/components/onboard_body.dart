import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/splash_content.dart';
import 'package:infoflight/utils/app_routes.dart';

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
        child: SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            height: size.height,
            child: Image.asset(
                "assets/images/clay-banks-O5hfuVWgsS8-unsplash.jpg"),
          ),
          Positioned(
              child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black, Color.fromRGBO(1, 1, 1, 0.0)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
          )),
          Positioned(
            top: 50,
            child: Text(
              "infoFlight",
              style: TextStyle(
                fontFamily: 'Oswald',
                color: Theme.of(context).colorScheme.secondaryContainer,
                fontSize: 60,
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              height: size.height * 0.4,
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
          ),
          Positioned(
              top: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(context, index: index),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                        width: size.width * 0.9,
                        height: 50,
                        child: ButtonMockUp(
                          labelText: 'Login',
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                          },
                          backColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withAlpha(195),
                        )),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: size.width * 0.9,
                        height: 50,
                        child: ButtonMockUp(
                          labelText: 'Cadastrar',
                          onPressed: () {},
                          backColor: const Color.fromARGB(255, 204, 204, 204),
                        )),
                  ],
                ),
              ))
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
            ? Theme.of(context).colorScheme.secondaryContainer
            : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
