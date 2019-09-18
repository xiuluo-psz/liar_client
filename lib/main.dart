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
import 'package:liar/page/home/home.dart';
import 'package:liar/page/login/login.dart';
import 'package:liar/page/welcome/welcome.dart';
import 'package:redux/redux.dart';

void main() {
  runZoned(() {
    SpUtil.getInstance();
    LogUtil.init(isDebug: Constants.IS_DEBUG, tag: Constants.LOG_TAG);
    runApp(LiarApp());
  }, onError: (Object obj, StackTrace stack) {
    print(obj.toString());
    print(stack.toString());
  });
}

class LiarApp extends StatelessWidget {
  final Store<GlobalState> store = new Store<GlobalState>(
    appReducer,
    initialState: GlobalState(
      user: User.empty(),
      usual: Usual(isAd: true),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreBuilder<GlobalState>(
        builder: (BuildContext context, Store<GlobalState> store) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              S.delegate,
            ],
            onGenerateTitle: (context) => S.of(context).app_title,
            supportedLocales: [
              const Locale('en', ''),
              const Locale('zh', 'CN'),
            ],
            routes: {
              LoginRoute.routePath: (context) => LoginRoute(),
              HomeRoute.routePath: (context) => HomeRoute(),
              WelcomeRoute.routePath: (context) => WelcomeRoute(
                    skipCallback: () {
                      if (store.state.user.userId == null) {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginRoute.routePath);
                      } else {
                        Navigator.of(context)
                            .pushReplacementNamed(HomeRoute.routePath);
                      }
                    },
                  ),
            },
          );
        },
      ),
    );
  }
}
