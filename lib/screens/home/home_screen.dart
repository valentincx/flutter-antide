import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/Sound.dart';
import '../../size_config.dart';
import '../../theme/theme_manager.dart';
import '../profile/profile_screen.dart';
import '../sound/sound_screen.dart';
import 'components/body.dart';
import 'components/tools.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool status = false;
  var themeMode = "Light";
  final List<Map<String, String>> toolsData = [
    {
      "text": "Mood Journal",
      "image": "assets/icons/tools_1.svg",
      "destination": ""
    },
    {
      "text": "Mood Booster",
      "image": "assets/icons/tools_2.svg",
      "destination": ""
    },
    {
      "text": "Positive Notes",
      "image": "assets/icons/tools_3.svg",
      "destination": ""
    },
    {
      "text": "Trigger Plan",
      "image": "assets/icons/tools_4.svg",
      "destination": ""
    },
    {
      "text": "Goal Trainer",
      "image": "assets/icons/tools_5.svg",
      "destination": ""
    },
    {
      "text": "Courses",
      "image": "assets/icons/tools_1.svg",
      "destination": "/home"
    },
  ];

  int _selectedIndex = 0;
  List<int> _history = [0];
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  TabController _tabController;
  List<Widget> mainTabs;
  List<BuildContext> navStack = [
    null,
    null,
    null
  ]; // one buildContext for each tab to store history of navigation

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    mainTabs = <Widget>[
      Navigator(onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
          // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
          navStack[0] = context;
          return Body();
        });
      }),
      Navigator(onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
          // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
          navStack[1] = context;
          return SoundScreen();
        });
      }),
      Navigator(onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(pageBuilder: (context, animiX, animiY) {
          // use page PageRouteBuilder instead of 'PageRouteBuilder' to avoid material route animation
          navStack[2] = context;
          return ProfileScreen();
        });
      }),
    ];
    Future.delayed(Duration.zero, () {
      themeMode =
          (Theme.of(context).brightness == Brightness.dark) ? 'Dark' : 'Light';
    });
    super.initState();
  }

  final List<BottomNavigationBarRootItem> bottomNavigationBarRootItems = [
    BottomNavigationBarRootItem(
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 25.0,
        ),
        title: Text('Home'),
      ),
    ),
    BottomNavigationBarRootItem(
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: Icon(
          Icons.library_music,
          size: 25.0,
        ),
        title: Text('Sounds'),
      ),
    ),
    BottomNavigationBarRootItem(
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: Icon(
          Icons.face,
          size: 25.0,
        ),
        title: Text('Profile'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    var themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    themeMode =
        (Theme.of(context).brightness == Brightness.dark) ? 'Dark' : 'Light';

    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(navStack[_tabController.index]).canPop()) {
          Navigator.of(navStack[_tabController.index]).pop();
          setState(() {
            _selectedIndex = _tabController.index;
          });
          return false;
        } else {
          if (_tabController.index == 0) {
            setState(() {
              _selectedIndex = _tabController.index;
            });
            SystemChannels.platform
                .invokeMethod('SystemNavigator.pop'); // close the app
            return true;
          } else {
            _tabController.index =
                0; // back to first tap if current tab history stack is empty
            setState(() {
              _selectedIndex = _tabController.index;
            });
            return false;
          }
        }
      },
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: mainTabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).accentColor,
          type: BottomNavigationBarType.fixed,
          items: bottomNavigationBarRootItems
              .map((e) => e.bottomNavigationBarItem)
              .toList(),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        drawer: SafeArea(
          child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: double.infinity,
                    child: Text(
                      "Tools",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(31),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    margin: EdgeInsets.all(0.0),
                    padding: EdgeInsets.all(getProportionateScreenWidth(20))),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(20)),
                  child: GridView.builder(
                    itemCount: toolsData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          SizeConfig.orientation == Orientation.landscape
                              ? 3
                              : 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.33,
                    ),
                    itemBuilder: (context, index) => Tools(
                      image: toolsData[index]["image"],
                      text: toolsData[index]['text'],
                      destination: toolsData[index]['destination'],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Theme: $themeMode',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          //color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Switch(
                        activeColor: Theme.of(context).accentColor,
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            if (themeMode == 'Light') {
                              themeNotifier.setDarkMode();
                            } else {
                              themeNotifier.setLightMode();
                            }
                            themeMode = (themeNotifier.getTheme().brightness ==
                                    Brightness.dark)
                                ? 'Dark'
                                : 'Light';
                            status = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    _tabController.index = index;
    setState(() => _selectedIndex = index);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: getProportionateScreenHeight(110), // Set this height
      leading: Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(20),
            getProportionateScreenHeight(50),
            getProportionateScreenWidth(0),
            getProportionateScreenHeight(10),
          ),
          child: IconButton(
            icon: Icon(Icons.menu, color: Theme.of(context).primaryColor),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        );
      }),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(20),
              getProportionateScreenHeight(50),
              getProportionateScreenWidth(20),
              getProportionateScreenHeight(10),
            ),
            child: InkWell(
              onTap: () {
                _tabController.index = 2;
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: Builder(builder: (context) {
                if (_tabController.index != 2) {
                  return new Container(
                    height: getProportionateScreenHeight(35.0),
                    width: getProportionateScreenHeight(35.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_pic.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                } else {
                  return new Container();
                }
              }),
            ))
      ],
    );
  }
}

class BottomNavigationBarRootItem {
  final String routeName;
  final NestedNavigator nestedNavigator;
  final BottomNavigationBarItem bottomNavigationBarItem;

  BottomNavigationBarRootItem({
    @required this.routeName,
    @required this.nestedNavigator,
    @required this.bottomNavigationBarItem,
  });
}

abstract class NestedNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  NestedNavigator({Key key, @required this.navigatorKey}) : super(key: key);
}

class HomeNavigator extends NestedNavigator {
  HomeNavigator({Key key, @required GlobalKey<NavigatorState> navigatorKey})
      : super(
          key: key,
          navigatorKey: navigatorKey,
        );

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => Body();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}

class SoundArguments {
  final Sound sound;

  SoundArguments({@required this.sound});
}
