import 'package:dio/dio.dart';

enum TypeRequests { get, post, put, patch, delete }

class HttpClientHelper {
  HttpClientHelper(this._dio);
  final Dio _dio;

  Future<Response<dynamic>> requestHelper({
    required String endpoint,
    required TypeRequests typeOfRequests,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final options = Options(followRedirects: false);

    switch (typeOfRequests) {
      case TypeRequests.get:
        return _dio.get(endpoint, data: data, options: options, queryParameters: queryParameters);
      case TypeRequests.post:
        return _dio.post(endpoint, data: data, options: options, queryParameters: queryParameters);
      case TypeRequests.put:
        return _dio.put(endpoint, data: data, options: options, queryParameters: queryParameters);
      case TypeRequests.patch:
        return _dio.patch(endpoint, data: data, options: options, queryParameters: queryParameters);
      case TypeRequests.delete:
        return _dio.delete(endpoint, data: data, options: options, queryParameters: queryParameters);
    }
  }
}
