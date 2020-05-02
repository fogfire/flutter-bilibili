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
    return Container(
      child: TabBar(
        controller: _tabController,
        tabs: <Widget>[Text('频道'), Text('分区')],
      ),
    );
  }
}