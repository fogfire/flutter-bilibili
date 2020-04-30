import 'package:flutter/material.dart';

class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: , 头像
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[Text('频道'), Text('分区')],
          labelColor: Colors.grey,
          indicatorColor: Colors.pink[300],
        ),
      ),
    );
  }
}