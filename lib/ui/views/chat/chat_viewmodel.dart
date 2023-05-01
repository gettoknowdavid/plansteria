import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();

  User get user => _authService.currentUser!;
  
  List<Map<String, Object>> get messages => _messages;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}

const _messages = [
  {"msg": "Hello! How are you?", "chatIndex": 0},
  {
    "msg":
        "Hello! I am ChatGPT, how can I help? I am an artificial intelligence model designed to enable you answer questions and solve problems easily.",
    "chatIndex": 1
  },
  {"msg": "What's today's date?", "chatIndex": 0},
];
