import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:liar/generated/i18n.dart';

class LoginRoute extends StatefulWidget {
  static final String routePath = "Login";

  LoginRoute({Key key}) : super(key: key);

  @override
  _LoginRouteState createState() {
    LogUtil.e(this.toString());
    return _LoginRouteState();
  }
}

class _LoginRouteState extends State<LoginRoute> {
  GlobalKey _formKey = new GlobalKey<FormState>();

  TextEditingController _keyController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _keyController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    S i18n = S.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(top: ScreenUtil.getScreenH(context) / 6),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "assets/images/liar.jpg",
                    height: 120.0,
                    width: 120.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                ),
                TextFormField(
                  controller: _keyController,
                  decoration: InputDecoration(
                    labelText: i18n.email_phone,
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    return value.trim().length > 0 ? null : i18n.required;
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    labelText: i18n.password,
                    icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    return value.trim().length > 5 ? null : i18n.pwd_len;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        i18n.register,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        //TODO register
                        print('---------');
                      },
                    ),
                    InkWell(
                      child: Text(
                        i18n.forgot_pwd,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        //TODO forget pwd
                        print('---------');
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      i18n.login,
                      style: TextStyle(fontSize: 18),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        //TODO login
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
