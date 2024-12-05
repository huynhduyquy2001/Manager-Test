import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultsRecord extends FirestoreRecord {
  ResultsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "studentName" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  bool hasStudentName() => _studentName != null;

  // "schoolName" field.
  String? _schoolName;
  String get schoolName => _schoolName ?? '';
  bool hasSchoolName() => _schoolName != null;

  // "schoolYear" field.
  String? _schoolYear;
  String get schoolYear => _schoolYear ?? '';
  bool hasSchoolYear() => _schoolYear != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  bool hasTotal() => _total != null;

  // "correct" field.
  int? _correct;
  int get correct => _correct ?? 0;
  bool hasCorrect() => _correct != null;

  // "incorrect" field.
  int? _incorrect;
  int get incorrect => _incorrect ?? 0;
  bool hasIncorrect() => _incorrect != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "test" field.
  DocumentReference? _test;
  DocumentReference? get test => _test;
  bool hasTest() => _test != null;

  // "answers" field.
  List<CurrentAnswerStruct>? _answers;
  List<CurrentAnswerStruct> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  void _initializeFields() {
    _studentName = snapshotData['studentName'] as String?;
    _schoolName = snapshotData['schoolName'] as String?;
    _schoolYear = snapshotData['schoolYear'] as String?;
    _total = castToType<int>(snapshotData['total']);
    _correct = castToType<int>(snapshotData['correct']);
    _incorrect = castToType<int>(snapshotData['incorrect']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _test = snapshotData['test'] as DocumentReference?;
    _answers = getStructList(
      snapshotData['answers'],
      CurrentAnswerStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('results');

  static Stream<ResultsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResultsRecord.fromSnapshot(s));

  static Future<ResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResultsRecord.fromSnapshot(s));

  static ResultsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResultsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResultsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResultsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResultsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResultsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResultsRecordData({
  String? studentName,
  String? schoolName,
  String? schoolYear,
  int? total,
  int? correct,
  int? incorrect,
  DateTime? createdAt,
  DocumentReference? test,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'studentName': studentName,
      'schoolName': schoolName,
      'schoolYear': schoolYear,
      'total': total,
      'correct': correct,
      'incorrect': incorrect,
      'createdAt': createdAt,
      'test': test,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResultsRecordDocumentEquality implements Equality<ResultsRecord> {
  const ResultsRecordDocumentEquality();

  @override
  bool equals(ResultsRecord? e1, ResultsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.studentName == e2?.studentName &&
        e1?.schoolName == e2?.schoolName &&
        e1?.schoolYear == e2?.schoolYear &&
        e1?.total == e2?.total &&
        e1?.correct == e2?.correct &&
        e1?.incorrect == e2?.incorrect &&
        e1?.createdAt == e2?.createdAt &&
        e1?.test == e2?.test &&
        listEquality.equals(e1?.answers, e2?.answers);
  }

  @override
  int hash(ResultsRecord? e) => const ListEquality().hash([
        e?.studentName,
        e?.schoolName,
        e?.schoolYear,
        e?.total,
        e?.correct,
        e?.incorrect,
        e?.createdAt,
        e?.test,
        e?.answers
      ]);

  @override
  bool isValidKey(Object? o) => o is ResultsRecord;
}
