import 'package:first_app/ios/util.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int unit = 0;

  void _onValueChanged(int value) {
    Util.saveSettings(value);
    if (value != unit) {
      setState(() {
        unit = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Map<int, Widget> systems = const <int, Widget>{
      0: Text('Decimal'),
      1: Text('Imperial'),
    };
    Util.getSettings().then(_onValueChanged);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Image.network('https://bit.ly/img_bmi'),
            Util.paddingTop,
            Row(
              children: <Widget>[
                SizedBox(
                  width: width,
                  child: CupertinoSegmentedControl(
                    children: systems,
                    groupValue: unit,
                    onValueChanged: _onValueChanged,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
