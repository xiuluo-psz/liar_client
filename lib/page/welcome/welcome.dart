import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:liar/generated/i18n.dart';

class WelcomeRoute extends StatefulWidget {
  final void Function() jumpCallback;

  WelcomeRoute({this.jumpCallback});

  @override
  _WelcomeRouteState createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  int _second = 5;
  TimerUtil _timer;

  @override
  void initState() {
    LogUtil.v(widget.toString());
    _timer = new TimerUtil(mTotalTime: _second * 1000);
    _timer.setOnTimerTickCallback((int millisUntilFinished) {
      double _tick = millisUntilFinished / 1000;
      setState(() {
        _second = _tick.toInt();
      });
      if (_tick == 0) {
        widget.jumpCallback();
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
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: ScreenUtil.getStatusBarH(context),
            right: 0.0,
            child: MaterialButton(
              color: Color(0x009E9E9E),
              child: Text(
                '$_second${S.of(context).jump_to_main}',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                _timer.cancel();
                widget.jumpCallback();
              },
            ),
          ),
        ],
      ),
    );
  }
}
