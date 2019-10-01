import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

/// The widget manages its own state
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

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
//      child: TapboxB(
//        active: _active,
//        onChanged: _handleTapboxChanged,
//      ),
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//class TapboxB extends StatelessWidget {
//  TapboxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);
//
//  final bool active;
//  final ValueChanged<bool> onChanged;
//
//  void _handleTap() {
//    onChanged(!active);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: _handleTap,
//      child: Container(
//        width: 200,
//        height: 200,
//        decoration: BoxDecoration(
//          color: active ? Colors.lightGreen[700] : Colors.grey[600],
//        ),
//        child: Center(
//          child: Text(
//            active ? 'Active' : 'Inactive',
//            style: TextStyle(fontSize: 32.0, color: Colors.white),
//          ),
//        ),
//      ),
//    );
//  }
//}

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

  @override
  Widget build(BuildContext context) {
    String activeTxt = widget.active ? 'Active' : 'Inactive';
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
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: colorActive,
          border: _borderBox,
        ),
        child: Center(
          child: Text(
            activeTxt,
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: ParentWidget(),
//          child: TapboxA(),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
