import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key key, @required this.arg }) : super(key: key);

  final String arg;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: , 头像
        title: Container(child: Row( children: [ Icon(Icons.search), Spacer()])),
        actions: <Widget>[
          Icon(Icons.games),
          Icon(Icons.file_download),
          Icon(Icons.email)
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Text('直播'),
            Text('直播'),
            Text('直播'),
            Text('直播'),
            Text('直播'),
          ],
          labelColor: Colors.grey,
          indicatorColor: Colors.pink[300],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('频道')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('动态')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('会员购')),
        ],
      ),
    );
  }
}