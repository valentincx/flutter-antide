import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../components/custom_button_icon.dart';
import '../../../models/Sound.dart';
import '../../../size_config.dart';
import '../../player/player_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(30)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Container(
                  width: double.infinity,
                  height: getProportionateScreenWidth(195),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(40),
                      vertical: getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          matchTextDirection: true,
                          repeat: ImageRepeat.noRepeat,
                          image: AssetImage(
                              "assets/images/landscapes/landscape_1.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Relax Sounds",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenWidth(27),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Text(
                          "Sometimes the most productive thing you can do is relax.",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(15),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      CustomButtonIcon(
                        text: "play now",
                        darkColor: false,
                        press: () {
                          //Navigator.pushNamed(context, PlayerScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              ListView.builder(
                itemCount: demoSounds.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenWidth(20)),
                  child: new Container(
                      child: ListTile(
                    leading: SizedBox(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          children: <Widget>[
                            Center(child: CircularProgressIndicator()),
                            Center(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(15.0)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: demoSounds[index].image,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    title: Text(
                      demoSounds[index].title,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: Text(
                      demoSounds[index].artist,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    trailing: Text.rich(
                      TextSpan(
                        text: demoSounds[index].duration.toString(),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: " min",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PlayerScreen(sound: demoSounds[index])));
                    },
                  )),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
            ],
          ),
        )),
      ],
    );
  }
}

class SoundArguments {
  final Sound sound;

  SoundArguments({@required this.sound});
}
