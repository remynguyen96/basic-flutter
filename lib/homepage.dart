import 'package:first_app/Counter/counter_presenter.dart';
import 'package:first_app/Counter/counter_view.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> implements CounterView {
  int count = 0;
  CounterPresenter presenter;

  _CounterWidgetState() {
    presenter = CounterPresenter();
    presenter.attachView(this);
  }

//  @override
//  void dispose() {
//    super.dispose();
//    if (presenter != null) {
//      presenter.deAttachView();
//    }
//  }
//  @override
//  void onDecrement(int value) {
//    setState(() {
//      count = value;
//    });
//  }
//  @override
//  void onIncrement(int value) {
//    setState(() {
//      count = value;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              presenter.increment();
            },
            child: Text('Increase'),
          ),
          Text('Count: $count'),
          RaisedButton(
            onPressed: () {
              presenter.decrement();
            },
            child: Text('Decrease'),
          ),
        ],
      ),
    );
  }
}

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings Dashboard'),
        ),
        body: CounterWidget(),
      ),
    );
  }
}
