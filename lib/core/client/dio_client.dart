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
