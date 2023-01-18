import 'package:flutter/material.dart';
import 'package:infoflight/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                  itemCount: splashData.length,
                  itemBuilder: (context, index) {
                    return SplashContent(splashData: splashData, index: index,);
                  }),
            ),
          )
        ],
      ),
    ));
  }
}


