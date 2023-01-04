import 'package:flutter/material.dart';

import '../screens/sign_up/sign_up_screen.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(
            fontSize: getProportionateScreenHeight(20),
            color: (ModalRoute.of(context).settings.name == "/sign"
                ? Colors.white
                : Theme.of(context).primaryColor),
          ),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushReplacementNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
              fontWeight: FontWeight.w700,
              color: (ModalRoute.of(context).settings.name == "/sign"
                  ? Colors.white
                  : Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
