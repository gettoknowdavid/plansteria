import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/core/client/dio_client.dart';
import 'package:plansteria/core/client/openai_client.dart';
import 'package:plansteria/core/env/env.dart';
import 'package:plansteria/core/errors/chat_error.dart';
import 'package:plansteria/models/chat_response.dart';
import 'package:plansteria/models/message.dart';
import 'package:plansteria/ui/common/app_keys.dart';
import 'package:stacked/stacked.dart';

import 'shared_preferences_service.dart';

class ChatService with ListenableServiceMixin {
  ChatService() {
    listenToReactiveValues([_messages, _shouldAnimate]);
    loadChatHistory();
  }

  final _openAIClient = OpenAIClient(dioClient(), baseUrl: Env.openAIBaseUrl);
  final _preferencesService = locator<SharedPreferencesService>();

  final _messages = ReactiveValue<List<Message?>>([]);
  List<Message?> get messages => _messages.value;

  final _shouldAnimate = ReactiveValue<bool>(false);
  bool get shouldAnimate => _shouldAnimate.value;

  Future<Either<ChatError, ChatResponse>> sendMessage(
    Message message, {
    String? user,
  }) async {
    _messages.value.add(message);

    try {
      final response = await _openAIClient.sendMessage(
        model: "gpt-3.5-turbo",
        messages: [message],
        user: user,
      );

      final choices = response.choices!;
      _messages.value.add(choices[0].message?.copyWith(index: 1));

      _saveChatHistory();
      _shouldAnimate.value = true;
      
      return right(response);
    } on PlatformException catch (e) {
      return left(ChatError.error(e.message));
    }
  }

  Future<void> loadChatHistory() async {
    _shouldAnimate.value = false;
    if (_preferencesService.hasKey(kChatHistoryKey)) {
      List<String> strgs = _preferencesService.readList(kChatHistoryKey);
      final list = strgs.map((e) => Message.fromJson(jsonDecode(e))).toList();
      _messages.value = list;
    }
  }

  Future<void> _saveChatHistory() async {
    final strgs = _messages.value.map((e) => jsonEncode(e!.toJson())).toList();
    await _preferencesService.writeList(key: kChatHistoryKey, value: strgs);
  }
}
