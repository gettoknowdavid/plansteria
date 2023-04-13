import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_error.freezed.dart';

@freezed
class EventError with _$EventError {
  const factory EventError.error([String? message]) = _EventErrorMessage;
  const factory EventError.networkError() = _NetworkError;
  const factory EventError.serverError() = _ServerError;
}
