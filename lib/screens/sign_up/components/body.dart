import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/sign_in_text.dart';
import '../../../size_config.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Positioned.fill(
          child: SvgPicture.asset(
            "assets/images/illustrations/leaves.svg",
            color: Theme.of(context).accentColor,
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: getProportionateScreenHeight(100)),
                  SvgPicture.asset(
                    "assets/images/illustrations/Logo.svg",
                    color: (Theme.of(context).brightness == Brightness.dark)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor,
                    height: getProportionateScreenHeight(49),
                    width: getProportionateScreenHeight(43),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: getProportionateScreenHeight(30),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Text(
                    "Sign up now for free and start meditating, and explore Antide.",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(22),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(50)),
                  SignUpForm(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  SignInText(),
                  SizedBox(height: getProportionateScreenHeight(50)),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
