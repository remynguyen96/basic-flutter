import 'package:flutter/material.dart';
//import 'package:first_app/course1/first.dart';
//import 'package:first_app/course1/second.dart';
//import 'package:first_app/course1/third.dart';
//import 'package:first_app/course1/fouth.dart';
//import 'package:first_app/course1/fifth.dart';
//import 'package:first_app/course1/sixth.dart';
//import 'package:first_app/navigation/art_route.dart';
import 'package:first_app/navigation/art_util.dart';
import 'stateful.dart';

class MyApp extends StatelessWidget {
  DefaultTabController _firstHomepage() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Navigation Art'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.art_track),
                text: ArtUtil.VANGOSH,
              ),
              Tab(
                icon: Icon(Icons.art_track),
                text: ArtUtil.CARAVAGGIO,
              ),
              Tab(
                icon: Icon(Icons.art_track),
                text: ArtUtil.MONET,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ArtUtil.IMG_VANGOSH),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ArtUtil.IMG_CARAVAGGIO),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ArtUtil.IMG_MONET),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

  void openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Next page'),
          ),
          body: const Center(
            child: Text(
              'This is the next page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff388E3C),
        accentColor: Color(0xff536DFE),
        primarySwatch: Colors.blue,
        fontFamily: 'SF-Pro-Text-Regular',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 16),
        ),
      ),
//      home: ArtRoute(art: ArtUtil.IMG_CARAVAGGIO),
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Settings Dashboard'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              },
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
              onPressed: () {
                openPage(context);
              },
            ),
          ],
        ),
//        body: SixthCourse(),
//        body: FifthCourse(),
//        body: FouthCourse(),
//        body: ThirdCourse(),
//        body: SecondCourse(),
//        body: FirstCourse(),
//        body: ParentWidget(),
        body: TapboxA(),

//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.lightbulb_outline),
//          onPressed: () {},
//        ),

//        persistentFooterButtons: <Widget>[
//          IconButton(
//            onPressed: () {},
//            icon: Icon(Icons.add_location),
//          ),
//          IconButton(
//            onPressed: () {},
//            icon: Icon(Icons.add_alarm),
//          ),
//        ],
      ),
    );
  }
}
