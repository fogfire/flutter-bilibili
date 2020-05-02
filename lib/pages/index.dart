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

  List<Widget> _getActions() {
    return [Icons.games, Icons.file_download, Icons.email]
        .map(
          (v) => SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () => {},
              icon: Icon(v),
              iconSize: 20,
              padding: EdgeInsets.all(0),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          leading: _Leading(),
          title: _Title(),
          actions: _getActions(),
        ),
      ),
      drawer: _Drawer(),
      bottomNavigationBar: BottomNavigationBar(
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

class _Leading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('打开抽屉');
        Scaffold.of(context).openDrawer();
      },
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(height: 5.0, thickness: 2.0),
                Divider(height: 5.0, thickness: 2.0),
                Divider(height: 5.0, thickness: 2.0),
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

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 15,
              color: Color.fromRGBO(200, 200, 200, 0.4),
            ),
            Spacer(),
          ],
        ));
  }
}
