import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FifthCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: ListView(
        children: showContacts(),
      ),
    );
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

  List<Contact> buildContact() {
    List<Contact> contacts = List<Contact>();
    contacts.add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
    contacts.add(Contact('Frank Slade', 'Scent of a Woman', Icons.sentiment_satisfied));
    contacts.add(
        Contact('Mildred Hayes', 'Three Billboards Outside Ebbing, Missouri', Icons.sentiment_dissatisfied));
    contacts.add(Contact('Bruce Wayne', 'The Dark Night', Icons.sentiment_neutral));
    contacts.add(Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_satisfied));
    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContact();
    List<ListTile> list = List<ListTile>();

    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContact());
    }

    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subTitle),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.orange,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => true,
      ));
    });

    return list;
  }
}

class Contact {
  String name;
  String subTitle;
  IconData icon;
  Contact(this.name, this.subTitle, this.icon);
}
