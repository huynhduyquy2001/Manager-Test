import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/confirm_delete/confirm_delete_widget.dart';
import '/component/confirm_navigate_back/confirm_navigate_back_widget.dart';
import '/component/enter_question/enter_question_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'update_exam_page_widget.dart' show UpdateExamPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateExamPageModel extends FlutterFlowModel<UpdateExamPageWidget> {
  ///  Local state fields for this page.

  List<QuestionStruct> questionList = [];
  void addToQuestionList(QuestionStruct item) => questionList.add(item);
  void removeFromQuestionList(QuestionStruct item) => questionList.remove(item);
  void removeAtIndexFromQuestionList(int index) => questionList.removeAt(index);
  void insertAtIndexInQuestionList(int index, QuestionStruct item) =>
      questionList.insert(index, item);
  void updateQuestionListAtIndex(
          int index, Function(QuestionStruct) updateFn) =>
      questionList[index] = updateFn(questionList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Models for enterQuestion dynamic component.
  late FlutterFlowDynamicModels<EnterQuestionModel> enterQuestionModels;

  @override
  void initState(BuildContext context) {
    enterQuestionModels = FlutterFlowDynamicModels(() => EnterQuestionModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    enterQuestionModels.dispose();
  }
}
