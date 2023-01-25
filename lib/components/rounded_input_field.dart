import 'package:flutter/material.dart';
import 'package:infoflight/components/textfield_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Size size;

  const RoundedInputField({
    Key? key,
    required this.size,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      size: size,
      child: TextFormField(
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

