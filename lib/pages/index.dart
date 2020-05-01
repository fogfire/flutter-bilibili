import 'package:flutter/material.dart';
import 'home.dart';
import 'channel.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _bottomNavigationBarTapIndex = 0;
  Widget _body = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      drawer: _Drawer(),
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