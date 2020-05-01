import 'package:flutter/material.dart';
import './channel.dart';

import '../components/HomeBody.dart';

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
  List<String> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = <String>['直播', '推荐', '热门', '追番', '影视', '抗击肺炎', '学习区', '新时代'];
    _tabController = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _getActions() {
    return [
      Icon(
        Icons.games,
        size: 20,
        color: Colors.grey,
      ),
      Icon(
        Icons.file_download,
        size: 20,
        color: Colors.grey,
      ),
      Icon(
        Icons.email,
        size: 20,
        color: Colors.grey,
      ),
    ].map((icon) => Padding(padding: EdgeInsets.all(8), child: icon)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          leading: _Leading(),
          title: Container(
              height: 30,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 15,
                    color: Colors.grey,
                  ),
                  Spacer(),
                ],
              )),
          actions: _getActions(),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: _tabs.map((v) => Text(v)).toList(),
            labelPadding: EdgeInsets.fromLTRB(10, 6, 10, 6),
            labelColor: Colors.pink[400],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.pink[400],
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
            ),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: _Drawer(),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((item) => HomeBody(name: item)).toList(),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: Center(
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: CircleAvatar(
                  child: Text('R'),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
          )
        ],
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(height: 5.0, thickness: 2.0, color: Colors.grey),
                Divider(height: 5.0, thickness: 2.0, color: Colors.grey),
                Divider(height: 5.0, thickness: 2.0, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 36,
                height: 36,
                child: ClipOval(
                  child: Image.asset('images/user-icon.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
