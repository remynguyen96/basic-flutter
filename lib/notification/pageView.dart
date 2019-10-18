import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Button'),
      ),
      body: PageViewCustom(),
    );
  }
}

class PageViewCustom extends StatefulWidget {
  @override
  _StatePageView createState() => _StatePageView();
}

class _StatePageView extends State<PageViewCustom> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Center(
          child: Text(
            "First Page",
            style: TextStyle(fontSize: 32, color: Colors.deepOrange),
          ),
        ),
        Center(
          child: Text(
            "Second Page",
            style: TextStyle(fontSize: 32, color: Colors.green),
          ),
        ),
        Center(
          child: Text(
            "Third Page",
            style: TextStyle(fontSize: 32, color: Colors.lightBlue),
          ),
        ),
      ],
    );
  }
}
