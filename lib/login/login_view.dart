import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: BodyWidget(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        tooltip: 'Floating Action',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final loginViewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      loginViewModel.emailSink.add(emailController.text);
    });
    passController.addListener(() {
      loginViewModel.passSink.add(passController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      transform: Matrix4.translationValues(0, -80, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(
            size: 140,
            style: FlutterLogoStyle.horizontal,
          ),
          StreamBuilder<Object>(
            stream: loginViewModel.emailStream,
            builder: (context, snapshot) {
              return TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "example@gmail.com",
                  labelText: "Email",
                  errorText: snapshot.data,
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<Object>(
            stream: loginViewModel.passStream,
            builder: (context, snapshot) {
              return TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Password",
                  errorText: snapshot.data,
                ),
              );
            },
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 45,
            width: 200,
            child: StreamBuilder<Object>(
              stream: loginViewModel.btnStream,
              builder: (context, snapshot) {
                return RaisedButton(
                  onPressed: snapshot.data == true ? () {} : null,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
