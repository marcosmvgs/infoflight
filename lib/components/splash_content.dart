import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.splashData, required this.index,
  }) : super(key: key);

  final List<Map<String, String>> splashData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          splashData[index]['text']!,
          textAlign: TextAlign.center,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}