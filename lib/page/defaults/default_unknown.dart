import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class DefaultUnknown extends StatelessWidget {
  static final String routePath = "/";

  @override
  Widget build(BuildContext context) {
    LogUtil.v(this.toString());
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('unknown'),
        ),
      ),
    );
  }
}
