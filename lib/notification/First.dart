import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Button'),
      ),
      body: CustomButton(),
    );
  }
}

class CustomButton extends StatefulWidget {
  _StateButton createState() => _StateButton();
}

class _StateButton extends State<CustomButton> {
  void onShowSnackbar() {
    final snackBar = SnackBar(
      content: Text("Hi"),
      action: SnackBarAction(
        label: "How are you today!",
        onPressed: () {},
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  void onShowBottom() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        height: 100,
        color: Colors.deepOrange,
        child: Center(
          child: Text("Bottom sheet Modal"),
        ),
      ),
    );
  }

  Future<Null> onShowDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Simple Dialog"),
          content: Text("The message you want write it here!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: MaterialButton(
            onPressed: () => onShowSnackbar(),
            child: Text('Snackbar'),
            color: Colors.lightBlue,
            textColor: Colors.white,
            splashColor: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: MaterialButton(
            onPressed: () => onShowBottom(),
            child: Text('Modal Bottom'),
            color: Colors.lightBlue,
            textColor: Colors.white,
            splashColor: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: MaterialButton(
            onPressed: () => onShowDialog(),
            child: Text('Dialog'),
            color: Colors.lightBlue,
            textColor: Colors.white,
            splashColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
