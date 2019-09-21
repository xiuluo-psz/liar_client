import 'package:dio/dio.dart';
import 'package:liar/constant/api_constants.dart';
import 'package:liar/model/login_model.dart';
import 'package:liar/model/net_result.dart';
import 'package:liar/util/http_util.dart';

class LoginService {
  Future<NetResult> login(String email, String phone, String password) async {
    NetResult result = NetResult.empty();
    Map<String, dynamic> params =
        new LoginModel(email: email, phoneNumber: phone, password: password)
            .toJson();
    await HttpUtil.getInstance()
        .post(ApiConstants.API_LOGIN_LOGIN, params)
        .then((response) {
      result = NetResult.fromJson(response.data);
    }).catchError((onError) {
      result.msg = (onError as DioError).message;
    });
    return result;
  }
}
