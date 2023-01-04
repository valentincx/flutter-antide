import 'package:antide/screens/home/components/course_card.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'course_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(height: getProportionateScreenWidth(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: "Welcome back, Afreen!\n"),
                    TextSpan(
                      text: "How are you feeling today ?",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).textTheme.subtitle1.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(20)),
            CourseCard(
                "Meditation 101",
                "Techniques, Benefits, and a Beginner’s How-To",
                "assets/images/illustrations/meditation_1.png"),
            SizedBox(height: getProportionateScreenWidth(20)),
            CourseCard(
                "Cardio Meditation",
                "Basics of Yoga for Beginners or Experienced Professionals",
                "assets/images/illustrations/cardio_1.png"),
            SizedBox(height: getProportionateScreenWidth(20)),
          ])),
    );
  }
}
