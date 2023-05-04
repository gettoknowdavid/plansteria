import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/chat.dart';
import 'package:plansteria/models/message.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/chat_service.dart';
import 'package:plansteria/ui/views/chat/chat_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends FormViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _chatService = locator<ChatService>();
  final _snackbarService = locator<SnackbarService>();

  ScrollController controller = ScrollController();
  Timer? timer;

  ChatViewModel() {
    _chatService.loadChatHistory();
  }

  List<Chat?> get chats => _chatService.chat;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _chatService,
      ];

  User get user => _authService.currentUser!;

  Future<void> clearChatHistory() async {
    await _chatService.clearChatHistory();
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> init() async {
    scrollListToEnd();
  }

  void scrollListToEnd() {
    Future.delayed(
      const Duration(seconds: 0),
      () => controller.jumpTo(controller.position.maxScrollExtent),
    );
  }

  Future<void> sendMessage() async {
    scrollListToEnd();

    final message = Message(
      role: 'user',
      content: messageValue!,
      name: user.name.split(' ')[0],
    );

    _chatService.addChat(Chat.fromRemote(message));

    setBusy(true);

    final result = await _chatService.sendMessage(message);

    result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            error: (value) => value.message!,
          ),
        );
      },
      (success) {
        setBusy(false);
        timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
          if (controller.hasClients) {
            // Check if we're already at the bottom
            if (controller.offset != controller.position.maxScrollExtent) {
              scrollListToEnd();
            }
          }
        });
        notifyListeners();
      },
    );

    notifyListeners();
  }
}
