import 'package:flutter/material.dart';
import 'package:infoflight/components/textfield_container.dart';

class RoundedInputPasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChaged;
  final String labelText;
  const RoundedInputPasswordField({
    Key? key,
    required this.size,
    required this.onChaged,
    required this.labelText,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final Size size;

  @override
  State<RoundedInputPasswordField> createState() =>
      _RoundedInputPasswordFieldState();
}

class _RoundedInputPasswordFieldState extends State<RoundedInputPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        size: widget.size,
        child: TextFormField(
          onSaved: widget.onSaved,
          validator: widget.validator,
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
