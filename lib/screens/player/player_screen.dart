import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/constants.dart';
import 'package:provider/provider.dart';

import '../../models/Sound.dart';
import '../../size_config.dart';
import '../../theme/constants.dart';
import 'player_widget.dart';

typedef void OnError(Exception exception);

class PlayerScreen extends StatefulWidget {
  static String routeName = "/player";
  final Sound sound;

  const PlayerScreen({
    Key key,
    @required this.sound,
  }) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // implement wantKeepAlive
  bool get wantKeepAlive => true;

  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  String localFilePath;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      // Calls to Platform.isIOS fails on web
      return;
    }
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      advancedPlayer.startHeadlessService();
    }
  }

  Widget remoteUrl() {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SizedBox(
          height: getProportionateScreenWidth(40),
          width: getProportionateScreenWidth(40),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.keyboard_backspace,
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? darkColor
                      : kLightColor)),
        ),
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getProportionateScreenHeight(250.0),
              height: getProportionateScreenHeight(250.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(widget.sound.image),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Text.rich(
              TextSpan(
                text: widget.sound.title + "\n",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(31),
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "By: " + widget.sound.artist,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(21),
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            PlayerWidget(url: widget.sound.sound, id: widget.sound.id),
            SizedBox(height: getProportionateScreenHeight(20)),
          ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(providers: [
      StreamProvider<Duration>.value(
          initialData: Duration(),
          value: advancedPlayer.onAudioPositionChanged),
    ], child: remoteUrl()));
  }
}
