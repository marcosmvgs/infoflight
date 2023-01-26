import 'package:flutter/material.dart';
import 'package:infoflight/components/textfield_container.dart';
import 'package:infoflight/utils/constants.dart';

class RoundedInputEmailField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Size size;
  final String? Function(String?)? validator;

  const RoundedInputEmailField(
      {Key? key,
      required this.size,
      required this.hintText,
      this.icon = Icons.person,
      required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      size: size,
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Constants.kBackgroundColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
