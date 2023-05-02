import 'package:dio/dio.dart';
import 'package:plansteria/models/chat_response.dart';
import 'package:plansteria/models/message.dart';
import 'package:retrofit/retrofit.dart';

part 'openai_client.g.dart';

@RestApi()
abstract class OpenAIClient {
  factory OpenAIClient(Dio dio, {String baseUrl}) = _OpenAIClient;

  @POST("/chat/completions")
  Future<ChatResponse> sendMessage({
    @Field() required String model,
    @Field() required List<Message> messages,
    @Field() String? user,
  });
}
