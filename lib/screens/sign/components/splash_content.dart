import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../theme/constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
    this.currentPage,
  }) : super(key: key);
  final String text, image;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    Widget getSplashText() {
      var splashText = text.split('\n');
      return RichText(
        text: TextSpan(
          text: splashText[0] ?? '',
          style: splashStyleBold,
          children: <TextSpan>[
            if (splashText[1] != null)
              TextSpan(text: '\n' + splashText[1], style: splashStyleBold),
            if (splashText[2] != null)
              TextSpan(text: '\n' + splashText[2], style: splashStyle),
            if (splashText[3] != null)
              TextSpan(text: '\n' + splashText[3], style: splashStyleBold),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(10),
              ),
              child: getSplashText(),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        3,
                        (index) => buildDot(index: index),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
