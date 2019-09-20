import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:liar/config/global_state.dart';
import 'package:liar/constant/constants.dart';
import 'package:liar/generated/i18n.dart';
import 'package:liar/model/user.dart';
import 'package:liar/model/usual.dart';
import 'package:liar/page/welcome/welcome.dart';
import 'package:redux/redux.dart';

void main() {
  runZoned(() async {
    await SpUtil.getInstance();
    LogUtil.init(isDebug: Constants.IS_DEBUG, tag: Constants.LOG_TAG);
    runApp(LiarApp());
  }, onError: (Object obj, StackTrace stack) {
    print(obj.toString());
    print(stack.toString());
  });
}

class LiarApp extends StatelessWidget {
  LiarApp({Key key}) : super(key: key);

  final Store<GlobalState> store = new Store<GlobalState>(
    appReducer,
    initialState: GlobalState(
      user: User.empty(),
      usual: Usual(isAd: true),
    ),
  );

  @override
  Widget build(BuildContext context) {
    LogUtil.e(this.toString());
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => S.of(context).app_title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('zh', 'CN'),
        ],
        initialRoute: WelcomeRoute.routePath,
        routes: {
          WelcomeRoute.routePath: (context) => WelcomeRoute(),
        },
      ),
    );
  }
}
