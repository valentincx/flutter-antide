import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Tools extends StatelessWidget {
  const Tools({
    Key key,
    this.text,
    this.image,
    this.destination,
  }) : super(key: key);
  final String text, image, destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (destination?.isEmpty ?? true) {
          Navigator.pop(context);
        } else {
          Navigator.pushNamed(context, destination);
        }
      },
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            //fit: BoxFit.fill,
            image: AssetImage("assets/images/tools.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              height: getProportionateScreenWidth(14),
              width: getProportionateScreenWidth(14),
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(13),
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
