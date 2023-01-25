import 'package:flutter/material.dart';
import 'package:infoflight/components/textfield_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChaged;
  const RoundedPasswordField({
    Key? key,
    required this.size,
    required this.onChaged,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        size: size,
        child: TextField(
          onChanged: onChaged,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
              border: InputBorder.none,
              icon: Icon(
                Icons.lock,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              suffixIcon: Icon(Icons.visibility,
                  color: Theme.of(context).scaffoldBackgroundColor)),
        ));
  }
}
