import 'package:flutter/material.dart';
import 'package:infoflight/components/textfield_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Size size;

  RoundedInputField({
    Key? key,
    required this.size,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  final RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      size: size,
      child: TextFormField(
        validator: (email_) {
          final email = email_ ?? '';
          if (!regExp.hasMatch(email)) {
            return 'Email inválido';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
