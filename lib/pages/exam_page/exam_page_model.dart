import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/choose_answer/choose_answer_widget.dart';
import '/component/confirm_submit/confirm_submit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'exam_page_widget.dart' show ExamPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExamPageModel extends FlutterFlowModel<ExamPageWidget> {
  ///  Local state fields for this page.

  List<CurrentAnswerStruct> currentAnswer = [];
  void addToCurrentAnswer(CurrentAnswerStruct item) => currentAnswer.add(item);
  void removeFromCurrentAnswer(CurrentAnswerStruct item) =>
      currentAnswer.remove(item);
  void removeAtIndexFromCurrentAnswer(int index) =>
      currentAnswer.removeAt(index);
  void insertAtIndexInCurrentAnswer(int index, CurrentAnswerStruct item) =>
      currentAnswer.insert(index, item);
  void updateCurrentAnswerAtIndex(
          int index, Function(CurrentAnswerStruct) updateFn) =>
      currentAnswer[index] = updateFn(currentAnswer[index]);

  ///  State fields for stateful widgets in this page.

  // Models for chooseAnswer dynamic component.
  late FlutterFlowDynamicModels<ChooseAnswerModel> chooseAnswerModels;

  @override
  void initState(BuildContext context) {
    chooseAnswerModels = FlutterFlowDynamicModels(() => ChooseAnswerModel());
  }

  @override
  void dispose() {
    chooseAnswerModels.dispose();
  }
}
