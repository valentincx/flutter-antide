import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "FIND \nYOUR \nPERFECT \nFURNITURE",
      "image": "assets/images/splash_screen_1.jpg"
    },
    {
      "text": "THOUSANDS \nOF PRODUCTS \nFROM FAMOUS \nMANUFACTURERS",
      "image": "assets/images/splash_screen_2.jpg"
    },
    {
      "text": "INTELLIGENT \nSEARCH AND \nSELECTION OF \nFURNITURE",
      "image": "assets/images/splash_screen_3.jpg"
    },
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Widget nextButton() {
      return MaterialButton(
        onPressed: nextPage,
        elevation: 2.0,
        color: Colors.black,
        height: getProportionateScreenWidth(50),
        minWidth: getProportionateScreenWidth(50),
        child: SvgPicture.asset(
          "assets/icons/arrow_right.svg",
          color: Color(0xFFFFFFFF),
          height: getProportionateScreenWidth(15.0),
          width: getProportionateScreenWidth(15.0),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      );
    }

    Widget previousButton() {
      return MaterialButton(
        onPressed: previousPage,
        elevation: 2.0,
        color: Colors.white,
        height: getProportionateScreenWidth(50),
        minWidth: getProportionateScreenWidth(50),
        child: SvgPicture.asset(
          "assets/icons/arrow_left.svg",
          color: Color(0xFF000000),
          height: getProportionateScreenWidth(15.0),
          width: getProportionateScreenWidth(15.0),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      );
    }

    Widget continueButton() {
      return MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, SignInScreen.routeName);
        },
        elevation: 2.0,
        color: Colors.black,
        height: getProportionateScreenWidth(50),
        minWidth: getProportionateScreenWidth(50),
        child: SvgPicture.asset(
          "assets/icons/arrow_right.svg",
          color: Color(0xFFFFFFFF),
          height: getProportionateScreenWidth(15.0),
          width: getProportionateScreenWidth(15.0),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      );
    }

    return SafeArea(
      child: Stack(
        children: <Widget>[
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: _pageController,
            itemCount: splashData.length,
            itemBuilder: (context, index) => SplashContent(
              image: splashData[index]["image"],
              text: splashData[index]['text'],
              currentPage: currentPage,
            ),
          ),
          if (currentPage != splashData.length - 1)
            Positioned(
              bottom: getProportionateScreenWidth(40),
              right: getProportionateScreenWidth(40),
              child: nextButton(),
            ),
          if (currentPage == splashData.length - 1)
            Positioned(
              bottom: getProportionateScreenWidth(40),
              right: getProportionateScreenWidth(40),
              child: continueButton(),
            ),
          if (currentPage != 0)
            Positioned(
              bottom: getProportionateScreenWidth(40),
              left: getProportionateScreenWidth(40),
              child: previousButton(),
            ),
        ],
      ),
    );
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 300), curve: Curves.linearToEaseOut);
  }
}
