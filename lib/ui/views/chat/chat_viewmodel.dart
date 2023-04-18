import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  List<Map<String, Object>> get messages => _messages;
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
