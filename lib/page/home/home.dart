import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:liar/config/config.dart';
import 'package:liar/config/global_state.dart';
import 'package:liar/constant/api_constants.dart';
import 'package:liar/constant/sp_constants.dart';
import 'package:liar/model/net_result.dart';
import 'package:liar/model/user.dart';
import 'package:liar/util/http_util.dart';
import 'package:redux/redux.dart';

class HomeRoute extends StatefulWidget {
  static final String routePath = "Home";

  HomeRoute({Key key}) : super(key: key);

  @override
  _HomeRouteState createState() {
    LogUtil.v(this.toString());
    return _HomeRouteState();
  }
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    Store<GlobalState> store = StoreProvider.of(context);
    User user = store.state.user;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text('widget name: ${widget.toString()}'),
          Text('userinfo: ${user.toJson().toString()}'),
          Text('userId: ${SpUtil.getString(SpConstants.USER_ID)}'),
          Text('token: ${SpUtil.getString(SpConstants.TOKEN)}'),
          Text('accessTime: ${SpUtil.getInt(SpConstants.ACCESS_TIME).toString()}'),
          RaisedButton(
            child: Text('clear'),
            onPressed: SpUtil.clear,
          ),
          RaisedButton(
            child: Text('token'),
            onPressed: () {
              HttpUtil.getInstance().post(ApiConstants.API_LOGIN_LOGDEL, {
                "userId": SpUtil.getString(SpConstants.USER_ID, defValue: null)
              }).then((response) {
                print('==============================================');
                var result = NetResult.fromJson(response.data);
                print(result.toJson());
                print('==============================================');
              });
            },
          ),
          FadeInImage.assetNetwork(
            placeholder: "assets/images/welcome.png",
            image: Config.BASE_URL + "static/images/timg.gif",
            height: 200,
            width: 200,
            fit: BoxFit.fill,
            fadeInDuration: Duration(seconds: 2),
          )
        ],
      ),
    );
  }
}
