class Failure implements Exception {
  final _message;
  final _prefix;

  Failure([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message:$_prefix';
  }
}
