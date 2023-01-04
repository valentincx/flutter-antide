import 'package:flutter/material.dart';
import 'profile_pic.dart';
import 'sleep_card.dart';
import 'bar_chart.dart';
import 'line_chart.dart';
import 'achievements.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sleep = [
      {"duration":"1h 10m", "text": "Sleep"},
      {"duration":"5h 30m", "text": "Deep"},
      {"duration":"3h 30m", "text": "Quality"},
    ];
    List<IconData> sleepIcon = [
      Icons.nights_stay_rounded,
      Icons.hotel,
      Icons.grade,
    ];
    final List<Map<String, String>> achievementsData = [
      {
        "text": "Quality sleep",
        "acquired": "1",
        "image": "assets/images/tools.jpg"
      },
      {
        "text": "Snow White",
        "acquired": "",
        "image": "assets/images/tools4.jpg"
      },
      {
        "text": "Zen",
        "acquired": "1",
        "image": "assets/images/tools.jpg"
      },
      {
        "text": "Pillow lover",
        "acquired": "1",
        "image": "assets/images/tools.jpg"
      },
      {
        "text": "Hidden success",
        "acquired": "",
        "image": "assets/images/tools4.jpg"
      },
      {
        "text": "Goldilocks",
        "acquired": "1",
        "image": "assets/images/tools2.jpg"
      },
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          Center(
            child: ProfilePic(),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Center(
            child: Text.rich(
              TextSpan(
                text: "Afreen Khan\n",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(31),
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "Lucknow, India",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: getProportionateScreenHeight(60)),
          GridView.builder(
            shrinkWrap: true,
            itemCount: sleep.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .6250,
              crossAxisSpacing: getProportionateScreenWidth(15),
            ),
            itemBuilder: (BuildContext context, int index) {
              return SleepCard(
                index: index,
                icon: sleepIcon[index],
                duration: sleep[index]['duration'],
                text: sleep[index]['text'],
              );
            }
          ),
          SizedBox(height: getProportionateScreenHeight(60)),
          Text(
            "Bedtime",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(31),
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).accentColor,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
                    ),
                    labelStyle: TextStyle(fontSize: getProportionateScreenWidth(16.0), fontWeight: FontWeight.w700),  //For Selected tab
                    tabs: [
                      Tab(text: 'STATS'),
                      Tab(text: 'ACHIEVEMENTS'),
                    ],
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(640), //height of TabBarView
                  child: TabBarView(children: <Widget>[
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                          SizedBox(height: getProportionateScreenHeight(20)),
                          SizedBox(
                            height: getProportionateScreenHeight(300.0),
                            width: double.infinity,
                            child: BarChartSample2(),
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          SizedBox(
                            height: getProportionateScreenHeight(300.0),
                            width: double.infinity,
                            child: LineChartSample1(),
                          ),
                        ]
                      ),
                    ),
                    Container(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(20),
                            getProportionateScreenWidth(40),
                            getProportionateScreenWidth(20),
                            getProportionateScreenWidth(20)
                        ),
                        child: GridView.builder(
                          itemCount: achievementsData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                            SizeConfig.orientation == Orientation.landscape ? 3 : 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.33,
                          ),
                          itemBuilder: (context, index) => Achievements(
                            text: achievementsData[index]['text'],
                            acquired: achievementsData[index]['acquired'],
                            image: achievementsData[index]['image'],
                          ),
                        ),
                      ),
                    ),
                  ])
                )
              ])
            ),
            ]
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }

}
