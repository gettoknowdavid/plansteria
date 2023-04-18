import 'package:dio/dio.dart';
import 'package:plansteria/models/chat_response.dart';
import 'package:retrofit/retrofit.dart';

part 'openai_client.g.dart';

@RestApi()
abstract class OpenAIClient {
  factory OpenAIClient(Dio dio, {String baseUrl}) = _OpenAIClient;

  @POST("/chat/completions")
  Future<ChatResponse> sendMessage({required String msg});
}
