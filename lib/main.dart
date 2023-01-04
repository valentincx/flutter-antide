import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'screens/splash/splash_screen.dart';
//import 'screens/home/home_screen.dart';
import 'theme/theme_manager.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) => MaterialApp(
              theme: theme.getTheme(),
              title: 'Antide',
              initialRoute: SplashScreen.routeName,
              //initialRoute: HomeScreen.routeName,
              routes: routes,
            ));
  }
}
