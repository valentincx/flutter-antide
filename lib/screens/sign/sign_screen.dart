import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/default_button.dart';
import '../../components/no_account_text.dart';
import '../../size_config.dart';
import '../sign_in/sign_in_screen.dart';

class SignScreen extends StatelessWidget {
  static String routeName = "/sign";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_full.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30)),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/images/illustrations/Logo.svg",
                            color: Color(0xFFFFFFFF),
                            height: getProportionateScreenWidth(191),
                            width: getProportionateScreenWidth(199),
                          ),
                          SizedBox(height: getProportionateScreenWidth(40)),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Welcome\n",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getProportionateScreenWidth(34),
                                      fontWeight: FontWeight.bold,
                                      height: 1.4),
                                ),
                                TextSpan(
                                  text:
                                      "Do meditation. Stay focused. \n Live a healthy life.",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(20),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      height: 1.4),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: getProportionateScreenWidth(80)),
                          DefaultButton(
                            text: "Login With Email",
                            press: () {
                              Navigator.pushReplacementNamed(
                                  context, SignInScreen.routeName);
                            },
                          ),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          NoAccountText(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
