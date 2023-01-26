import 'package:flutter/material.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(error: errors[index]))
    );
  }

  Row formErrorText({String? error}) {
    return Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 18,),
          SizedBox(width: getProportionateScreenWidth(10)),
          Text(error ?? 'Aconteceu algum erro', style: const TextStyle(
            color: Constants.kNeutralColor
          ),),
          
        ],
      );
  }
}
