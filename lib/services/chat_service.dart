import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:plansteria/core/client/dio_client.dart';
import 'package:plansteria/core/client/openai_client.dart';
import 'package:plansteria/core/errors/chat_error.dart';
import 'package:plansteria/models/chat_input.dart';
import 'package:plansteria/models/chat_response.dart';
import 'package:plansteria/models/message.dart';

class ChatService {
  final _openAIClient = OpenAIClient(dioClient());

  Future<Either<ChatError, ChatResponse>> sendMessage(
    List<Message> msgs,
  ) async {
    try {
      final input = ChatInput(model: "gpt-3.5-turbo", messages: msgs);
      final response = await _openAIClient.sendMessage(input);
      return right(response);
    } on PlatformException catch (e) {
      return left(ChatError.error(e.message));
    }
  }
}
