import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Step On Screen'),
      ),
      body: Center(
        child: SizedBox(
          height: 50,
          width: 200,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => SecondStep(),
//                ),
//              );
            },
            child: Text('Navigate to new route'),
          ),
        ),
      ),
    );
  }
}

class SecondStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Step On Screen'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
//            Navigator.pushNamed(context, '/');
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
