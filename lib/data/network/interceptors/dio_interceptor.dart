import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../constants/api.dart';

FlutterSecureStorage storage = new FlutterSecureStorage();
Dio dio = new Dio();

Dio dioInterceptor() {
  ///set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT;
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  print('entrou 2');

  dio.options.headers['Accept'] = 'application/json';

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final String token = await storage.read(key: API_TOKEN);

      print('entrou 3');
      print(token);

      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer ' + token;
      }

      return handler.next(options);
    },
  ));

  return dio;
}
