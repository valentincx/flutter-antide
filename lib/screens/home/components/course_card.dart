import 'package:flutter/material.dart';

import '../../../components/custom_button_icon.dart';
import '../../../size_config.dart';
import '../../../theme/constants.dart';
import '../../course/course_screen.dart';

class CourseCard extends StatelessWidget {
  final String title, text, image;
  CourseCard(this.title, this.text, this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
          width: double.infinity,
          height: getProportionateScreenWidth(170),
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
              vertical: getProportionateScreenWidth(20)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (Theme.of(context).brightness == Brightness.dark)
                ? backgroundTileColor
                : kBackgroundTileColor,
          ),
          child: Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
                flex: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? backgroundColor
                            : kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: getProportionateScreenWidth(21),
                      ),
                    ),
                    Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: getProportionateScreenWidth(14),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenWidth(15)),
                    CustomButtonIcon(
                      text: "watch now",
                      darkColor: true,
                      press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CourseScreen())),
                    ),
                  ],
                )),
            Expanded(
              flex: 45,
              child: Image.asset(
                image,
              ),
            ),
          ])),
    );
  }
}
