import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final todos = List<Todo>.generate(
      20, (i) => Todo(title: 'Todo $i', description: 'A description of what needs to be done for Todo $i'));

  @override
  Widget build(BuildContext context) => TodosScreen(todos: todos);
}

class Todo {
  final String title;
  final String description;

  Todo({@required this.title, @required this.description});
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  void _navigationToPage(context, index) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(todo: todos[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () => _navigationToPage(context, index),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(todo.title),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                todo.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(todo.title),
//      ),
//      body: Padding(
//        padding: EdgeInsets.all(16.0),
//        child: Text(todo.description),
//      ),
//    );
  }
}
