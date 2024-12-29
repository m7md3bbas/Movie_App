import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://yts.mx/api/v2/',
          // connectTimeout: const Duration(seconds: 10),
          // receiveTimeout: const Duration(seconds: 10),
          receiveDataWhenStatusError: true,
          headers: {
            'Accept': 'application/json',
          },
        )) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.data}');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print('Error: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
