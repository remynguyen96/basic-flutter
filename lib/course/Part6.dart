import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = 'remy nguyen';
    List<String> listName = name.split(' ');
    name = listName.map((item) => '${item[0].toUpperCase()}${item.substring(1)}').join(' ');

    return Scaffold(
      backgroundColor: Colors.teal.shade500,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/pic1.jpg'),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'SVN Manus',
                  height: 1.6,
                ),
              ),
              Text(
                'Tipper Application'.toUpperCase(),
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'SF-Pro-Text',
                  fontWeight: FontWeight.w400,
                  height: 2,
                ),
              ),
              SizedBox(
                width: 150,
                height: 16,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 16, bottom: 8),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+84392932568',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal.shade500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 8),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'remynguyen96@email.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal.shade500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
