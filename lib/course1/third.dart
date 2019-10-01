import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Stack(
        children: showPizzaLayout(sizeX, sizeY),
//        children: createSquares(5),
      ),
    );
  }

//  List<Widget> createSquares(int numberSquares) {
//    int i = 0;
//    List<Color> colors = [
//      Colors.amber,
//      Colors.redAccent,
//      Colors.greenAccent,
//      Colors.indigo,
//      Colors.deepPurple,
//    ];
//    List<Widget> squares = List<Widget>();
//    squares.add(
//      Container(
//        color: Colors.redAccent[100],
//      ),
//    );
//    while (i < numberSquares) {
//      Positioned square = Positioned(
//        top: 100 + i.toDouble() * 100,
//        left: 25 + i.toDouble() * 25,
//        child: Container(
//          child: Container(
//            color: colors[i],
//            width: 60.0 * (numberSquares - i),
//            height: 60.0 * (numberSquares - i),
//            child: Text(
//              i.toString(),
//              style: TextStyle(fontSize: 24),
//            ),
//          ),
//        ),
//      );
//      i++;
//      squares.add(square);
//    }
//
//    return squares;
//  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = List<Widget>();
    Container background = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('http://bit.ly/pizzaimage'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
    layoutChildren.add(background);

    Positioned pizzaCard = Positioned(
      top: sizeY / 20,
      left: sizeX / 50,
      child: Card(
        elevation: 24,
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'Pizza Marghrita',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.deepOrange[800],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'This delious pizza is made of Tomato.'
                '\nCheese Morilla made by Vietnam.'
                '\nSeriously you can\'t miss it.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    layoutChildren.add(pizzaCard);

    Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.orange[900],
        child: Text(
          'Order Now',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        onPressed: () {},
      ),
    );
    layoutChildren.add(buttonOrder);

    return layoutChildren;
  }
}

//class ThirdCourse1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final sizeX = MediaQuery.of(context).size.width;
//    final sizeY = MediaQuery.of(context).size.height;
//    return Container(
//      margin: EdgeInsets.all(8),
//      width: sizeX,
//      height: sizeY,
//      child: Row(
//        verticalDirection: VerticalDirection.up,
//        textDirection: TextDirection.rtl,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: createSquares(5),
//      ),
//    );
//  }
//
//  List<Widget> createSquares(int numberSquares) {
//    int i = 0;
//    List<Color> colors = [
//      Colors.amber,
//      Colors.redAccent,
//      Colors.greenAccent,
//      Colors.indigo,
//      Colors.deepPurple,
//    ];
//    List<Widget> squares = List<Widget>();
//    while (i < numberSquares) {
//      Expanded square = Expanded(
//        flex: i,
//        child: Container(
//          color: colors[i],
////        width: 60,
////        height: 60,
//          child: Text(i.toString()),
//        ),
//      );
//      i++;
//      squares.add(square);
//    }
//
//    return squares;
//  }
//}
