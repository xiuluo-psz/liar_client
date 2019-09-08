class StringUtil {
  static bool isNullOrEmpty(String str) {
    if (str == null || str.trim().length == 0) {
      return true;
    }
    return false;
  }

  static bool nonNullOrEmpty(String str) {
    return !isNullOrEmpty(str);
  }
}
