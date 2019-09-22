import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:liar/constant/sp_constants.dart';
import 'package:liar/constant/static_constants.dart';
import 'package:liar/generated/i18n.dart';
import 'package:liar/page/home/home.dart';
import 'package:liar/page/login/login.dart';
import 'package:liar/util/route_animation_util.dart';

class WelcomeRoute extends StatefulWidget {
  static final String routePath = "Welcome";

  WelcomeRoute({Key key}) : super(key: key);

  @override
  _WelcomeRouteState createState() {
    LogUtil.v(this.toString());
    return _WelcomeRouteState();
  }
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  int _second = 5;
  TimerUtil _timer;

  void _skip() {
    int phase = SpUtil.getInt(SpConstants.ACCESS_TIME, defValue: 0) -
        DateTime.now().millisecondsSinceEpoch;
    if (phase > 0) {
      Navigator.of(context).pushReplacement(
          RouteAnimationUtil.slide(HomeRoute(), Duration(milliseconds: 2000)));
    } else {
      Navigator.of(context).pushReplacement(
          RouteAnimationUtil.fade(LoginRoute(), Duration(milliseconds: 2000)));
    }
  }

  @override
  void initState() {
    _timer = new TimerUtil(mTotalTime: _second * 1000);
    _timer.setOnTimerTickCallback((int millisUntilFinished) {
      double _tick = millisUntilFinished / 1000;
      setState(() {
        _second = _tick.toInt();
      });
      if (_tick == 0) {
        _skip();
      }
    });
    _timer.startCountDown();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer.isActive()) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "assets/images/welcome.png",
            image: StaticConstants.IMG_WELCOME,
            fit: BoxFit.fill,
            height: ScreenUtil.getScreenH(context),
            width: ScreenUtil.getScreenW(context),
            fadeOutDuration: Duration(milliseconds: 500),
            fadeOutCurve: Curves.elasticIn,
            fadeInDuration: Duration(milliseconds: 500),
            fadeInCurve: Curves.elasticOut,
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
                _skip();
              },
            ),
          ),
        ],
      ),
    );
  }
}
