import 'package:first_app/ios/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  int unit;

  void showResult() async {
    double _height;
    double _weight;
    int unit = await Util.getSettings();
    _height = double.tryParse(heightController.text);
    _weight = double.tryParse(weightController.text);
    double result = Util.calculateBMI(_height, _weight, unit);
    String message = 'Your BMI is ${result.toStringAsFixed(2)}';
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
      title: Text('Result'),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }

  void onSetting (int value) {
    setState(() {
      unit = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('BMI'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: height * 0.8, // 80%
            ),
            child: Column(
              children: <Widget>[
                Image.asset('images/pic5.jpg'),
                Util.paddingTop,
                Row(
                  children: <Widget>[
                    Util.paddingLeft,
                    Container(
                      width: width / 3,
                      child: Text('Height'),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: heightController,
                        style: Util.textStyle,
                        decoration: Util.textFieldDecoration,
                        onChanged: null,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Util.paddingLeft,
                  ],
                ),
                Util.paddingTop,
                Row(
                  children: <Widget>[
                    Util.paddingLeft,
                    Container(
                      width: width / 3,
                      child: Text('Weight'),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: weightController,
                        style: Util.textStyle,
                        decoration: Util.textFieldDecoration,
                        onChanged: null,
                        keyboardType: TextInputType.number,

                      ),
                    ),
                    Util.paddingLeft,
                  ],
                ),
                Expanded(
                  child: Util.paddingTop,
                ),
                CupertinoButton.filled(
                  onPressed: showResult,
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(
                      color: const Color(0xffF13235F),
                    ),
                  ),
                ),
                Util.paddingTop,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
