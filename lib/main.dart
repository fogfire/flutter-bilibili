import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(251, 114, 153, 1),
        primaryColorBrightness: Brightness.dark,
        dividerColor: Colors.white,
        indicatorColor: Color.fromRGBO(251, 114, 153, 1),
        tabBarTheme: TabBarTheme(
          labelColor: Color.fromRGBO(251, 114, 153, 1),
          unselectedLabelColor: Color.fromRGBO(80, 80, 80, 1),
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => LaunchPage(),
        "home": (context) =>
            Index(),
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
      child: Container(
        color: Color.fromRGBO(246, 246, 246, 1),
        child: ConstrainedBox(
          child: Image.asset('images/launch.png'),
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }
}
