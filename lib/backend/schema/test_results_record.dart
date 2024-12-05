import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestResultsRecord extends FirestoreRecord {
  TestResultsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "testId" field.
  DocumentReference? _testId;
  DocumentReference? get testId => _testId;
  bool hasTestId() => _testId != null;

  // "totalQuestions" field.
  int? _totalQuestions;
  int get totalQuestions => _totalQuestions ?? 0;
  bool hasTotalQuestions() => _totalQuestions != null;

  // "trueQuestions" field.
  int? _trueQuestions;
  int get trueQuestions => _trueQuestions ?? 0;
  bool hasTrueQuestions() => _trueQuestions != null;

  // "falseQuestions" field.
  int? _falseQuestions;
  int get falseQuestions => _falseQuestions ?? 0;
  bool hasFalseQuestions() => _falseQuestions != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _testId = snapshotData['testId'] as DocumentReference?;
    _totalQuestions = castToType<int>(snapshotData['totalQuestions']);
    _trueQuestions = castToType<int>(snapshotData['trueQuestions']);
    _falseQuestions = castToType<int>(snapshotData['falseQuestions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testResults');

  static Stream<TestResultsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestResultsRecord.fromSnapshot(s));

  static Future<TestResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestResultsRecord.fromSnapshot(s));

  static TestResultsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestResultsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestResultsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestResultsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestResultsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestResultsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestResultsRecordData({
  DocumentReference? uid,
  DocumentReference? testId,
  int? totalQuestions,
  int? trueQuestions,
  int? falseQuestions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'testId': testId,
      'totalQuestions': totalQuestions,
      'trueQuestions': trueQuestions,
      'falseQuestions': falseQuestions,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestResultsRecordDocumentEquality implements Equality<TestResultsRecord> {
  const TestResultsRecordDocumentEquality();

  @override
  bool equals(TestResultsRecord? e1, TestResultsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.testId == e2?.testId &&
        e1?.totalQuestions == e2?.totalQuestions &&
        e1?.trueQuestions == e2?.trueQuestions &&
        e1?.falseQuestions == e2?.falseQuestions;
  }

  @override
  int hash(TestResultsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.testId,
        e?.totalQuestions,
        e?.trueQuestions,
        e?.falseQuestions
      ]);

  @override
  bool isValidKey(Object? o) => o is TestResultsRecord;
}
