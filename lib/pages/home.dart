import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key key, @required this.arg }) : super(key: key);

  final String arg;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.arg),
      ),
    );
  }
}