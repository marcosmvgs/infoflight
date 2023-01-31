import 'package:flutter/material.dart';
import 'package:infoflight/core/services/auth_service.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';
import '../core/models/auth_form_data.dart';
import 'forms/signup_form.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      if (!mounted) return;
      setState(() => _isLoading = true);
      await AuthService().signup(
        'Marcos',
        formData.email,
        formData.password,
      );
    } catch (error) {
      rethrow;
    } finally {
      setState(() => _isLoading = false);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(40),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(10),
        ),
        child: Column(
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            const Text(
              'Registrar conta',
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Oswald',
                  color: Constants.KHighLightColor),
            ),
            const Text(
              'Preencha os campos ou prossiga com uma Media Social',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            SignupForm(onSubmit: _handleSubmit),
          ],
        ),
      ),
    );
  }
}
