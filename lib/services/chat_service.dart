import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:plansteria/core/client/dio_client.dart';
import 'package:plansteria/core/client/openai_client.dart';
import 'package:plansteria/core/errors/chat_error.dart';
import 'package:plansteria/models/chat_response.dart';
import 'package:stacked/stacked.dart';

class ChatService with ListenableServiceMixin {
  ChatService() {
    listenToReactiveValues([]);
  }

  final _openAIClient = OpenAIClient(dioClient());

  Future<Either<ChatError, ChatResponse>> sendMessage(String msg) async {
    try {
      final response = await _openAIClient.sendMessage(msg: msg);
    } on PlatformException catch (e) {
      return left(ChatError.error(e.message));
    }
  }
}
