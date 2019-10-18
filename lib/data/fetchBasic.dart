import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppFetchData(post: fetchPost()),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, @required this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      userId: json['userId'],
      id: json['id'],
      body: json['body'],
    );
  }
}

//Future<http.Response> fetchPost() {
//  return http.get('https://jsonplaceholder.typicode.com/posts/1');
//}

Future<Post> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
//  final response = await http.get(
//    'https://jsonplaceholder.typicode.com/posts/1',
//    headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
//  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);

    return Post.fromJson(responseJson);
  } else {
    throw Exception('Failed to load post');
  }
}

class AppFetchData extends StatelessWidget {
  final Future<Post> post;

  AppFetchData({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          initialData: Post(body: 'body', title: 'title', id: 44, userId: 44),
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ID ---- ${snapshot.data.id.toString()}'),
                    SizedBox(height: 20),
                    Text('UserID ---- ${snapshot.data.userId.toString()}'),
                    SizedBox(height: 20),
                    Text('Title ---- ${snapshot.data.title}'),
                    SizedBox(height: 20),
                    Text('Body ---- ${snapshot.data.body}'),
                  ],
                ),
              );
            } else {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
