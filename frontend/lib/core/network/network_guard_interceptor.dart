// core/network_guard_interceptor.dart
import 'dart:io' show SocketException, HandshakeException;
import 'package:dio/dio.dart';
import 'package:frontend/core/errors/exeptions.dart';

/// An opinionated Dio interceptor that normalizes low-level connectivity
/// failures into domain exceptions, enabling consistent upstream handling.
///
/// ### What it does
/// - Maps connection-layer errors (no internet, DNS issues, TLS handshake) to
///   [NetworkUnavailableException].
/// - Maps request timeouts (connect/send/receive) to [NetworkTimeoutException],
///   preserving the phase and configured timeout value when available.
/// - For non-network errors, it passes the error through unchanged.
///
/// ### Why
/// Dio surfaces a variety of error shapes depending on platform and failure
/// mode. Converting those into stable domain exceptions simplifies retry,
/// offline queuing, and UI messaging across the app.
class NetworkGuardInterceptor extends Interceptor {
  const NetworkGuardInterceptor();

  /// Intercepts [DioException]s and rewrites them into domain-specific
  /// connectivity exceptions when appropriate.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final Object? underlying = err.error;

    // Connectivity: unreachable network, DNS failure, TLS handshake, etc.
    final bool isConnErr =
        err.type == DioExceptionType.connectionError ||
        underlying is SocketException ||
        underlying is HandshakeException;

    if (isConnErr) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: NetworkUnavailableException(cause: underlying ?? err),
          stackTrace: err.stackTrace,
        ),
      );
    }

    // Timeouts: connect / send / receive.
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      final String? phase = switch (err.type) {
        DioExceptionType.connectionTimeout => 'connect',
        DioExceptionType.sendTimeout => 'send',
        DioExceptionType.receiveTimeout => 'receive',
        _ => null,
      };

      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: NetworkTimeoutException(
            phase: phase,
            // Populates with BaseOptions timeouts when available.
            timeout: _extractTimeout(err, phase),
          ),
          stackTrace: err.stackTrace,
        ),
      );
    }

    // Non-network errors: forward unchanged.
    handler.next(err);
  }

  /// Extracts the configured timeout value for the given [phase], if present on
  /// the originating [RequestOptions]. Returns `null` when unavailable.
  Duration? _extractTimeout(DioException e, String? phase) {
    final RequestOptions o = e.requestOptions;
    return switch (phase) {
      'connect' => o.connectTimeout,
      'send' => o.sendTimeout,
      'receive' => o.receiveTimeout,
      _ => null,
    };
  }
}

/// Convenience extensions to quickly probe for normalized network failures.
extension DioExceptionX on DioException {
  /// `true` if the error has been normalized to [NetworkUnavailableException].
  bool get isNetworkUnavailable => error is NetworkUnavailableException;

  /// `true` if the error has been normalized to [NetworkTimeoutException].
  bool get isNetworkTimeout => error is NetworkTimeoutException;
}
