class Constants {
  static const String LOG_TAG = "#LiarLog#";
  static const bool IS_DEBUG = !bool.fromEnvironment("dart.vm.product");
  static const String SUCCESS_CODE = "200";
  static const int ONE_DAY = 1 * 24 * 60 * 60 * 1000;
}
