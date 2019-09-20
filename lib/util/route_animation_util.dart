import 'package:flutter/material.dart';

class RouteAnimationUtil {
  static PageRouteBuilder slide(Widget widget, Duration duration) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2, Widget child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(
            CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn),
          ),
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder rotation(Widget widget, Duration duration) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2, Widget child) {
        return RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn,
          )),
          child: ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn,
            )),
            child: child,
          ),
        );
      },
    );
  }

  static PageRouteBuilder fade(Widget widget, Duration duration) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2, Widget child) {
        return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn,
          )),
          child: child,
        );
      },
    );
  }
}
