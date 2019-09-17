import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:liar/generated/i18n.dart';

class WelcomeRoute extends StatefulWidget {
  static final String routePath = "/";

  final void Function() skipCallback;

  WelcomeRoute({Key key, this.skipCallback}) : super(key: key);

  @override
  _WelcomeRouteState createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  int _second = 5;
  TimerUtil _timer;

  @override
  void initState() {
    _timer = new TimerUtil(mTotalTime: _second * 1000);
    _timer.setOnTimerTickCallback((int millisUntilFinished) {
      double _tick = millisUntilFinished / 1000;
      setState(() {
        _second = _tick.toInt();
      });
      if (_tick == 0) {
        widget.skipCallback();
      }
    });
    _timer.startCountDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/AngelsAndDemons.jpg",
            fit: BoxFit.fill,
            height: ScreenUtil.getScreenH(context),
            width: ScreenUtil.getScreenW(context),
          ),
          Positioned(
            top: ScreenUtil.getStatusBarH(context),
            right: 0.0,
            child: MaterialButton(
              color: Color(0x009E9E9E),
              child: Text(
                '${S.of(context).skip_to_main} $_second',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[300],
                ),
              ),
              onPressed: () {
                _timer.cancel();
                widget.skipCallback();
              },
            ),
          ),
        ],
      ),
    );
  }
}
