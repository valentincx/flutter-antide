import 'package:flutter/material.dart';

import '../size_config.dart';

// Dark Theme
final primaryColor = Color(0xFF7C9A92);
final primaryColorLight = Color(0xFF69B09C);
final primaryColorDark = Color(0xFF498A78);
final backgroundColor = Color(0xFF212121);
final backgroundTileColor = Color(0xFFF7F3F0);
final lightColor = Colors.white;
final darkColor = Colors.black;
final textColor = Colors.white;
final textLightColor = Color(0xFFBDC2C2);
final primaryStatsColor = Color(0xFF3A5051);
final secondaryStatsColor = Color(0xFF95CBCF);

// Light Theme
final kPrimaryColor = Color(0xFF61B15A);
final kPrimaryColorLight = Color(0xFFADCE74);
final kPrimaryColorDark = Color(0xFF61B15A);
final kBackgroundColor = Colors.white;
final kBackgroundTileColor = Color(0xFFF4F8EC);
final kLightColor = Colors.white;
final kDarkColor = Color(0xFF818586);
final kDarkerColor = Colors.black;
final kTextColor = Colors.black;
final kTextLightColor = Color(0xFFAEAEAE);
final kPrimaryStatsColor = Color(0xFFADCE74);
final kSecondaryStatsColor = Color(0xFFFFF54E);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final splashStyle = TextStyle(
  fontSize: getProportionateScreenWidth(36),
  fontWeight: FontWeight.w300,
  color: Colors.black,
  height: 1.2,
);

final splashStyleBold = TextStyle(
  fontSize: getProportionateScreenWidth(36),
  fontWeight: FontWeight.w900,
  color: Colors.black,
  height: 1.2,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
