import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../size_config.dart';
import '../../../theme/constants.dart';

class SleepCard extends StatelessWidget {
  const SleepCard({
    Key key,
    this.index,
    this.icon,
    this.duration,
    this.text,
  }) : super(key: key);
  final String duration, text;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenWidth(160),
        decoration: BoxDecoration(
          color: index.isOdd
              ? ((Theme.of(context).brightness == Brightness.dark)
                  ? primaryColorDark
                  : kPrimaryColorDark)
              : ((Theme.of(context).brightness == Brightness.dark)
                  ? primaryColorLight
                  : kPrimaryColorLight),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Text(
              duration,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(12),
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
