class NetworkUnavailableException implements Exception {
  final Object? cause;
  final String? message;
  const NetworkUnavailableException({this.cause, this.message});

  @override
  String toString() => 'NetworkUnavailableException(${message ?? cause})';
}

class NetworkTimeoutException implements Exception {
  final Duration? timeout;
  final String? phase; // "connect", "send", "receive"
  const NetworkTimeoutException({this.timeout, this.phase});

  @override
  String toString() => 'NetworkTimeoutException(phase=$phase, timeout=$timeout)';
}
