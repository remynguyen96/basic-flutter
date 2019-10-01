import 'package:first_app/ios/bmi.dart';
import 'package:first_app/ios/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppIOS extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
//        brightness: Brightness.dark,
        primaryColor: Color(0xff59FFCF),
        primaryContrastingColor: Color(0xff536DFE),
        barBackgroundColor: Color(0xff4C4C4C),
      ),
      title: 'Flutter IOS',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      localizationsDelegates: const<LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            title: Text('Settings'),
            icon: Icon(CupertinoIcons.settings),
          ),
          BottomNavigationBarItem(
            title: Text('BMI'),
            icon: Icon(CupertinoIcons.settings_solid),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int i) {
        if (i == 0) {
          return Bmi();
        } else {
          return Settings();
        }
      },
    );
  }
}

///
