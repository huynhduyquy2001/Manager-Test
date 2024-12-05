// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentAnswerStruct extends FFFirebaseStruct {
  CurrentAnswerStruct({
    String? question,
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _answer = answer,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  static CurrentAnswerStruct fromMap(Map<String, dynamic> data) =>
      CurrentAnswerStruct(
        question: data['question'] as String?,
        answer: data['answer'] as String?,
      );

  static CurrentAnswerStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentAnswerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static CurrentAnswerStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentAnswerStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CurrentAnswerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentAnswerStruct &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([question, answer]);
}

CurrentAnswerStruct createCurrentAnswerStruct({
  String? question,
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentAnswerStruct(
      question: question,
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentAnswerStruct? updateCurrentAnswerStruct(
  CurrentAnswerStruct? currentAnswer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentAnswer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentAnswerStructData(
  Map<String, dynamic> firestoreData,
  CurrentAnswerStruct? currentAnswer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentAnswer == null) {
    return;
  }
  if (currentAnswer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currentAnswer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentAnswerData =
      getCurrentAnswerFirestoreData(currentAnswer, forFieldValue);
  final nestedData =
      currentAnswerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currentAnswer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentAnswerFirestoreData(
  CurrentAnswerStruct? currentAnswer, [
  bool forFieldValue = false,
]) {
  if (currentAnswer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentAnswer.toMap());

  // Add any Firestore field values
  currentAnswer.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentAnswerListFirestoreData(
  List<CurrentAnswerStruct>? currentAnswers,
) =>
    currentAnswers
        ?.map((e) => getCurrentAnswerFirestoreData(e, true))
        .toList() ??
    [];
