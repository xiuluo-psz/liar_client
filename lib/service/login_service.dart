import 'package:liar/constant/constants.dart';
import 'package:liar/util/http_util.dart';

class LoginService {
  Future<String> login(String userName, String password) async {
    String data;
    var params = {
      "userName": userName,
      "password": password,
    };
    await HttpUtil.getInstance()
        .post(Constants.API_LOG_IN, params)
        .then((response) {
      data = response.data["data"];
    }).catchError((onError) {});
    return data;
  }
}
