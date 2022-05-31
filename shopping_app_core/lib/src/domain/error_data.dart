class ErrorData {
  final dynamic message;
  final dynamic error;
  final StackTrace? stackTrace;
  ErrorData(
    this.message, [
    this.error,
    this.stackTrace,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorData &&
        other.message == message &&
        other.error == error &&
        other.stackTrace == stackTrace;
  }

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ stackTrace.hashCode;
}
