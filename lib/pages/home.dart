import 'package:flutter/material.dart';
import '../api/videoApi.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabs: _tabs.map((v) => Text(v)).toList(),
        labelPadding: EdgeInsets.fromLTRB(12, 3, 12, 3),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((item) => _ContentList(channel: item)).toList(),
      ),
    );
  }
}

class _ContentList extends StatefulWidget {
  _ContentList({ Key key, @required this.channel }) : super(key: key);

  final String channel;

  @override
  __ContentListState createState() => __ContentListState();
}

class __ContentListState extends State<_ContentList> {
  List<Object> _list;

  @override
  void initState() {
    super.initState();
    switch(widget.channel) {
      case '推荐':
        getRec() ;
        break;
      default: break;
    }
  }

  void getRec() async {
    final res = await VideoApi.getHomeList();
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.channel),
    );
  }
}