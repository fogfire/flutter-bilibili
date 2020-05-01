import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key key, @required this.name}) : super(key: key);

  final String name;

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.name),
      ),
    );
  }
}