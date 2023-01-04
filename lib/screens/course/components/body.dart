import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';
import '../../../theme/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SizedBox(
          height: getProportionateScreenWidth(40),
          width: getProportionateScreenWidth(40),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.keyboard_backspace,
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? darkColor
                      : kLightColor)),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30)),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Meditation\n",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(35),
                        fontWeight: FontWeight.bold,
                        height: 1.4),
                  ),
                  TextSpan(
                    text:
                        "Guided by a short introductory course,\n start trying meditation.",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).textTheme.subtitle1.color,
                        height: 1.4),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          SvgPicture.asset(
            "assets/images/illustrations/meditating.svg",
            height: getProportionateScreenHeight(218),
            width: getProportionateScreenHeight(283),
            color: (Theme.of(context).brightness == Brightness.dark)
                ? Theme.of(context).primaryColor
                : kTextLightColor,
          ),
          //heeeeeeeeere
          SizedBox(height: getProportionateScreenHeight(25)),
          Text(
            "45:00",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(38),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          SizedBox(
            width: getProportionateScreenWidth(190),
            child: DefaultButton(
              text: "Start Now",
              press: () {
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      )
    ]);
  }
}
