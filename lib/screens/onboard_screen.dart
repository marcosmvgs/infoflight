import 'package:flutter/material.dart';
import 'package:infoflight/components/onboard_body.dart';
import 'package:infoflight/utils/size_config.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return const Scaffold(
      body: OnboardBody(),
    );
  }
}
