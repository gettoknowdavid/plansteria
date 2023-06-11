import 'package:dio/dio.dart';
import 'package:plansteria/models/chat_response.dart';
import 'package:plansteria/models/message.dart';
import 'package:retrofit/retrofit.dart';

part 'openai_client.g.dart';

/// Retrofit REST API client for OpenAI service.
@RestApi()
abstract class OpenAIClient {
  /// Creates an instance of [OpenAIClient].
  factory OpenAIClient(Dio dio, {String baseUrl}) = _OpenAIClient;

  /// Sends a message to the OpenAI chat endpoint.
  ///
  /// This method sends a message to the OpenAI chat/completions API endpoint
  /// and returns a [ChatResponse] object containing the server response.
  ///
  /// Returns a [Future] that resolves to a [ChatResponse] object representing
  /// the server response.
  @POST("/chat/completions")
  Future<ChatResponse> sendMessage({
    @Field() required String model,
    @Field() required List<Message> messages,
    @Field() String? user,
  });
}
