import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Test1Record extends FirestoreRecord {
  Test1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cauhoi" field.
  String? _cauhoi;
  String get cauhoi => _cauhoi ?? '';
  bool hasCauhoi() => _cauhoi != null;

  // "stt" field.
  String? _stt;
  String get stt => _stt ?? '';
  bool hasStt() => _stt != null;

  // "dapanA" field.
  String? _dapanA;
  String get dapanA => _dapanA ?? '';
  bool hasDapanA() => _dapanA != null;

  // "dapanB" field.
  String? _dapanB;
  String get dapanB => _dapanB ?? '';
  bool hasDapanB() => _dapanB != null;

  // "dapandung" field.
  String? _dapandung;
  String get dapandung => _dapandung ?? '';
  bool hasDapandung() => _dapandung != null;

  void _initializeFields() {
    _cauhoi = snapshotData['cauhoi'] as String?;
    _stt = snapshotData['stt'] as String?;
    _dapanA = snapshotData['dapanA'] as String?;
    _dapanB = snapshotData['dapanB'] as String?;
    _dapandung = snapshotData['dapandung'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test1');

  static Stream<Test1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Test1Record.fromSnapshot(s));

  static Future<Test1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Test1Record.fromSnapshot(s));

  static Test1Record fromSnapshot(DocumentSnapshot snapshot) => Test1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Test1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Test1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Test1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Test1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTest1RecordData({
  String? cauhoi,
  String? stt,
  String? dapanA,
  String? dapanB,
  String? dapandung,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cauhoi': cauhoi,
      'stt': stt,
      'dapanA': dapanA,
      'dapanB': dapanB,
      'dapandung': dapandung,
    }.withoutNulls,
  );

  return firestoreData;
}

class Test1RecordDocumentEquality implements Equality<Test1Record> {
  const Test1RecordDocumentEquality();

  @override
  bool equals(Test1Record? e1, Test1Record? e2) {
    return e1?.cauhoi == e2?.cauhoi &&
        e1?.stt == e2?.stt &&
        e1?.dapanA == e2?.dapanA &&
        e1?.dapanB == e2?.dapanB &&
        e1?.dapandung == e2?.dapandung;
  }

  @override
  int hash(Test1Record? e) => const ListEquality()
      .hash([e?.cauhoi, e?.stt, e?.dapanA, e?.dapanB, e?.dapandung]);

  @override
  bool isValidKey(Object? o) => o is Test1Record;
}
