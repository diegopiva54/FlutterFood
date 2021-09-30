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
      final String token = await storage.read(key: 'token_sanctum');

      print('entrou 3');
      print(token);

      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer ' + token;
      }

      return handler.next(options);
    },
  ));

//   dio.interceptors.add(InterceptorsWrapper(
//     onRequest:(options, handler){
//      // Do something before request is sent
//      return handler.next(options); //continue
//      // If you want to resolve the request with some custom data，
//      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
//      // If you want to reject the request with a error message,
//      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
//     },
//     onResponse:(response,handler) {
//      // Do something with response data
//      return handler.next(response); // continue
//      // If you want to reject the request with a error message,
//      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
//     },
//     onError: (DioError e, handler) {
//      // Do something with response error
//      return  handler.next(e);//continue
//      // If you want to resolve the request with some custom data，
//      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
//     }
// ));

  return dio;
}
