import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../helper/shared_preferences.dart';
import '../login/LoginPage.dart';
import 'base_repository.dart';

class DioBaseHelper {
  final Dio dio = Dio();
  BaseRepository _baseRepository = BaseRepository.instance;

  Future<Dio> dioWithHeader() async {
    final token = await getAccessToken();
    print(token);
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers["Authorization"] = "Bearer $token";
      print(options.baseUrl + options.path);
      return handler.next(options);
    }, onError: (e, handler) async {
      refreshToken(e, handler, token);
    }));

    dio.options = BaseOptions(
        baseUrl: _baseRepository.baseApiUrl,
        connectTimeout: 7000,
        receiveTimeout: 7000);

    return dio;
  }

  Dio dioNoHeader() {
    dio.interceptors.clear();

    dio.options = BaseOptions(
        baseUrl: _baseRepository.baseApiUrl,
        connectTimeout: 7000,
        receiveTimeout: 3000);

    return dio;
  }

  refreshToken(e, handler, token) async {
    if (e.response == null) {
      return handler.next(e);
    } else if (e.response.statusCode.toString() == "401") {
      saveAccessToken("");
      Application.navigatorKey!.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
        (route) => false,
      );
    } else {
      return handler.next(e);
    }
  }
}

class Application {
  late Router router;
  static GlobalKey<NavigatorState>? navigatorKey;
}
