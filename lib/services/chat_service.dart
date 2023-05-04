import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
    listenToReactiveValues([_chats, _chatGroups]);
    loadChatHistory();
  }

  final _openAIClient = OpenAIClient(dioClient(), baseUrl: Env.openAIBaseUrl);
  final _preferencesService = locator<SharedPreferencesService>();

  final _chats = ReactiveValue<List<Chat?>>([]);
  List<Chat?> get chats => _chats.value;

  final _chatGroups = ReactiveValue<Map<String, List<Chat?>>>({});
  Map<String, List<Chat?>> get chatGroups => _chatGroups.value;

  Future<void> clearChatHistory() async {
    await _preferencesService.delete(kChatHistoryKey);
    _chats.value.clear();
    _chatGroups.value.clear();
    notifyListeners();
  }

  void addChat(Chat c) {
    _chats.value.add(c);
    groupByDate();
    notifyListeners();
  }

  Future<Either<ChatError, ChatResponse>> sendMessage(Message message) async {
    try {
      final response = await _openAIClient.sendMessage(
        model: "gpt-3.5-turbo",
        messages: [message],
        user: message.name,
      );
      final choices = response.choices!;
      _chats.value.add(Chat.fromRemote(choices[0].message!));
      notifyListeners();
      groupByDate();
      _saveChatHistory();
      return right(response);
    } on PlatformException catch (e) {
      return left(ChatError.error(e.message));
    }
  }

  Future<void> loadChatHistory() async {
    if (_preferencesService.hasKey(kChatHistoryKey)) {
      List<String> strings = _preferencesService.readList(kChatHistoryKey);
      final list = strings.map((e) => Chat.fromJson(jsonDecode(e))).toList();
      _chats.value = list.map((e) => e.copyWith(hasAnimated: true)).toList();
      groupByDate();
      notifyListeners();
    }
  }

  Future<void> _saveChatHistory() async {
    final updatedMsgs =
        _chats.value.map((e) => e?.copyWith(hasAnimated: true)).toList();
    final strings = updatedMsgs.map((e) => jsonEncode(e!.toJson())).toList();
    await _preferencesService.writeList(key: kChatHistoryKey, value: strings);
    notifyListeners();
  }

  void groupByDate() {
    _chatGroups.value = groupBy<Chat?, String>(_chats.value, (c) {
      DateTime? date = c!.created;
      return DateFormat.yMMMMEEEEd().format(date);
    });
    notifyListeners();
  }
}
