import 'package:flutter/material.dart';
import './channel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, @required this.arg}) : super(key: key);

  final String arg;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavigationBarTapIndex = 0;
  Widget _body = Home();

  void _onBottomNavigationBarTap(int index) {
    print(index);
    setState(() {
      _bottomNavigationBarTapIndex = index;
      switch (index) {
        case 0:
          _body = Home();
          break;
        case 1:
          _body = Channel();
          break;
        default:
          _body = Home();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink[300],
        type: BottomNavigationBarType.fixed,
        onTap: _onBottomNavigationBarTap,
        currentIndex: _bottomNavigationBarTapIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('频道')),
          BottomNavigationBarItem(icon: Icon(Icons.toys), title: Text('动态')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), title: Text('会员购')),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: , 头像
        title: Container(child: Row(children: [Icon(Icons.search), Spacer()])),
        actions: <Widget>[
          Icon(Icons.games),
          Icon(Icons.file_download),
          Icon(Icons.email)
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Text('直播'),
            Text('推荐'),
            Text('热门'),
            Text('追番'),
            Text('影视'),
            Text('抗击肺炎'),
            Text('学习区'),
            Text('新时代'),
          ],
          labelColor: Colors.grey,
          indicatorColor: Colors.pink[300],
        ),
      ),
    );
  }
}
