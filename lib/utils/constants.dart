// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

abstract class Constants {
  static const AIRFIELD_INFO_URL =
      "https://api-redemet.decea.mil.br/aerodromos/?api_key=Ab7mwKofsb2zfTUStwB3ltFSlkO20Ab4bxIczWlu&pais=Brasil";
  static const AIRFIELD_STATUS_URL =
      "https://api-redemet.decea.mil.br/aerodromos/status/pais/BRASIL?api_key=Ab7mwKofsb2zfTUStwB3ltFSlkO20Ab4bxIczWlu";

  static const kBackgroundColor = Color.fromRGBO(26, 26, 26, 1.0);
  static const KHighLightColor = Color.fromARGB(200, 252, 184, 74);
  static const kTextColor = Color.fromARGB(255, 238, 238, 238);
  static const kNeutralColor = Color.fromARGB(255, 184, 184, 184);
  static const kBackgroundGradient = LinearGradient(
      colors: [Color.fromARGB(15, 139, 139, 139), Color.fromARGB(255, 3, 3, 3)],
      begin: Alignment(0, -1),
      end: Alignment(0, 0.6));

  static const kTextStyleNeutral = TextStyle(
      color: kNeutralColor, fontSize: 16, fontWeight: FontWeight.w400);

  static final RegExp regExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+.[a-zA-Z]+");
  static final RegExp regEpxUpperLowerCase = RegExp(r"(?=.*[a-z])(?=.*[A-Z])");
  static final RegExp regEpxSymbols = RegExp(r"[^a-z0-9]", caseSensitive: false);
  

  static const String kEmailNullError = 'Por favor, insira seu email.';
  static const String kInvalidEmailError = 'Por favor, insira um email válido.';
  static const String kPassNullError = 'Por favor, insira sua senha.';
  static const String kMatchPassError = 'As senhas não conferem.';
}
