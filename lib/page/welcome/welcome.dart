import 'package:flutter/material.dart';

class WelcomeRoute extends StatefulWidget {
  final void Function() jump;
  WelcomeRoute({this.jump});

  @override
  _WelcomeRouteState createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      widget.jump();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/AngelsAndDemons.jpg",
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
