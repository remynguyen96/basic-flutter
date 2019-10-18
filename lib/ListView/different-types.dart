import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: ListViewCourse(
        items: List<ListItem>.generate(30, (index) {
          if (index % 6 == 0) {
            return HeadingItem(heading: "Heading $index");
          }

          return MessageItem(body: "Message body $index", sender: "Sender: $index");
        }),
      ),
    );
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem({this.heading});
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem({this.sender, this.body});
}

class ListViewCourse extends StatelessWidget {
  final List<ListItem> items;

  ListViewCourse({Key key, @required this.items}) : super(key: key);

  ListTile generateListTile(context, index, items) {
    final item = items[index];

    if (item is HeadingItem) {
      return ListTile(
        title: Text(
          item.heading,
          style: Theme.of(context).textTheme.headline,
        ),
      );
    }

    return ListTile(
      title: Text(item.sender),
      subtitle: Text(item.body),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => generateListTile(context, index, items),
      ),
    );
  }
}
