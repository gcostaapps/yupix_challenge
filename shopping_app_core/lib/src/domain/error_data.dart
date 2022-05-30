class ErrorData {
  final dynamic message;
  final dynamic error;
  final StackTrace? stackTrace;
  ErrorData(
    this.message, [
    this.error,
    this.stackTrace,
  ]);
}
