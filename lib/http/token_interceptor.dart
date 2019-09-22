import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:liar/config/config.dart';
import 'package:liar/constant/api_constants.dart';
import 'package:liar/constant/constants.dart';
import 'package:liar/constant/sp_constants.dart';
import 'package:liar/model/login_model.dart';
import 'package:liar/model/net_result.dart';
import 'package:liar/util/http_util.dart';

class TokenInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    //没有 token 时
    int accessTime = SpUtil.getInt(SpConstants.ACCESS_TIME, defValue: 0);
    if (accessTime == 0) {
      return options;
    }

    //在更换token时间内，1天以内
    int phase = accessTime - DateTime.now().millisecondsSinceEpoch;
    if (phase > 0 && phase < Constants.ONE_DAY) {
      HttpUtil.getInstance().lock();

      BaseOptions options = new BaseOptions();
      options.baseUrl = Config.BASE_URL;
      options.maxRedirects = Config.MAX_REDIRECTS;
      options.connectTimeout = Config.CONNECT_TIMEOUT;

      Dio _dio = Dio(options);
      _dio.options.headers["Authorization"] =
          SpUtil.getString(SpConstants.TOKEN, defValue: null);

      LoginModel login = LoginModel(
          userId: SpUtil.getString(SpConstants.USER_ID, defValue: null));
      await _dio
          .post(ApiConstants.API_TOKEN_REFRESH, data: login.toJson())
          .then((response) {
        NetResult result = NetResult.fromJson(response.data);
        if (result.code == Constants.SUCCESS_CODE) {
          String token = result.data["token"];
          int accessTime = result.data["accessTime"];
          SpUtil.putString(SpConstants.TOKEN, token);
          SpUtil.putInt(SpConstants.ACCESS_TIME, accessTime);
        }
      }).whenComplete(() => HttpUtil.getInstance().unlock());
    }

    return options;
  }

  @override
  onResponse(Response response) {
    return response;
  }
}
