import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class NewWordEnglish extends StatefulWidget {
  NewWordEnglish({Key key}) : super(key: key);

  @override
  _HandleTextState createState() => _HandleTextState();
}

class _HandleTextState extends State<NewWordEnglish> {
  bool toggle = true;
  String textToShow = "Basic Flutter";

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    final String txt = WordPair.random().asUpperCase;
    dynamic funcText(String infoTxt) {
      return Container(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ContainerUI(),
          DogName(infoTxt),
          SizedBox(height: 8),
        ],
      ));
    }

    return toggle ? funcText(txt) : MaterialButton(onPressed: () {}, child: Text(txt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(textToShow)),
      body: Container(child: _getToggleChild()),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}

class ContainerUI extends StatelessWidget {

  Widget ratingUI() {
    Widget stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
      ],
    );

    final ratings = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

    return ratings;
  }

  Widget listInfoUI() {
    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: <Widget>[
              Icon(Icons.kitchen, color: Colors.green[500]),
              Text('PREP:'),
              Text('25 min'),
            ]),
            Column(children: <Widget>[
              Icon(Icons.timer, color: Colors.green[500]),
              Text('COOK:'),
              Text('1 hr'),
            ]),
            Column(children: <Widget>[
              Icon(Icons.restaurant, color: Colors.green[500]),
              Text('FEEDS:'),
              Text('4-6'),
            ]),
          ],
        ),
      ),
    );

    return iconList;
  }

  @override
  Widget build(BuildContext context) {
    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    final subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
        'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
        'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );

    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: <Widget>[
          titleText,
          subTitle,
          ratingUI(),
          listInfoUI(),
        ],
      ),
    );
  }
}

class DogName extends StatelessWidget {
  final String name;

  const DogName(this.name);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NewWordEnglish(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
