import 'package:flutter/material.dart';

import 'login/login_view.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
      home: LoginPage(),
    );
  }
}
