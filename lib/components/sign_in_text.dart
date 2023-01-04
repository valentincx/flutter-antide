import 'package:flutter/material.dart';

import '../screens/sign_in/sign_in_screen.dart';
import '../size_config.dart';

class SignInText extends StatelessWidget {
  const SignInText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(
            fontSize: getProportionateScreenHeight(20),
            color: Theme.of(context).primaryColor,
          ),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushReplacementNamed(context, SignInScreen.routeName),
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
