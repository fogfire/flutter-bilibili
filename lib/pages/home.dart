import 'package:flutter/material.dart';
import '../components/HomeBody.dart';

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
    return [Icons.games, Icons.file_download, Icons.email]
        .map((icon) => Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                icon,
                size: 20,
                color: Colors.grey,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          leading: _Leading(ctx: context),
          title: _Title(),
          actions: _getActions(),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: _tabs.map((v) => Text(v)).toList(),
            labelPadding: EdgeInsets.fromLTRB(12, 2, 12, 6),
            labelColor: Colors.pink[400],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.pink[400],
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
            ),
            labelStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((item) => HomeBody(name: item)).toList(),
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  _Leading({Key key, @required this.ctx}) : super(key: key);

  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('打开抽屉');
        Scaffold.of(ctx).openDrawer();
      },
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

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
