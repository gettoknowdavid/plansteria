// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class EventCollectionReference
    implements
        EventQuery,
        FirestoreCollectionReference<Event, EventQuerySnapshot> {
  factory EventCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$EventCollectionReference;

  static Event fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Event.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Event value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Event> get reference;

  @override
  EventDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<EventDocumentReference> add(Event value);
}

class _$EventCollectionReference extends _$EventQuery
    implements EventCollectionReference {
  factory _$EventCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$EventCollectionReference._(
      firestore.collection('events').withConverter(
            fromFirestore: EventCollectionReference.fromFirestore,
            toFirestore: EventCollectionReference.toFirestore,
          ),
    );
  }

  _$EventCollectionReference._(
    CollectionReference<Event> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Event> get reference =>
      super.reference as CollectionReference<Event>;

  @override
  EventDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return EventDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<EventDocumentReference> add(Event value) {
    return reference.add(value).then((ref) => EventDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$EventCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class EventDocumentReference
    extends FirestoreDocumentReference<Event, EventDocumentSnapshot> {
  factory EventDocumentReference(DocumentReference<Event> reference) =
      _$EventDocumentReference;

  DocumentReference<Event> get reference;

  /// A reference to the [EventCollectionReference] containing this document.
  EventCollectionReference get parent {
    return _$EventCollectionReference(reference.firestore);
  }

  late final GuestCollectionReference guests = _$GuestCollectionReference(
    reference,
  );

  @override
  Stream<EventDocumentSnapshot> snapshots();

  @override
  Future<EventDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String uid,
    FieldValue uidFieldValue,
    String name,
    FieldValue nameFieldValue,
    String? description,
    FieldValue descriptionFieldValue,
    String address,
    FieldValue addressFieldValue,
    String state,
    FieldValue stateFieldValue,
    String city,
    FieldValue cityFieldValue,
    int? numberOfGuests,
    FieldValue numberOfGuestsFieldValue,
    String? notes,
    FieldValue notesFieldValue,
    double? price,
    FieldValue priceFieldValue,
    DateTime date,
    FieldValue dateFieldValue,
    DateTime startTime,
    FieldValue startTimeFieldValue,
    DateTime? endTime,
    FieldValue endTimeFieldValue,
    String? eventImageUrl,
    FieldValue eventImageUrlFieldValue,
    List<String?> photoUrls,
    FieldValue photoUrlsFieldValue,
    bool? featured,
    FieldValue featuredFieldValue,
    String email,
    FieldValue emailFieldValue,
    String phone,
    FieldValue phoneFieldValue,
    String creatorId,
    FieldValue creatorIdFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String uid,
    FieldValue uidFieldValue,
    String name,
    FieldValue nameFieldValue,
    String? description,
    FieldValue descriptionFieldValue,
    String address,
    FieldValue addressFieldValue,
    String state,
    FieldValue stateFieldValue,
    String city,
    FieldValue cityFieldValue,
    int? numberOfGuests,
    FieldValue numberOfGuestsFieldValue,
    String? notes,
    FieldValue notesFieldValue,
    double? price,
    FieldValue priceFieldValue,
    DateTime date,
    FieldValue dateFieldValue,
    DateTime startTime,
    FieldValue startTimeFieldValue,
    DateTime? endTime,
    FieldValue endTimeFieldValue,
    String? eventImageUrl,
    FieldValue eventImageUrlFieldValue,
    List<String?> photoUrls,
    FieldValue photoUrlsFieldValue,
    bool? featured,
    FieldValue featuredFieldValue,
    String email,
    FieldValue emailFieldValue,
    String phone,
    FieldValue phoneFieldValue,
    String creatorId,
    FieldValue creatorIdFieldValue,
  });
}

class _$EventDocumentReference
    extends FirestoreDocumentReference<Event, EventDocumentSnapshot>
    implements EventDocumentReference {
  _$EventDocumentReference(this.reference);

  @override
  final DocumentReference<Event> reference;

  /// A reference to the [EventCollectionReference] containing this document.
  EventCollectionReference get parent {
    return _$EventCollectionReference(reference.firestore);
  }

  late final GuestCollectionReference guests = _$GuestCollectionReference(
    reference,
  );

  @override
  Stream<EventDocumentSnapshot> snapshots() {
    return reference.snapshots().map(EventDocumentSnapshot._);
  }

  @override
  Future<EventDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(EventDocumentSnapshot._);
  }

  @override
  Future<EventDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(EventDocumentSnapshot._);
  }

  Future<void> update({
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? address = _sentinel,
    FieldValue? addressFieldValue,
    Object? state = _sentinel,
    FieldValue? stateFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? numberOfGuests = _sentinel,
    FieldValue? numberOfGuestsFieldValue,
    Object? notes = _sentinel,
    FieldValue? notesFieldValue,
    Object? price = _sentinel,
    FieldValue? priceFieldValue,
    Object? date = _sentinel,
    FieldValue? dateFieldValue,
    Object? startTime = _sentinel,
    FieldValue? startTimeFieldValue,
    Object? endTime = _sentinel,
    FieldValue? endTimeFieldValue,
    Object? eventImageUrl = _sentinel,
    FieldValue? eventImageUrlFieldValue,
    Object? photoUrls = _sentinel,
    FieldValue? photoUrlsFieldValue,
    Object? featured = _sentinel,
    FieldValue? featuredFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phone = _sentinel,
    FieldValue? phoneFieldValue,
    Object? creatorId = _sentinel,
    FieldValue? creatorIdFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      address == _sentinel || addressFieldValue == null,
      "Cannot specify both address and addressFieldValue",
    );
    assert(
      state == _sentinel || stateFieldValue == null,
      "Cannot specify both state and stateFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      numberOfGuests == _sentinel || numberOfGuestsFieldValue == null,
      "Cannot specify both numberOfGuests and numberOfGuestsFieldValue",
    );
    assert(
      notes == _sentinel || notesFieldValue == null,
      "Cannot specify both notes and notesFieldValue",
    );
    assert(
      price == _sentinel || priceFieldValue == null,
      "Cannot specify both price and priceFieldValue",
    );
    assert(
      date == _sentinel || dateFieldValue == null,
      "Cannot specify both date and dateFieldValue",
    );
    assert(
      startTime == _sentinel || startTimeFieldValue == null,
      "Cannot specify both startTime and startTimeFieldValue",
    );
    assert(
      endTime == _sentinel || endTimeFieldValue == null,
      "Cannot specify both endTime and endTimeFieldValue",
    );
    assert(
      eventImageUrl == _sentinel || eventImageUrlFieldValue == null,
      "Cannot specify both eventImageUrl and eventImageUrlFieldValue",
    );
    assert(
      photoUrls == _sentinel || photoUrlsFieldValue == null,
      "Cannot specify both photoUrls and photoUrlsFieldValue",
    );
    assert(
      featured == _sentinel || featuredFieldValue == null,
      "Cannot specify both featured and featuredFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phone == _sentinel || phoneFieldValue == null,
      "Cannot specify both phone and phoneFieldValue",
    );
    assert(
      creatorId == _sentinel || creatorIdFieldValue == null,
      "Cannot specify both creatorId and creatorIdFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_EventFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$$_EventFieldMap['uid']!: uidFieldValue,
      if (name != _sentinel) _$$_EventFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$$_EventFieldMap['name']!: nameFieldValue,
      if (description != _sentinel)
        _$$_EventFieldMap['description']!: description as String?,
      if (descriptionFieldValue != null)
        _$$_EventFieldMap['description']!: descriptionFieldValue,
      if (address != _sentinel)
        _$$_EventFieldMap['address']!: address as String,
      if (addressFieldValue != null)
        _$$_EventFieldMap['address']!: addressFieldValue,
      if (state != _sentinel) _$$_EventFieldMap['state']!: state as String,
      if (stateFieldValue != null) _$$_EventFieldMap['state']!: stateFieldValue,
      if (city != _sentinel) _$$_EventFieldMap['city']!: city as String,
      if (cityFieldValue != null) _$$_EventFieldMap['city']!: cityFieldValue,
      if (numberOfGuests != _sentinel)
        _$$_EventFieldMap['numberOfGuests']!: numberOfGuests as int?,
      if (numberOfGuestsFieldValue != null)
        _$$_EventFieldMap['numberOfGuests']!: numberOfGuestsFieldValue,
      if (notes != _sentinel) _$$_EventFieldMap['notes']!: notes as String?,
      if (notesFieldValue != null) _$$_EventFieldMap['notes']!: notesFieldValue,
      if (price != _sentinel) _$$_EventFieldMap['price']!: price as double?,
      if (priceFieldValue != null) _$$_EventFieldMap['price']!: priceFieldValue,
      if (date != _sentinel) _$$_EventFieldMap['date']!: date as DateTime,
      if (dateFieldValue != null) _$$_EventFieldMap['date']!: dateFieldValue,
      if (startTime != _sentinel)
        _$$_EventFieldMap['startTime']!: startTime as DateTime,
      if (startTimeFieldValue != null)
        _$$_EventFieldMap['startTime']!: startTimeFieldValue,
      if (endTime != _sentinel)
        _$$_EventFieldMap['endTime']!: endTime as DateTime?,
      if (endTimeFieldValue != null)
        _$$_EventFieldMap['endTime']!: endTimeFieldValue,
      if (eventImageUrl != _sentinel)
        _$$_EventFieldMap['eventImageUrl']!: eventImageUrl as String?,
      if (eventImageUrlFieldValue != null)
        _$$_EventFieldMap['eventImageUrl']!: eventImageUrlFieldValue,
      if (photoUrls != _sentinel)
        _$$_EventFieldMap['photoUrls']!: photoUrls as List<String?>,
      if (photoUrlsFieldValue != null)
        _$$_EventFieldMap['photoUrls']!: photoUrlsFieldValue,
      if (featured != _sentinel)
        _$$_EventFieldMap['featured']!: featured as bool?,
      if (featuredFieldValue != null)
        _$$_EventFieldMap['featured']!: featuredFieldValue,
      if (email != _sentinel) _$$_EventFieldMap['email']!: email as String,
      if (emailFieldValue != null) _$$_EventFieldMap['email']!: emailFieldValue,
      if (phone != _sentinel) _$$_EventFieldMap['phone']!: phone as String,
      if (phoneFieldValue != null) _$$_EventFieldMap['phone']!: phoneFieldValue,
      if (creatorId != _sentinel)
        _$$_EventFieldMap['creatorId']!: creatorId as String,
      if (creatorIdFieldValue != null)
        _$$_EventFieldMap['creatorId']!: creatorIdFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? address = _sentinel,
    FieldValue? addressFieldValue,
    Object? state = _sentinel,
    FieldValue? stateFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? numberOfGuests = _sentinel,
    FieldValue? numberOfGuestsFieldValue,
    Object? notes = _sentinel,
    FieldValue? notesFieldValue,
    Object? price = _sentinel,
    FieldValue? priceFieldValue,
    Object? date = _sentinel,
    FieldValue? dateFieldValue,
    Object? startTime = _sentinel,
    FieldValue? startTimeFieldValue,
    Object? endTime = _sentinel,
    FieldValue? endTimeFieldValue,
    Object? eventImageUrl = _sentinel,
    FieldValue? eventImageUrlFieldValue,
    Object? photoUrls = _sentinel,
    FieldValue? photoUrlsFieldValue,
    Object? featured = _sentinel,
    FieldValue? featuredFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phone = _sentinel,
    FieldValue? phoneFieldValue,
    Object? creatorId = _sentinel,
    FieldValue? creatorIdFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      address == _sentinel || addressFieldValue == null,
      "Cannot specify both address and addressFieldValue",
    );
    assert(
      state == _sentinel || stateFieldValue == null,
      "Cannot specify both state and stateFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      numberOfGuests == _sentinel || numberOfGuestsFieldValue == null,
      "Cannot specify both numberOfGuests and numberOfGuestsFieldValue",
    );
    assert(
      notes == _sentinel || notesFieldValue == null,
      "Cannot specify both notes and notesFieldValue",
    );
    assert(
      price == _sentinel || priceFieldValue == null,
      "Cannot specify both price and priceFieldValue",
    );
    assert(
      date == _sentinel || dateFieldValue == null,
      "Cannot specify both date and dateFieldValue",
    );
    assert(
      startTime == _sentinel || startTimeFieldValue == null,
      "Cannot specify both startTime and startTimeFieldValue",
    );
    assert(
      endTime == _sentinel || endTimeFieldValue == null,
      "Cannot specify both endTime and endTimeFieldValue",
    );
    assert(
      eventImageUrl == _sentinel || eventImageUrlFieldValue == null,
      "Cannot specify both eventImageUrl and eventImageUrlFieldValue",
    );
    assert(
      photoUrls == _sentinel || photoUrlsFieldValue == null,
      "Cannot specify both photoUrls and photoUrlsFieldValue",
    );
    assert(
      featured == _sentinel || featuredFieldValue == null,
      "Cannot specify both featured and featuredFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phone == _sentinel || phoneFieldValue == null,
      "Cannot specify both phone and phoneFieldValue",
    );
    assert(
      creatorId == _sentinel || creatorIdFieldValue == null,
      "Cannot specify both creatorId and creatorIdFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_EventFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$$_EventFieldMap['uid']!: uidFieldValue,
      if (name != _sentinel) _$$_EventFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$$_EventFieldMap['name']!: nameFieldValue,
      if (description != _sentinel)
        _$$_EventFieldMap['description']!: description as String?,
      if (descriptionFieldValue != null)
        _$$_EventFieldMap['description']!: descriptionFieldValue,
      if (address != _sentinel)
        _$$_EventFieldMap['address']!: address as String,
      if (addressFieldValue != null)
        _$$_EventFieldMap['address']!: addressFieldValue,
      if (state != _sentinel) _$$_EventFieldMap['state']!: state as String,
      if (stateFieldValue != null) _$$_EventFieldMap['state']!: stateFieldValue,
      if (city != _sentinel) _$$_EventFieldMap['city']!: city as String,
      if (cityFieldValue != null) _$$_EventFieldMap['city']!: cityFieldValue,
      if (numberOfGuests != _sentinel)
        _$$_EventFieldMap['numberOfGuests']!: numberOfGuests as int?,
      if (numberOfGuestsFieldValue != null)
        _$$_EventFieldMap['numberOfGuests']!: numberOfGuestsFieldValue,
      if (notes != _sentinel) _$$_EventFieldMap['notes']!: notes as String?,
      if (notesFieldValue != null) _$$_EventFieldMap['notes']!: notesFieldValue,
      if (price != _sentinel) _$$_EventFieldMap['price']!: price as double?,
      if (priceFieldValue != null) _$$_EventFieldMap['price']!: priceFieldValue,
      if (date != _sentinel) _$$_EventFieldMap['date']!: date as DateTime,
      if (dateFieldValue != null) _$$_EventFieldMap['date']!: dateFieldValue,
      if (startTime != _sentinel)
        _$$_EventFieldMap['startTime']!: startTime as DateTime,
      if (startTimeFieldValue != null)
        _$$_EventFieldMap['startTime']!: startTimeFieldValue,
      if (endTime != _sentinel)
        _$$_EventFieldMap['endTime']!: endTime as DateTime?,
      if (endTimeFieldValue != null)
        _$$_EventFieldMap['endTime']!: endTimeFieldValue,
      if (eventImageUrl != _sentinel)
        _$$_EventFieldMap['eventImageUrl']!: eventImageUrl as String?,
      if (eventImageUrlFieldValue != null)
        _$$_EventFieldMap['eventImageUrl']!: eventImageUrlFieldValue,
      if (photoUrls != _sentinel)
        _$$_EventFieldMap['photoUrls']!: photoUrls as List<String?>,
      if (photoUrlsFieldValue != null)
        _$$_EventFieldMap['photoUrls']!: photoUrlsFieldValue,
      if (featured != _sentinel)
        _$$_EventFieldMap['featured']!: featured as bool?,
      if (featuredFieldValue != null)
        _$$_EventFieldMap['featured']!: featuredFieldValue,
      if (email != _sentinel) _$$_EventFieldMap['email']!: email as String,
      if (emailFieldValue != null) _$$_EventFieldMap['email']!: emailFieldValue,
      if (phone != _sentinel) _$$_EventFieldMap['phone']!: phone as String,
      if (phoneFieldValue != null) _$$_EventFieldMap['phone']!: phoneFieldValue,
      if (creatorId != _sentinel)
        _$$_EventFieldMap['creatorId']!: creatorId as String,
      if (creatorIdFieldValue != null)
        _$$_EventFieldMap['creatorId']!: creatorIdFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is EventDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class EventQuery implements QueryReference<Event, EventQuerySnapshot> {
  @override
  EventQuery limit(int limit);

  @override
  EventQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  EventQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  EventQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  EventQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  EventQuery whereAddress({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereState({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereCity({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereNumberOfGuests({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  EventQuery whereNotes({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  EventQuery wherePrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  });
  EventQuery whereDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  EventQuery whereStartTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  EventQuery whereEndTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  EventQuery whereEventImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  EventQuery wherePhotoUrls({
    List<String?>? isEqualTo,
    List<String?>? isNotEqualTo,
    List<String?>? isLessThan,
    List<String?>? isLessThanOrEqualTo,
    List<String?>? isGreaterThan,
    List<String?>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String?>? arrayContainsAny,
  });
  EventQuery whereFeatured({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  EventQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery wherePhone({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  EventQuery whereCreatorId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  EventQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByDescription({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByAddress({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByState({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByCity({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByNumberOfGuests({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByNotes({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByPrice({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByStartTime({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByEndTime({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByEventImageUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByPhotoUrls({
    bool descending = false,
    List<String?> startAt,
    List<String?> startAfter,
    List<String?> endAt,
    List<String?> endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByFeatured({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByPhone({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });

  EventQuery orderByCreatorId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  });
}

class _$EventQuery extends QueryReference<Event, EventQuerySnapshot>
    implements EventQuery {
  _$EventQuery(
    this._collection, {
    required Query<Event> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<EventQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(EventQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<EventQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(EventQuerySnapshot._fromQuerySnapshot);
  }

  @override
  EventQuery limit(int limit) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EventQuery limitToLast(int limit) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['uid']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['description']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereAddress({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['address']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereState({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['state']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereCity({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['city']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereNumberOfGuests({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['numberOfGuests']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereNotes({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['notes']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery wherePrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['price']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['date']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereStartTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['startTime']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereEndTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['endTime']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereEventImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['eventImageUrl']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery wherePhotoUrls({
    List<String?>? isEqualTo,
    List<String?>? isNotEqualTo,
    List<String?>? isLessThan,
    List<String?>? isLessThanOrEqualTo,
    List<String?>? isGreaterThan,
    List<String?>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String?>? arrayContainsAny,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['photoUrls']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereFeatured({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['featured']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['email']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery wherePhone({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['phone']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery whereCreatorId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_EventFieldMap['creatorId']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  EventQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['uid']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_EventFieldMap['description']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByAddress({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['address']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByState({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['state']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByCity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['city']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByNumberOfGuests({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_EventFieldMap['numberOfGuests']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByNotes({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['notes']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['price']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['date']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByStartTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_EventFieldMap['startTime']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByEndTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['endTime']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByEventImageUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_EventFieldMap['eventImageUrl']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByPhotoUrls({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_EventFieldMap['photoUrls']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByFeatured({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_EventFieldMap['featured']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['email']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByPhone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_EventFieldMap['phone']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  EventQuery orderByCreatorId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EventDocumentSnapshot? startAtDocument,
    EventDocumentSnapshot? endAtDocument,
    EventDocumentSnapshot? endBeforeDocument,
    EventDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_EventFieldMap['creatorId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EventQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$EventQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class EventDocumentSnapshot extends FirestoreDocumentSnapshot<Event> {
  EventDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Event> snapshot;

  @override
  EventDocumentReference get reference {
    return EventDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Event? data;
}

class EventQuerySnapshot
    extends FirestoreQuerySnapshot<Event, EventQueryDocumentSnapshot> {
  EventQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory EventQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Event> snapshot,
  ) {
    final docs = snapshot.docs.map(EventQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        EventDocumentSnapshot._,
      );
    }).toList();

    return EventQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<EventDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    EventDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<EventDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Event> snapshot;

  @override
  final List<EventQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<EventDocumentSnapshot>> docChanges;
}

class EventQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Event>
    implements EventDocumentSnapshot {
  EventQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Event> snapshot;

  @override
  final Event data;

  @override
  EventDocumentReference get reference {
    return EventDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class GuestCollectionReference
    implements
        GuestQuery,
        FirestoreCollectionReference<Guest, GuestQuerySnapshot> {
  factory GuestCollectionReference(
    DocumentReference<Event> parent,
  ) = _$GuestCollectionReference;

  static Guest fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Guest.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Guest value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Guest> get reference;

  /// A reference to the containing [EventDocumentReference] if this is a subcollection.
  EventDocumentReference get parent;

  @override
  GuestDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GuestDocumentReference> add(Guest value);
}

class _$GuestCollectionReference extends _$GuestQuery
    implements GuestCollectionReference {
  factory _$GuestCollectionReference(
    DocumentReference<Event> parent,
  ) {
    return _$GuestCollectionReference._(
      EventDocumentReference(parent),
      parent.collection('guests').withConverter(
            fromFirestore: GuestCollectionReference.fromFirestore,
            toFirestore: GuestCollectionReference.toFirestore,
          ),
    );
  }

  _$GuestCollectionReference._(
    this.parent,
    CollectionReference<Guest> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final EventDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Guest> get reference =>
      super.reference as CollectionReference<Guest>;

  @override
  GuestDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return GuestDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GuestDocumentReference> add(Guest value) {
    return reference.add(value).then((ref) => GuestDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GuestCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GuestDocumentReference
    extends FirestoreDocumentReference<Guest, GuestDocumentSnapshot> {
  factory GuestDocumentReference(DocumentReference<Guest> reference) =
      _$GuestDocumentReference;

  DocumentReference<Guest> get reference;

  /// A reference to the [GuestCollectionReference] containing this document.
  GuestCollectionReference get parent {
    return _$GuestCollectionReference(
      reference.parent.parent!.withConverter<Event>(
        fromFirestore: EventCollectionReference.fromFirestore,
        toFirestore: EventCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<GuestDocumentSnapshot> snapshots();

  @override
  Future<GuestDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String uid,
    FieldValue uidFieldValue,
    String name,
    FieldValue nameFieldValue,
    String? avatar,
    FieldValue avatarFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String uid,
    FieldValue uidFieldValue,
    String name,
    FieldValue nameFieldValue,
    String? avatar,
    FieldValue avatarFieldValue,
  });
}

class _$GuestDocumentReference
    extends FirestoreDocumentReference<Guest, GuestDocumentSnapshot>
    implements GuestDocumentReference {
  _$GuestDocumentReference(this.reference);

  @override
  final DocumentReference<Guest> reference;

  /// A reference to the [GuestCollectionReference] containing this document.
  GuestCollectionReference get parent {
    return _$GuestCollectionReference(
      reference.parent.parent!.withConverter<Event>(
        fromFirestore: EventCollectionReference.fromFirestore,
        toFirestore: EventCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<GuestDocumentSnapshot> snapshots() {
    return reference.snapshots().map(GuestDocumentSnapshot._);
  }

  @override
  Future<GuestDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GuestDocumentSnapshot._);
  }

  @override
  Future<GuestDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(GuestDocumentSnapshot._);
  }

  Future<void> update({
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? avatar = _sentinel,
    FieldValue? avatarFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      avatar == _sentinel || avatarFieldValue == null,
      "Cannot specify both avatar and avatarFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_GuestFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$$_GuestFieldMap['uid']!: uidFieldValue,
      if (name != _sentinel) _$$_GuestFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$$_GuestFieldMap['name']!: nameFieldValue,
      if (avatar != _sentinel) _$$_GuestFieldMap['avatar']!: avatar as String?,
      if (avatarFieldValue != null)
        _$$_GuestFieldMap['avatar']!: avatarFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? avatar = _sentinel,
    FieldValue? avatarFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      avatar == _sentinel || avatarFieldValue == null,
      "Cannot specify both avatar and avatarFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_GuestFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$$_GuestFieldMap['uid']!: uidFieldValue,
      if (name != _sentinel) _$$_GuestFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$$_GuestFieldMap['name']!: nameFieldValue,
      if (avatar != _sentinel) _$$_GuestFieldMap['avatar']!: avatar as String?,
      if (avatarFieldValue != null)
        _$$_GuestFieldMap['avatar']!: avatarFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is GuestDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class GuestQuery implements QueryReference<Guest, GuestQuerySnapshot> {
  @override
  GuestQuery limit(int limit);

  @override
  GuestQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  GuestQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  GuestQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  GuestQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GuestQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GuestQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GuestQuery whereAvatar({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  GuestQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  });

  GuestQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  });

  GuestQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  });

  GuestQuery orderByAvatar({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  });
}

class _$GuestQuery extends QueryReference<Guest, GuestQuerySnapshot>
    implements GuestQuery {
  _$GuestQuery(
    this._collection, {
    required Query<Guest> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<GuestQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(GuestQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<GuestQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GuestQuerySnapshot._fromQuerySnapshot);
  }

  @override
  GuestQuery limit(int limit) {
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GuestQuery limitToLast(int limit) {
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  GuestQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuestQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuestQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuestQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GuestFieldMap['uid']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuestQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GuestFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuestQuery whereAvatar({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GuestFieldMap['avatar']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuestQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuestQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_GuestFieldMap['uid']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuestQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_GuestFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuestQuery orderByAvatar({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuestDocumentSnapshot? startAtDocument,
    GuestDocumentSnapshot? endAtDocument,
    GuestDocumentSnapshot? endBeforeDocument,
    GuestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_GuestFieldMap['avatar']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GuestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$GuestQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GuestDocumentSnapshot extends FirestoreDocumentSnapshot<Guest> {
  GuestDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Guest> snapshot;

  @override
  GuestDocumentReference get reference {
    return GuestDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Guest? data;
}

class GuestQuerySnapshot
    extends FirestoreQuerySnapshot<Guest, GuestQueryDocumentSnapshot> {
  GuestQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory GuestQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Guest> snapshot,
  ) {
    final docs = snapshot.docs.map(GuestQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        GuestDocumentSnapshot._,
      );
    }).toList();

    return GuestQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<GuestDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    GuestDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<GuestDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Guest> snapshot;

  @override
  final List<GuestQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GuestDocumentSnapshot>> docChanges;
}

class GuestQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Guest>
    implements GuestDocumentSnapshot {
  GuestQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Guest> snapshot;

  @override
  final Guest data;

  @override
  GuestDocumentReference get reference {
    return GuestDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'numberOfGuests': instance.numberOfGuests,
      'notes': instance.notes,
      'price': instance.price,
      'date': const FirestoreDateTimeConverter().toJson(instance.date),
      'startTime':
          const FirestoreDateTimeConverter().toJson(instance.startTime),
      'endTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endTime, const FirestoreDateTimeConverter().toJson),
      'eventImageUrl': instance.eventImageUrl,
      'photoUrls': instance.photoUrls,
      'featured': instance.featured,
      'email': instance.email,
      'phone': instance.phone,
      'creatorId': instance.creatorId,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      uid: json['uid'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      address: json['address'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      numberOfGuests: json['numberOfGuests'] as int?,
      notes: json['notes'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      date: const FirestoreDateTimeConverter()
          .fromJson(json['date'] as Timestamp),
      startTime: const FirestoreDateTimeConverter()
          .fromJson(json['startTime'] as Timestamp),
      endTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endTime'], const FirestoreDateTimeConverter().fromJson),
      eventImageUrl: json['eventImageUrl'] as String?,
      photoUrls: (json['photoUrls'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      featured: json['featured'] as bool?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      creatorId: json['creatorId'] as String,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'numberOfGuests': instance.numberOfGuests,
      'notes': instance.notes,
      'price': instance.price,
      'date': const FirestoreDateTimeConverter().toJson(instance.date),
      'startTime':
          const FirestoreDateTimeConverter().toJson(instance.startTime),
      'endTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endTime, const FirestoreDateTimeConverter().toJson),
      'eventImageUrl': instance.eventImageUrl,
      'photoUrls': instance.photoUrls,
      'featured': instance.featured,
      'email': instance.email,
      'phone': instance.phone,
      'creatorId': instance.creatorId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

_$_Guest _$$_GuestFromJson(Map<String, dynamic> json) => _$_Guest(
      uid: json['uid'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_GuestToJson(_$_Guest instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
    };
