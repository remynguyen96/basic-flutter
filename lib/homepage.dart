import 'package:flutter/material.dart';
import 'common/theme.dart';

//import 'course/Part6.dart';
import 'course/Part7.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: appTheme,
      home: LayoutFlutter(),
    );
  }
}

//https://github.com/flutter/flutter/issues/25370#issuecomment-540947710
