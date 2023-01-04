import 'package:flutter/material.dart';

import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
        child: SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(61),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
            ),
            onPressed: press,
            child: Text(text,
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(25),
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
        ));
  }
}
