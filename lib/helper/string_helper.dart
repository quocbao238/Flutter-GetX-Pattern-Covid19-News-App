class StringHelper {
  static int convertStringValueToInt(String value) {
    try {
      if (value?.isEmpty ?? true) return 0;
      int result = int.parse(value.replaceAll(".", ""));
      print("convertStringValueToInt: $result");
      return result;
    } catch (e) {
      return 0;
    }
  }
}
