import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class NewWordEnglish extends StatefulWidget {
  NewWordEnglish({Key key}) : super(key: key);

//  @override
//  _HandleTextState createState() => _HandleTextState();

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _HandleTextState extends State<NewWordEnglish> {
  bool toggle = true;
  String textToShow = "Basic Flutter For Newcommers";

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    return toggle ? Text('Toggle One') : MaterialButton(onPressed: () {}, child: Text('Toggle Two'));
  }

  void _updateText() {
    setState(() {
      textToShow = WordPair.random().asUpperCase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Handle New State")),
//      body: Center(child: Text(textToShow)),
      body: Center(child: _getToggleChild()),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
//        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}

class _RandomWordsState extends State<NewWordEnglish> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) return Divider();

        final int index = i ~/ 2;

        if (index >= _suggestions.length) _suggestions.addAll(generateWordPairs().take(10));

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.asUpperCase, style: _biggerFont));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NewWordEnglish(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
