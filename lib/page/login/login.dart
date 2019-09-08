import 'package:liar/config/config.dart';
import 'package:liar/model/user.dart';
import 'package:liar/util/http_util.dart';
import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget {
  static final String pathName = "/";

  @override
  _LoginRouteState createState() => new _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "手机号或邮箱",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            var name = _nameController.text;
                            var pwd = _pwdController.text;
                            User userInfo = User(userName: name, password: pwd);
                            var jsonData = userInfo.toJson();
//                            HttpUtil().post(Config.BASE_URL, jsonData).then((response) {
//                              User a = User.fromJson(response);
//                              print("=============");
//                              print("=============");
//                            }).catchError((e){
//                              print('+++++++++++++++++++++++++');
//                              print(e);
//                              print('+++++++++++++++++++++++++');
//                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
