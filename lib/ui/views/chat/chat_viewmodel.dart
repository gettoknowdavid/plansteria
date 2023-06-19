import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/chat.dart';
import 'package:plansteria/models/message.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/chat_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:plansteria/ui/views/chat/chat_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends FormViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _chatService = locator<ChatService>();
  final _snackbarService = locator<SnackbarService>();
  final _networkService = locator<NetworkService>();

  ScrollController controller = ScrollController();
  Timer? timer;

  ChatViewModel() {
    _chatService.loadChatHistory();
  }

  List<Chat?> get chats => _chatService.chats;
  Map<String, List<Chat?>> get chatGroups => _chatService.chatGroups;
  NetworkStatus get networkStatus => _networkService.status;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _chatService,
        _networkService,
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

  void init() {
    scrollListToEnd();
  }

  void scrollListToEnd() {
    if (chatGroups.isEmpty) return;

    Future.delayed(
      const Duration(seconds: 0),
      () => controller.jumpTo(controller.position.maxScrollExtent),
    );
  }

  Future<void> sendMessage({
    TextEditingController? textController,
    String? suggestion,
  }) async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    } else {
      scrollListToEnd();
      textController?.clear();
      final message = Message(
        role: 'user',
        content: suggestion ?? messageValue!,
        name: user.name.split(' ')[0],
      );

      _chatService.addChat(Chat.fromRemote(message));

      setBusy(true);

      final result = await _chatService.sendMessage(message);

<<<<<<< HEAD
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
        // timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        //   if (controller.hasClients) {
        //     // Check if we're already at the bottom
        //     if (controller.offset != controller.position.maxScrollExtent) {
        // controller.jumpTo(controller.position.maxScrollExtent);
        //     }
        //   }
        // });
      },
    );

    notifyListeners();
=======
      return result.fold(
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
    }
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
  }

  final examples = <String>[
    "Give location ideas for a tech event",
    "Got any ideas for a 10 year birthday party?",
    "Would love to have some decoration ideas for my event"
  ];

  final limitations = <String>[
    "May occasionally generate incorrect information",
    "Cannot remember what user said earlier in the conversation",
    "Limited knowledge of world and events after 2021",
  ];
}
