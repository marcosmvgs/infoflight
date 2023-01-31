import 'package:flutter/material.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
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

class FormPasswordcheck extends StatelessWidget {
  final List<bool> requirementColor;
  const FormPasswordcheck({super.key, required this.requirementColor});

  final List<Text> requirements = const [
    Text('Senha deve ter ao menos 6 caracteres'),
    Text('Letras Maiúsculas e minúsculas'),
    Text('Símbolos'),
    Text('As senhas devem ser iguais'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            requirements.length,
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
            ? Icon(
                Icons.check,
                color: Colors.green.shade700,
                size: 18,
              )
            : Icon(Icons.error_outline, color: Colors.red.shade700, size: 18),
        SizedBox(width: getProportionateScreenWidth(10)),
        requirement,
      ],
    );
  }
}

bool validItemOnePassword(String password) {
  if (password.trim().length >= 6) {
    return true;
  } else {
    return false;
  }
}

bool validItemTwoPassword(String password) {
  if (Constants.regEpxUpperLowerCase.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

bool validItemThreePassword(String password) {
  if (Constants.regEpxSymbols.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

List<bool> validPasswordCreated(String password, AuthFormData confirmPassword) {
  final List<bool> validatingPasswordList = [];

  validatingPasswordList.add(password.trim().length >= 6 ? true : false);
  validatingPasswordList
      .add(Constants.regEpxUpperLowerCase.hasMatch(password) ? true : false);
  validatingPasswordList
      .add(Constants.regEpxSymbols.hasMatch(password) ? true : false);
  validatingPasswordList
      .add(password == confirmPassword.password ? true : false);

  return validatingPasswordList;
}

void onChangeEmail(
    String text, List<String> errors, void Function(void Function()) estado) {
  if (errors.contains(Constants.kEmailNullError)) {
    estado(() {
      errors.remove(Constants.kEmailNullError);
    });
  } else if (Constants.regExp.hasMatch(text) &&
      errors.contains(Constants.kInvalidEmailError)) {
    estado(() {
      errors.remove(Constants.kInvalidEmailError);
    });
  }
}

void onValidateEmail(
    String? text, List<String> errors, void Function(void Function()) estado) {
  if (text == null) return;
  if (text.isEmpty && !errors.contains(Constants.kEmailNullError)) {
    estado(() {
      errors.add(Constants.kEmailNullError);
    });
  } else if (!Constants.regExp.hasMatch(text) &&
      !errors.contains(Constants.kInvalidEmailError)) {
    estado(() {
      errors.add(Constants.kInvalidEmailError);
    });
  }
}
