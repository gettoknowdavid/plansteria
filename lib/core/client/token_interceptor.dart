// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:logger/logger.dart';
import 'package:plansteria/core/env/env.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    Logger().w(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = Env.openAIApiKey;
    options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    Logger().i(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }
}
