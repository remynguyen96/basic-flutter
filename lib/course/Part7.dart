import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade600,
      body: SafeArea(
        child: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1, rightDiceNumber = Random().nextInt(6) + 1;

  void onChangeNumberDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () => onChangeNumberDice(),
              child: Image.asset('images/dice${leftDiceNumber}.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () => onChangeNumberDice(),
              child: Image.asset('images/dice${rightDiceNumber}.png'),
            ),
          ),
        ],
      ),
    );
  }
}
