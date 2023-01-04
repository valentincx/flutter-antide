import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import '../../../theme/constants.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/images/feelings/calm.svg", "text": "Calm"},
      {"icon": "assets/images/feelings/relax.svg", "text": "Relax"},
      {"icon": "assets/images/feelings/focus.svg", "text": "Focus"},
      {"icon": "assets/images/feelings/anxious2.svg", "text": "Anxious"},
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? backgroundTileColor
                    : kPrimaryColorLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(icon,
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? backgroundColor
                      : kLightColor),
            ),
            SizedBox(height: getProportionateScreenWidth(5)),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
