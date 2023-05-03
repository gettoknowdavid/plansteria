import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/core/client/dio_client.dart';
import 'package:plansteria/core/client/openai_client.dart';
import 'package:plansteria/core/env/env.dart';
import 'package:plansteria/core/errors/chat_error.dart';
import 'package:plansteria/models/chat.dart';
import 'package:plansteria/models/chat_response.dart';
import 'package:plansteria/models/message.dart';
import 'package:plansteria/ui/common/app_keys.dart';
import 'package:stacked/stacked.dart';

import 'shared_preferences_service.dart';

class ChatService with ListenableServiceMixin {
  ChatService() {
    listenToReactiveValues([_chat]);
    loadChatHistory();
  }

  final _openAIClient = OpenAIClient(dioClient(), baseUrl: Env.openAIBaseUrl);
  final _preferencesService = locator<SharedPreferencesService>();

  final _chat = ReactiveValue<List<Chat?>>([]);
  List<Chat?> get chat => _chat.value;

  Future<void> clearChatHistory() async {
    await _preferencesService.delete(kChatHistoryKey);
    _chat.value.clear();
    notifyListeners();
  }

  Future<Either<ChatError, ChatResponse>> sendMessage(
    Message message, {
    String? user,
  }) async {
    final chat = Chat.fromRemote(message);
    _chat.value.add(chat);
    try {
      final response = await _openAIClient.sendMessage(
        model: "gpt-3.5-turbo",
        messages: [message],
        user: user,
      );
      final choices = response.choices!;
      _chat.value.add(Chat.fromRemote(choices[0].message!));
      _saveChatHistory();
      notifyListeners();
      return right(response);
    } on PlatformException catch (e) {
      return left(ChatError.error(e.message));
    }
  }

  Future<void> loadChatHistory() async {
    if (_preferencesService.hasKey(kChatHistoryKey)) {
      List<String> strings = _preferencesService.readList(kChatHistoryKey);
      final list = strings.map((e) => Chat.fromJson(jsonDecode(e))).toList();
      final newList = list.map((e) => e.copyWith(hasAnimated: true)).toList();
      newList.sort((a, b) => a.created.compareTo(b.created));
      _chat.value = newList;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> _saveChatHistory() async {
    final updatedMsgs =
        _chat.value.map((e) => e?.copyWith(hasAnimated: true)).toList();
    final strings = updatedMsgs.map((e) => jsonEncode(e!.toJson())).toList();
    await _preferencesService.writeList(key: kChatHistoryKey, value: strings);
    notifyListeners();
  }
}
