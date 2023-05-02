import 'package:flutter/material.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.snackbars.dart';
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

  final listScrollController = ScrollController();

  User get user => _authService.currentUser!;
  List<Message?> get messages => _chatService.messages;
  bool get shouldAnimate => _chatService.shouldAnimate;

  Future<void> sendMessage() async {
    setBusy(true);
    final firstName = user.name.split(' ')[0];
    final message = Message(
      role: 'user',
      content: messageValue!,
      name: firstName,
      index: 0,
    );

    final result = await _chatService.sendMessage(message, user: firstName);

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
        _scrollListToEnd();
      },
    );
  }

  void _scrollListToEnd() {
    listScrollController.animateTo(
      listScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _chatService,
      ];
}
