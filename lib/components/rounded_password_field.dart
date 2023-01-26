import 'package:flutter/material.dart';
import 'package:infoflight/components/textfield_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChaged;
  final String labelText;
  const RoundedPasswordField({
    Key? key,
    required this.size,
    required this.onChaged,
    required this.labelText,
  }) : super(key: key);

  final Size size;

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        size: widget.size,
        child: TextFormField(
          validator: (password_) {
            final password = password_ ?? '';
            if (password.trim().length < 6) {
              return 'Senha deve ter no mínimo 6 caracteres';
            }
            return null;
          },
          onChanged: widget.onChaged,
          obscureText: _obscureText,
          decoration: InputDecoration(
              hintText: widget.labelText,
              border: InputBorder.none,
              icon: Icon(
                Icons.lock,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              suffixIcon: GestureDetector(
                onTap: (() {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }),
                child: Icon(Icons.visibility,
                    color: Theme.of(context).scaffoldBackgroundColor),
              )),
        ));
  }
}
