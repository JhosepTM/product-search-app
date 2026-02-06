// dio_config.dart
import 'package:dio/dio.dart';
import 'package:frontend/core/network/network_guard_interceptor.dart';

class DioConfig {
  final String _baseUrl;
  late final Dio dio;

  DioConfig({required String baseUrl}) : _baseUrl = baseUrl {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    //registro global
    dio.interceptors.add(const NetworkGuardInterceptor());

    // Logging local
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: false,
    ));
  }
}
