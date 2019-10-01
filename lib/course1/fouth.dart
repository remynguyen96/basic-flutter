import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FouthCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
//      child: ListView(
//        children: createSquare,
//        scrollDirection: Axis.horizontal,
//      ),
      child: ListView.separated(
        itemCount: 25,
        itemBuilder: (context, index) => createSquare(index),
        separatorBuilder: (context, index) => createSeparator(index),
      ),
    );
  }

  List<Widget> createSquares(int numberSquares) {
    int i = 0;
    List<Color> colors = [
      Colors.amber,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.indigo,
      Colors.deepPurple,
    ];
    List<Widget> squares = List<Widget>();
    squares.add(
      Container(
        color: Colors.redAccent[100],
      ),
    );
    while (i < numberSquares) {
      Container square = Container(
        color: colors[i % 5],
        width: 100,
        height: 100,
        child: Text(
          i.toString(),
          style: TextStyle(fontSize: 24),
        ),
      );
      i++;
      squares.add(square);
    }

    return squares;
  }

  Widget createSquare(int position) {
    List<Color> colors = [
      Colors.amber,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.indigo,
      Colors.deepPurple,
    ];
    Container square = Container(
      color: colors[position % 5],
      width: 100,
      height: 100,
      child: Text(
        position.toString(),
        style: TextStyle(fontSize: 24),
      ),
    );

    return square;
  }

  Widget createSeparator(int position) {
    Widget separator = Container(
      height: 15,
      color: Colors.black,
    );
    return separator;
  }
}
