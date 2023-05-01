// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  int? get numberOfGuests => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  @FirestoreDateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;
  @FirestoreDateTimeConverter()
  DateTime get startTime => throw _privateConstructorUsedError;
  @FirestoreDateTimeConverter()
  DateTime? get endTime => throw _privateConstructorUsedError;
  String? get eventImageUrl => throw _privateConstructorUsedError;
  List<String?> get photoUrls => throw _privateConstructorUsedError;
  bool? get featured => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  Creator get creator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String? description,
      String address,
      String state,
      String city,
      int? numberOfGuests,
      String? notes,
      double? price,
      @FirestoreDateTimeConverter() DateTime date,
      @FirestoreDateTimeConverter() DateTime startTime,
      @FirestoreDateTimeConverter() DateTime? endTime,
      String? eventImageUrl,
      List<String?> photoUrls,
      bool? featured,
      String email,
      String phone,
      Creator creator});

  $CreatorCopyWith<$Res> get creator;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? description = freezed,
    Object? address = null,
    Object? state = null,
    Object? city = null,
    Object? numberOfGuests = freezed,
    Object? notes = freezed,
    Object? price = freezed,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? eventImageUrl = freezed,
    Object? photoUrls = null,
    Object? featured = freezed,
    Object? email = null,
    Object? phone = null,
    Object? creator = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfGuests: freezed == numberOfGuests
          ? _value.numberOfGuests
          : numberOfGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventImageUrl: freezed == eventImageUrl
          ? _value.eventImageUrl
          : eventImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: null == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Creator,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatorCopyWith<$Res> get creator {
    return $CreatorCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String? description,
      String address,
      String state,
      String city,
      int? numberOfGuests,
      String? notes,
      double? price,
      @FirestoreDateTimeConverter() DateTime date,
      @FirestoreDateTimeConverter() DateTime startTime,
      @FirestoreDateTimeConverter() DateTime? endTime,
      String? eventImageUrl,
      List<String?> photoUrls,
      bool? featured,
      String email,
      String phone,
      Creator creator});

  @override
  $CreatorCopyWith<$Res> get creator;
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? description = freezed,
    Object? address = null,
    Object? state = null,
    Object? city = null,
    Object? numberOfGuests = freezed,
    Object? notes = freezed,
    Object? price = freezed,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? eventImageUrl = freezed,
    Object? photoUrls = null,
    Object? featured = freezed,
    Object? email = null,
    Object? phone = null,
    Object? creator = null,
  }) {
    return _then(_$_Event(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfGuests: freezed == numberOfGuests
          ? _value.numberOfGuests
          : numberOfGuests // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventImageUrl: freezed == eventImageUrl
          ? _value.eventImageUrl
          : eventImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: null == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Creator,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      {required this.uid,
      required this.name,
      this.description,
      required this.address,
      required this.state,
      required this.city,
      this.numberOfGuests,
      this.notes,
      this.price,
      @FirestoreDateTimeConverter() required this.date,
      @FirestoreDateTimeConverter() required this.startTime,
      @FirestoreDateTimeConverter() this.endTime,
      this.eventImageUrl,
      required final List<String?> photoUrls,
      this.featured,
      required this.email,
      required this.phone,
      required this.creator})
      : _photoUrls = photoUrls;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String address;
  @override
  final String state;
  @override
  final String city;
  @override
  final int? numberOfGuests;
  @override
  final String? notes;
  @override
  final double? price;
  @override
  @FirestoreDateTimeConverter()
  final DateTime date;
  @override
  @FirestoreDateTimeConverter()
  final DateTime startTime;
  @override
  @FirestoreDateTimeConverter()
  final DateTime? endTime;
  @override
  final String? eventImageUrl;
  final List<String?> _photoUrls;
  @override
  List<String?> get photoUrls {
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrls);
  }

  @override
  final bool? featured;
  @override
  final String email;
  @override
  final String phone;
  @override
  final Creator creator;

  @override
  String toString() {
    return 'Event(uid: $uid, name: $name, description: $description, address: $address, state: $state, city: $city, numberOfGuests: $numberOfGuests, notes: $notes, price: $price, date: $date, startTime: $startTime, endTime: $endTime, eventImageUrl: $eventImageUrl, photoUrls: $photoUrls, featured: $featured, email: $email, phone: $phone, creator: $creator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.numberOfGuests, numberOfGuests) ||
                other.numberOfGuests == numberOfGuests) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.eventImageUrl, eventImageUrl) ||
                other.eventImageUrl == eventImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.creator, creator) || other.creator == creator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      description,
      address,
      state,
      city,
      numberOfGuests,
      notes,
      price,
      date,
      startTime,
      endTime,
      eventImageUrl,
      const DeepCollectionEquality().hash(_photoUrls),
      featured,
      email,
      phone,
      creator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  factory _Event(
      {required final String uid,
      required final String name,
      final String? description,
      required final String address,
      required final String state,
      required final String city,
      final int? numberOfGuests,
      final String? notes,
      final double? price,
      @FirestoreDateTimeConverter() required final DateTime date,
      @FirestoreDateTimeConverter() required final DateTime startTime,
      @FirestoreDateTimeConverter() final DateTime? endTime,
      final String? eventImageUrl,
      required final List<String?> photoUrls,
      final bool? featured,
      required final String email,
      required final String phone,
      required final Creator creator}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get address;
  @override
  String get state;
  @override
  String get city;
  @override
  int? get numberOfGuests;
  @override
  String? get notes;
  @override
  double? get price;
  @override
  @FirestoreDateTimeConverter()
  DateTime get date;
  @override
  @FirestoreDateTimeConverter()
  DateTime get startTime;
  @override
  @FirestoreDateTimeConverter()
  DateTime? get endTime;
  @override
  String? get eventImageUrl;
  @override
  List<String?> get photoUrls;
  @override
  bool? get featured;
  @override
  String get email;
  @override
  String get phone;
  @override
  Creator get creator;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}

Guest _$GuestFromJson(Map<String, dynamic> json) {
  return _Guest.fromJson(json);
}

/// @nodoc
mixin _$Guest {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestCopyWith<Guest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) then) =
      _$GuestCopyWithImpl<$Res, Guest>;
  @useResult
  $Res call({String uid, String name, String? avatar});
}

/// @nodoc
class _$GuestCopyWithImpl<$Res, $Val extends Guest>
    implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GuestCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$$_GuestCopyWith(_$_Guest value, $Res Function(_$_Guest) then) =
      __$$_GuestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String name, String? avatar});
}

/// @nodoc
class __$$_GuestCopyWithImpl<$Res> extends _$GuestCopyWithImpl<$Res, _$_Guest>
    implements _$$_GuestCopyWith<$Res> {
  __$$_GuestCopyWithImpl(_$_Guest _value, $Res Function(_$_Guest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_$_Guest(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Guest implements _Guest {
  _$_Guest({required this.uid, required this.name, this.avatar});

  factory _$_Guest.fromJson(Map<String, dynamic> json) =>
      _$$_GuestFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'Guest(uid: $uid, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Guest &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GuestCopyWith<_$_Guest> get copyWith =>
      __$$_GuestCopyWithImpl<_$_Guest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestToJson(
      this,
    );
  }
}

abstract class _Guest implements Guest {
  factory _Guest(
      {required final String uid,
      required final String name,
      final String? avatar}) = _$_Guest;

  factory _Guest.fromJson(Map<String, dynamic> json) = _$_Guest.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_GuestCopyWith<_$_Guest> get copyWith =>
      throw _privateConstructorUsedError;
}
