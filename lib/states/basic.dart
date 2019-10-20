import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class User {
  String _name;

  set name(name) => _name = name;
  String get name => _name;
}

class BasicProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = User();
    user.name = 'Remy Nguyễn';

    return Provider<User>.value(
      value: user,
      child: WidgetElements(),
    );
  }
}

class WidgetElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          WidgetWithComsumer(),
          SizedBox(height: 32),
          WidgetNotComsumer(),
        ],
      ),
    );
  }
}

class WidgetWithComsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) => Text(user.name),
    );
  }
}

class WidgetNotComsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Container(
      child: Text(user.name),
    );
  }
}

class HomepageApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: BasicProvider(),
    );
  }
}
