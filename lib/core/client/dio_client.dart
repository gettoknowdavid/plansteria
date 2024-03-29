import 'package:dio/dio.dart';
import 'package:plansteria/core/env/env.dart';

import 'token_interceptor.dart';

Dio dioClient() {
  final dio = Dio()..options = BaseOptions(baseUrl: Env.openAIBaseUrl);

  dio.interceptors.addAll([
    TokenInterceptor(),
    LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ),
  ]);

  return dio;
}

Dio googleMapDioClient() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: 'https://maps.googleapis.com/maps/api',
      queryParameters: {'key': Env.googleMapApiKey},
    );

  dio.interceptors.addAll([
    LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ),
  ]);

  return dio;
}
