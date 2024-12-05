import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestRecord extends FirestoreRecord {
  TestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "block" field.
  String? _block;
  String get block => _block ?? '';
  bool hasBlock() => _block != null;

  // "lesson" field.
  String? _lesson;
  String get lesson => _lesson ?? '';
  bool hasLesson() => _lesson != null;

  // "book" field.
  String? _book;
  String get book => _book ?? '';
  bool hasBook() => _book != null;

  // "questions" field.
  List<QuestionStruct>? _questions;
  List<QuestionStruct> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _block = snapshotData['block'] as String?;
    _lesson = snapshotData['lesson'] as String?;
    _book = snapshotData['book'] as String?;
    _questions = getStructList(
      snapshotData['questions'],
      QuestionStruct.fromMap,
    );
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test');

  static Stream<TestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestRecord.fromSnapshot(s));

  static Future<TestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestRecord.fromSnapshot(s));

  static TestRecord fromSnapshot(DocumentSnapshot snapshot) => TestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestRecordData({
  String? block,
  String? lesson,
  String? book,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'block': block,
      'lesson': lesson,
      'book': book,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestRecordDocumentEquality implements Equality<TestRecord> {
  const TestRecordDocumentEquality();

  @override
  bool equals(TestRecord? e1, TestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.block == e2?.block &&
        e1?.lesson == e2?.lesson &&
        e1?.book == e2?.book &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(TestRecord? e) => const ListEquality()
      .hash([e?.block, e?.lesson, e?.book, e?.questions, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is TestRecord;
}
