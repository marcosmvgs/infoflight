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
        children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])));
  }

  Row formErrorText({String? error}) {
    return Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red.shade700,
          size: 18,
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(
          error ?? 'Aconteceu algum erro',
          style: const TextStyle(color: Constants.kNeutralColor),
        ),
      ],
    );
  }
}

void getEmailErrorString(String? oldValue,
    void Function(void Function()) setarEstado, List<String> errors) {
  final newValue = oldValue ?? '';
  if (newValue.isEmpty && !errors.contains(Constants.kEmailNullError)) {
    setarEstado(() {
      errors.add(Constants.kEmailNullError);
    });
  } else if (!Constants.regExp.hasMatch(newValue) &&
      !errors.contains(Constants.kInvalidEmailError)) {
    setarEstado(() {
      errors.add(Constants.kInvalidEmailError);
    });
  } else {
    return;
  }
}

class FormPasswordcheck extends StatelessWidget {
  final List<bool> requirementColor;
  const FormPasswordcheck({super.key, required this.requirementColor});

  final List<Text> requirements = const [
    Text('Pelo menos 6 caracteres'),
    Text('Letras Maiúsculas e minúsculas'),
    Text('Símbolos')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            3,
            (index) => formRequirementText(
                  requirement: requirements[index],
                  color: requirementColor[index],
                )));
  }

  Row formRequirementText({
    required Text requirement,
    required bool color,
  }) {
    return Row(
      children: [
        color
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.error, color: Colors.red),
        SizedBox(width: getProportionateScreenWidth(10)),
        requirement,
      ],
    );
  }
}
