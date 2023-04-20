import 'package:dio/dio.dart';
import 'package:plansteria/core/env/env.dart';

Dio dioClient() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: Env.openAIApiKey,
      queryParameters: {'token': Env.openAIApiKey},
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
