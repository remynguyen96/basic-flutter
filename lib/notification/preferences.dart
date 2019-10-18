import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Preferences'),
      ),
      body: SharePreferencesCustom(),
    );
  }
}

class SharePreferencesCustom extends StatefulWidget {
  @override
  _StateShare createState() => _StateShare();
}

class _StateShare extends State<SharePreferencesCustom> {
  String input, username;

  @override
  void initState() {
    super.initState();
    getSharePrefs();
  }

  Future<Null> getSharePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usernamePrefs = prefs.getString("username");

    setState(() {
      username = usernamePrefs;
    });
  }

  Future<Null> _storeInput() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", input);
    setState(() {
      username = input;
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 24,
        ),
        Center(
          child: Text(
            username ?? 'Placeholder Username',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        TextField(
          onChanged: (String value) {
            input = value;
          },
        ),
        SizedBox(
          height: 32,
        ),
        RaisedButton(
          child: Text('Save Username'),
          onPressed: _storeInput,
        ),
        RaisedButton(
          child: Text('Increment Counter'),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }
}
