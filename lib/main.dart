import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:liar/config/global_state.dart';
import 'package:liar/generated/i18n.dart';
import 'package:liar/model/login.dart';
import 'package:liar/model/user.dart';
import 'package:liar/model/usual.dart';
import 'package:liar/service/login_service.dart';
import 'package:redux/redux.dart';

void main() {
  runZoned(() {
    runApp(MyApp());
  }, onError: (Object obj, StackTrace stack) {
    print(obj.toString());
    print(stack.toString());
  });
}

class MyApp extends StatelessWidget {
  final store = Store<GlobalState>(
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
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
  }

  @override
  void initState() {
    _counter = 0;
    LoginService()
        .login("admin@admin.com", "13344445555", "123456")
        .then((result) {
      if (result.code == "200") {
        Login login = Login.fromJson(result.data);
        print(login.token);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Image.asset(
              "assets/images/splash.jpg",
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
