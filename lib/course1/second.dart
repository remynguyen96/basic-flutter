import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondCourse extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.all(20),
//      width: 400,
//      height: 500,
//      decoration: BoxDecoration(
//        color: Colors.deepOrangeAccent,
//        image: DecorationImage(
////          https://openclipart.org/image/300px/svg_to_png/176055/044tt482e2.png
//          image: NetworkImage('http://bit.ly/flutter_tiger'),
//          fit: BoxFit.scaleDown,
//          repeat: ImageRepeat.noRepeat,
//        ),
//        gradient: LinearGradient(
//          colors: [Colors.deepOrangeAccent[100], Colors.deepOrangeAccent[400]]
//        ),
////        gradient: RadialGradient(
//////            begin: Alignment(0.0, -1.0),
//////            end: Alignment(0.0, 0.8),
////            radius: .2,
////            center: Alignment(-0.5, 0.8),
////            tileMode: TileMode.clamp,
////            colors: [
////              Colors.purple[50],
////              Colors.green[200],
////              Colors.purple[500],
////            ]),
//        shape: BoxShape.rectangle,
//        borderRadius: BorderRadius.all(
//          const Radius.circular(40),
//        ),
//      ),
//    );
//  }
}

class _AreaCalculatorState extends State<SecondCourse> {
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  List<String> shapes = ['Rectangle', 'Triangle'];
  String currentShape;
  String result;
  double width = 0;
  double height = 0;

  @override
  void initState() {
    super.initState();
    result = '0';
    currentShape = 'Rectangle';
    widthController.addListener(_updateWidth);
    heightController.addListener(_updateHeight);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            DropdownButton(
              value: currentShape,
              items: shapes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: _onChangeShape,
            ),
            ShapeContainer(shape: currentShape),
            AreaTextField(controller: widthController, hint: 'Width'),
            AreaTextField(controller: heightController, hint: 'Height'),
            Container(
              margin: EdgeInsets.all(12),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text(
                  'Calculate Area',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: calculateArea,
              ),
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateArea() {
    double area;

    if (currentShape == 'Rectangle') {
      area = width * height;
    } else if (currentShape == 'Triangle') {
      area = width * height / 2;
    } else {
      area = 0;
    }

    setState(() {
      result = 'The area is ' + area.toString();
    });
  }

  void _onChangeShape(String shape) {
    setState(() => currentShape = shape);
  }

  void _updateHeight() {
    setState(() {
      if (heightController.text != '') {
        height = double.parse(heightController.text);
      } else {
        height = 0;
      }
    });
  }

  void _updateWidth() {
    setState(() {
      if (widthController.text != '') {
        width = double.parse(widthController.text);
      } else {
        width = 0;
      }
    });
  }
}

class AreaTextField extends StatelessWidget {
  AreaTextField({this.controller, this.hint});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final Icon prefixIcon = hint == 'Width' ? Icon(Icons.border_bottom) : Icon(Icons.border_left);

    return Container(
      margin: EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hint,
          filled: true,
          focusColor: Colors.deepOrangeAccent,
          fillColor: Colors.blueGrey,
        ),
      ),
    );
  }
}

class ShapeContainer extends StatelessWidget {
  final String shape;

  const ShapeContainer({Key key, this.shape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shape == 'Triangle') {
      return CustomPaint(
        size: Size(100, 100),
        painter: TrianglePainter(),
      );
    } else {
      return CustomPaint(
        size: Size(100, 100),
        painter: RectanglePainter(),
      );
    }
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepOrangeAccent;
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepPurple;
    Rect rect = Rect.fromLTRB(0, size.height / 4, size.width, size.height / 4 * 3);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
