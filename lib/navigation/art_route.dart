import 'package:first_app/navigation/art_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  static int _currentIndex = 0;

  ArtRoute({@required this.art});

  void _changeRoute(BuildContext context, String menuItem) {
    String image;
    switch (menuItem) {
      case ArtUtil.MONET:
        image = ArtUtil.IMG_MONET;
        break;
      case ArtUtil.VANGOSH:
        image = ArtUtil.IMG_VANGOSH;
        break;
      case ArtUtil.CARAVAGGIO:
        image = ArtUtil.IMG_CARAVAGGIO;
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ArtRoute(art: image),
      ),
    );
  }

  List<Widget> _drawerWidget(BuildContext context) {
    List<Widget> children = List<Widget>();
    final DrawerHeader DrawHeader = DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/pic5.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Text(
        'Choose your art',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    );
    final ListTile Caravanggio = ListTile(
      title: Text(ArtUtil.CARAVAGGIO),
      onTap: () => _changeRoute(context, ArtUtil.CARAVAGGIO),
      trailing: Icon(Icons.art_track),
    );
    final ListTile Monet = ListTile(
      title: Text(ArtUtil.MONET),
      onTap: () => _changeRoute(context, ArtUtil.MONET),
      trailing: Icon(Icons.art_track),
    );
    final ListTile vangosh = ListTile(
      title: Text(ArtUtil.VANGOSH),
      onTap: () => _changeRoute(context, ArtUtil.VANGOSH),
      trailing: Icon(Icons.art_track),
    );

    children.add(DrawHeader);
    children.add(Caravanggio);
    children.add(Monet);
    children.add(vangosh);

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: _drawerWidget(context),
        ),
      ),
      appBar: AppBar(
        title: Text('Navigation Art'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.image),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem<String>(
                  child: Text(item),
                  value: item,
                );
              }).toList();
            },
            onSelected: (value) => _changeRoute(context, value),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(art),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            title: Text(ArtUtil.CARAVAGGIO),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            title: Text(ArtUtil.VANGOSH),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            title: Text(ArtUtil.MONET),
          ),
        ],
        selectedItemColor: Colors.lime[600],
        currentIndex: _currentIndex,
        onTap: (value) {
          String _artist = ArtUtil.menuItems[value];
          _currentIndex = value;
          _changeRoute(context, _artist);
        },
      ),
    );
  }
}
