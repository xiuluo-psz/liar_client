import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:liar/config/global_state.dart';
import 'package:liar/constant/sp_constants.dart';
import 'package:liar/model/user.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.toString()),
          Text(user.toJson().toString()),
          Text(SpUtil.getString(SpConstants.USER_ID)),
          Text(SpUtil.getString(SpConstants.TOKEN)),
          Text(SpUtil.getInt(SpConstants.ACCESS_TIME).toString()),
          RaisedButton(
            child: Text('clear'),
            onPressed: (){
              SpUtil.clear();
            },
          ),
        ],
      ),
    );
  }
}
