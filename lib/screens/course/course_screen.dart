import 'package:flutter/material.dart';

import 'components/body.dart';

class CourseScreen extends StatelessWidget {
  static String routeName = "/course";
  const CourseScreen({Key key, this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Body(),
      ),
    );
  }
}
