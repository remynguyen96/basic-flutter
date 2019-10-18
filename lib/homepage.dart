import 'package:flutter/material.dart';

//import 'login/login_view.dart';
//import 'navigation/FirstStep.dart';
//import 'navigation/NavigateParams.dart';
//import 'navigation/NavigationData.dart';
//import 'navigation/NavigationData2.dart';

//import 'data/fetchBasic.dart';
import 'data/fetchBackground.dart';

//import 'notification/First.dart';
//import 'notification/pageView.dart';
//import 'notification/preferences.dart';

//import 'images/fading-images.dart';

//import 'ListView/different-types.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation with Arguments',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff388E3C),
        accentColor: Color(0xff536DFE),
        primarySwatch: Colors.blue,
        fontFamily: 'SF-Pro-Text-Regular',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 16),
        ),
      ),

      /// General Navigation
//      initialRoute: '/',
//      routes: {
//        '/': (context) => HomeScreen(),
//        '/second': (context) => SecondStep(),
//      },

      /// Navigation with parameters
//      onGenerateRoute: (settings) {
//        if (settings.name == PassArgumentsScreen.routeName) {
//          final ScreenArguments args = settings.arguments;
//
//          return MaterialPageRoute(
//            settings: RouteSettings(
//              name: 'Text PassArgumentsScreen',
//            ),
//            builder: (context) => PassArgumentsScreen(
//              title: args.title,
//              message: args.message,
//            ),
//          );
//        }
//
//        return null;
//      },

      home: HomeScreen(),
//      home: FadingImages(),
//      home: LoginPage(),
    );
  }
}
