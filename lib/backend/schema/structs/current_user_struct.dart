// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentUserStruct extends FFFirebaseStruct {
  CurrentUserStruct({
    String? name,
    String? school,
    int? year,
    DateTime? createdAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _school = school,
        _year = year,
        _createdAt = createdAt,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "school" field.
  String? _school;
  String get school => _school ?? '';
  set school(String? val) => _school = val;

  bool hasSchool() => _school != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static CurrentUserStruct fromMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        name: data['name'] as String?,
        school: data['school'] as String?,
        year: castToType<int>(data['year']),
        createdAt: data['createdAt'] as DateTime?,
      );

  static CurrentUserStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'school': _school,
        'year': _year,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'school': serializeParam(
          _school,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CurrentUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        school: deserializeParam(
          data['school'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CurrentUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentUserStruct &&
        name == other.name &&
        school == other.school &&
        year == other.year &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, school, year, createdAt]);
}

CurrentUserStruct createCurrentUserStruct({
  String? name,
  String? school,
  int? year,
  DateTime? createdAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentUserStruct(
      name: name,
      school: school,
      year: year,
      createdAt: createdAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentUserStruct? updateCurrentUserStruct(
  CurrentUserStruct? currentUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentUserStructData(
  Map<String, dynamic> firestoreData,
  CurrentUserStruct? currentUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentUser == null) {
    return;
  }
  if (currentUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currentUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentUserData =
      getCurrentUserFirestoreData(currentUser, forFieldValue);
  final nestedData =
      currentUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currentUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentUserFirestoreData(
  CurrentUserStruct? currentUser, [
  bool forFieldValue = false,
]) {
  if (currentUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentUser.toMap());

  // Add any Firestore field values
  currentUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentUserListFirestoreData(
  List<CurrentUserStruct>? currentUsers,
) =>
    currentUsers?.map((e) => getCurrentUserFirestoreData(e, true)).toList() ??
    [];
