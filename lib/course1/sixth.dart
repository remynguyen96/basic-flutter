import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SixthCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
//        children: createSquares(50),
          children: createGallery(50),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          padding: EdgeInsets.all(5)),
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
        color: colors[i % colors.length],
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

  List<Widget> createGallery(int numImages) {
    int i = 0;
    Widget image;
    List<Widget> images = List<Widget>();
    List<String> urls = List<String>();

    urls.add('images/pic1.jpg');
    urls.add('images/pic2.jpg');
    urls.add('images/pic3.jpg');
    urls.add('images/pic4.jpg');
    urls.add('images/pic5.jpg');

    while (i < numImages) {
      image = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(urls[i % 5]),
          ),
        ),
//        child: Image.asset(urls[i % 5]),
//        child: Image.network('https://res.cloudinary.com/hhieu/image/upload/w_140,h_140/leaf_07_jaqr0i.png'),
      );
      images.add(image);
      i++;
    }

    return images;
  }
}
