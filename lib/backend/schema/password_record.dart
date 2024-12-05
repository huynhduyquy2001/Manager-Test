import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PasswordRecord extends FirestoreRecord {
  PasswordRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  void _initializeFields() {
    _password = snapshotData['password'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('password');

  static Stream<PasswordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PasswordRecord.fromSnapshot(s));

  static Future<PasswordRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PasswordRecord.fromSnapshot(s));

  static PasswordRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PasswordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PasswordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PasswordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PasswordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PasswordRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPasswordRecordData({
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class PasswordRecordDocumentEquality implements Equality<PasswordRecord> {
  const PasswordRecordDocumentEquality();

  @override
  bool equals(PasswordRecord? e1, PasswordRecord? e2) {
    return e1?.password == e2?.password;
  }

  @override
  int hash(PasswordRecord? e) => const ListEquality().hash([e?.password]);

  @override
  bool isValidKey(Object? o) => o is PasswordRecord;
}
