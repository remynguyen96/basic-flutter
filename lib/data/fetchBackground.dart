import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final repsonse = await client.get('http://jsonplaceholder.typicode.com/photos?_limit=10');

//  return parsePhotos(repsonse.body);
  return compute(parsePhotos, repsonse.body);
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  PhotoList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => Image.network(photos[index].thumbnailUrl),
      itemCount: photos.length,
    );
  }
}

class AppFetchData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate Demo'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotoList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppFetchData(),
    );
  }
}
