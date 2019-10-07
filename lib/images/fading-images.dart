import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadingImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        ),
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                  child: FadeInImage.memoryNetwork(
                    image: 'https://picsum.photos/250?image=9',
                    placeholder: kTransparentImage,
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Center(
                  child: FadeInImage.assetNetwork(
                    image: 'https://picsum.photos/250?image=9',
//                    placeholder: Image.network('asdsad'),
                    placeholder: 'images/pic5.jpg',
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
