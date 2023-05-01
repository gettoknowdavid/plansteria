import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_error.freezed.dart';

@freezed
class ChatError with _$ChatError {
  const factory ChatError.error([String? message]) = _ChatErrorMessage;
  const factory ChatError.serverError() = _ServerError;
  const factory ChatError.noNetworkConnection() = _NoNetworkConnection;
}
