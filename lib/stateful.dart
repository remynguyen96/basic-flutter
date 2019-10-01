import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The widget manages its own state
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  double sideLength = 100;
  double _volume = 0.0;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Column _boxWidget() => Column(
        children: <Widget>[
          Text(
            _active ? 'Active' : 'Inactive',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          RichText(
            text: TextSpan(
              text: 'Hello ',
//                style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'bold',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' world!',
                  children: <InlineSpan>[
                    TextSpan(
                      text: '.',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: null,
                child: Text('Disabled Button'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Enable Button'),
              ),
            ],
          )
        ],
      );

  Widget _inkWidget() {
//    final double maxWidth = MediaQuery.of(context).size.width;
    return Center(
      child: AnimatedContainer(
        width: sideLength,
        height: sideLength,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
        child: Material(
          color: Colors.yellow,
          child: InkWell(
            onTap: () {
              setState(() {
                sideLength == 100 ? sideLength = 250 : sideLength = 100;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
//        width: 200,
//        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                child: Ink(
                  height: 150,
                  width: 150,
                  decoration: ShapeDecoration(
                    color: Colors.yellow,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.android),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _volume += 10;
                      });
                    },
                  ),
                ),
              ),
            ),
            Text('Volume : $_volume')
          ],
        ),
//        child: _inkWidget(),
      ),
    );
  }
}

/// *----------------------------------*

/// The parent widget manages the widget’s state
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TapboxB(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
          SizedBox(height: 24),
          TapboxC(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
        ],
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  void _dialogNote(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Noticed'),
            content: Text('Thanks For Your Reading'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          padding: EdgeInsets.only(left: 8),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.only(left: 4),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                  child: Text(
                    'Subscribed',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  elevation: 5,
                  color: Colors.green,
                  onPressed: () {
                    _dialogNote(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  String sayHello() {
    String hello;
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    if (hour < 12)
      hello = "Good Morning";
    else if (hour < 18)
      hello = "Good Afternoon";
    else
      hello = "Good Evening";
    String minutes = (minute < 10) ? "0" + minute.toString() : minute.toString();

    return "$hello \n ${hour.toString()}h:$minutes";
  }

  @override
  Widget build(BuildContext context) {
    String activeTxt = widget.active ? sayHello() : 'Off';
    Color colorActive = widget.active ? Colors.lightGreen[700] : Colors.grey[600];
    var _borderBox = _highlight
        ? Border.all(
            color: Colors.teal[700],
            width: 10,
          )
        : null;

    return GestureDetector(
      onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          color: colorActive,
          border: _borderBox,
        ),
        child: Center(
          child: Text(
            activeTxt,
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              fontFamily: 'SF-Pro-Text-Medium',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
