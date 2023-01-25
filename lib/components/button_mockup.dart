import 'package:flutter/material.dart';

class ButtonMockUp extends StatelessWidget {
  final String labelText;
  final void Function()? onPressed;
  final Color backColor;

  const ButtonMockUp({
    Key? key,
    required this.labelText,
    required this.onPressed,
    required this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(backColor)),
        onPressed: onPressed,
        child: Text(
          labelText,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
