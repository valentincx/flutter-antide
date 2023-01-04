import 'dart:ui';

import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../sign/sign_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, SignScreen.routeName);
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_full.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
