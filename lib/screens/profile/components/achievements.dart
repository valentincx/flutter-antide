import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../size_config.dart';

class Achievements extends StatelessWidget {
  const Achievements({
    Key key,
    this.text,
    this.acquired,
    this.image,
  }) : super(key: key);
  final String text, acquired, image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.emoji_events, color: Colors.white),
              SizedBox(height: getProportionateScreenHeight(7)),
              Text(
                text,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Container(
          color: !identical(acquired, '1')
              ? Theme.of(context).scaffoldBackgroundColor.withOpacity(.50)
              : Theme.of(context).scaffoldBackgroundColor.withOpacity(.00),
        ),
      ]),
    );
  }
}
