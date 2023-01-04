import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(150),
      width: getProportionateScreenHeight(150),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_pic.png"),
          ),
          Positioned(
            right: getProportionateScreenHeight(-16),
            bottom: 0,
            child: SizedBox(
              height: getProportionateScreenHeight(46),
              width: getProportionateScreenHeight(46),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(getProportionateScreenHeight(10.0)),
                  color: Color(0xFFF5F6F9),
                  onPressed: () {},
                  child: Center(
                    child: Icon(
                      Icons.create,
                      color: Colors.black,
                      semanticLabel: 'edit',
                      size: getProportionateScreenHeight(24.0),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
