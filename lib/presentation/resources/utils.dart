class Utils {
  static List<String> errorCatching(Object? error) {
    String errorText = error.toString();
    List<String> splittedList = List.filled(2, '');
    splittedList = errorText.split(':');
    splittedList.last = errorText;

    return splittedList;
  }
}
