import 'package:flutter/material.dart';
import 'package:infoflight/components/splash_content.dart';
import '../utils/constants.dart';

class PageViewOnboardScreen extends StatefulWidget {
  const PageViewOnboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PageViewOnboardScreen> createState() => _PageViewOnboardScreenState();
}

class _PageViewOnboardScreenState extends State<PageViewOnboardScreen> {
  final List<Map<String, String>> splashData = Constants.KsplashData;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
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
            (index) {
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
            },
          ),
        ),
      ],
    );
  }
}
