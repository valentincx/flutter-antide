import 'package:flutter/material.dart';

import 'components/body.dart';

class SoundScreen extends StatelessWidget {
  static String routeName = "/sound";
  const SoundScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Body(),
      ),
    );
  }
}