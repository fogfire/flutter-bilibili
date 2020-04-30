import 'package:flutter/material.dart';
import 'dart:async';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => LaunchPage(),
        "home": (context) => HomePage(arg: ModalRoute.of(context).settings.arguments),
      },
    );
  }
}

class LaunchPage extends StatefulWidget {
  LaunchPage({Key key}) : super(key: key);
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      print('打开首页');
      Navigator.of(context).pushNamed("home", arguments: "index");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('构建启动页');
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(child: Image.asset('images/launch.png', fit: BoxFit.fitHeight)),
        ],
      ),
    );
  }
}
