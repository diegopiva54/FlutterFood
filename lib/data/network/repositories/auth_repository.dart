import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info/device_info.dart';

import '../../../constants/api.dart';
import '../dio_client.dart';
import '../../../models/User.dart';
import '../interceptors/dio_interceptor_auth.dart';
import '../exceptions/api_exception.dart';

class AuthRepository {
  Dio _dio = dioInterceptorAuth();
  FlutterSecureStorage storage = new FlutterSecureStorage();

  Future auth(String email, String password) async {
    try {
      String deviceName = await getIdentifyDevice();

      final response = await _dio.post('auth/token', data: {
        'email': email,
        'password': password,
        'device_name': deviceName,
      });

      print(response.data['token']);

      saveToken(response.data['token']);

      return response;
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
    }
  }

  Future register(String name, String email, String password) async {
    try {
      final response = await _dio.post('auth/register', data: {
        'name': name,
        'email': email,
        'password': password,
      });

      print(response.data);

      return response;
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
    }
  }

  Future<User> getMe() async {
    final String token = await storage.read(key: API_TOKEN);

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ' + token;
    }

    try {
      final response = await _dio.get('auth/me');

      print(response.data);

      return User.fromJson(response.data['data']);
    } on DioError catch (e) {
      //CORRIGIR AQUI
      return Future.error({});
    }
    // } on DioError catch (e) {
    //   Future.error({});

    //   ApiException(e.response);
    // }
  }

  Future saveToken(String token) async {
    await storage.write(key: API_TOKEN, value: token);
    print('gravada');
  }

  Future removeToken() async {
    await storage.delete(key: API_TOKEN);
  }

  Future logout() async {
    await DioClient().post('auth/logout');

    removeToken();
  }

  Future<String> getIdentifyDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }
  }
}
