import 'package:flutter/material.dart';

class DefaultLoadingRoute extends StatefulWidget {
  static final String routePath = "Loading";
  @override
  _DefaultLoadingRouteState createState() => _DefaultLoadingRouteState();
}

class _DefaultLoadingRouteState extends State<DefaultLoadingRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('default'),
    );
  }
}
