import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme/constants.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    Key key,
    this.text,
    this.press,
    this.darkColor,
  }) : super(key: key);
  final String text;
  final Function press;
  final bool darkColor;

  @override
  Widget build(BuildContext context) {
    final darkMode =
        (Theme.of(context).brightness == Brightness.dark) ? true : false;
    final textColor = darkColor
        ? (darkMode ? lightColor : kBackgroundColor)
        : (darkMode ? backgroundColor : kDarkerColor);
    final bgColor = darkColor
        ? (darkMode ? backgroundColor : kPrimaryColorDark)
        : (darkMode ? lightColor : kBackgroundColor);

    return ClipRRect(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
        child: SizedBox(
          width: getProportionateScreenWidth(140),
          height: getProportionateScreenWidth(38),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: bgColor,
            ),
            onPressed: press,
            // Navigator.pushNamed(context, CourseScreen.routeName),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(text,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        color: textColor,
                        fontWeight: FontWeight.w700)),
                SizedBox(width: getProportionateScreenWidth(4)),
                Icon(Icons.play_circle_filled,
                    size: getProportionateScreenWidth(14), color: textColor),
              ],
            ),
          ),
        ));
  }
}
