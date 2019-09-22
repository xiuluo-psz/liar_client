import 'package:dio/dio.dart';
import 'package:liar/config/config.dart';
import 'package:liar/constant/constants.dart';
import 'package:liar/http/default_interceptor.dart';
import 'package:liar/http/token_interceptor.dart';

class HttpUtil {
  Dio _client;
  static final HttpUtil _instance = HttpUtil._internel();

  factory HttpUtil() => _instance;

  static HttpUtil getInstance() {
    return _instance;
  }

  bool _isDebug = Constants.IS_DEBUG;

  HttpUtil._internel() {
    if (null == _client) {
      BaseOptions options = new BaseOptions();
      options.baseUrl = Config.BASE_URL;
      options.maxRedirects = Config.MAX_REDIRECTS;
      options.connectTimeout = Config.CONNECT_TIMEOUT;
      _client = new Dio(options);
      _client.interceptors.add(DefaultInterceptor(_isDebug));
      _client.interceptors.add(TokenInterceptor());
      _client.interceptors.add(LogInterceptor(
        requestBody: _isDebug,
        responseBody: _isDebug,
      ));
    }
  }

  HttpUtil addInterceptor(Interceptor interceptor) {
    _client.interceptors.add(interceptor);
    return _instance;
  }

  Interceptor removeLastInterceptor() {
    return _client.interceptors.removeLast();
  }

  bool removeInterceptor(Interceptor interceptor) {
    return _client.interceptors.remove(interceptor);
  }

  void clearInterceptor() {
    _client.interceptors.clear();
  }

  void lock() {
    _client.lock();
  }

  void unlock() {
    _client.unlock();
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    if (null != params) {
      response = await _client.get(path, queryParameters: params);
    } else {
      response = await _client.get(path);
    }
    return response;
  }

  Future<Response<Map<String, dynamic>>> post(
      String path, Map<String, dynamic> data) async {
    Response<Map<String, dynamic>> response;
    if (null != data) {
      response = await _client.post(path, data: data);
    } else {
      response = await _client.post(path);
    }
    return response;
  }
}
