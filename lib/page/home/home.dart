import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  static final String routePath = "home";
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.toString()),
    );
  }
}
