import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'enter_question_widget.dart' show EnterQuestionWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EnterQuestionModel extends FlutterFlowModel<EnterQuestionWidget> {
  ///  Local state fields for this component.

  List<String> options = [];
  void addToOptions(String item) => options.add(item);
  void removeFromOptions(String item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, String item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(String) updateFn) =>
      options[index] = updateFn(options[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  final textFieldMask1 = MaskTextInputFormatter(mask: '######');
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for answerA widget.
  FocusNode? answerAFocusNode;
  TextEditingController? answerATextController;
  String? Function(BuildContext, String?)? answerATextControllerValidator;
  // State field(s) for answerB widget.
  FocusNode? answerBFocusNode;
  TextEditingController? answerBTextController;
  String? Function(BuildContext, String?)? answerBTextControllerValidator;
  // State field(s) for answerC widget.
  FocusNode? answerCFocusNode;
  TextEditingController? answerCTextController;
  String? Function(BuildContext, String?)? answerCTextControllerValidator;
  // State field(s) for answerD widget.
  FocusNode? answerDFocusNode;
  TextEditingController? answerDTextController;
  String? Function(BuildContext, String?)? answerDTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    answerAFocusNode?.dispose();
    answerATextController?.dispose();

    answerBFocusNode?.dispose();
    answerBTextController?.dispose();

    answerCFocusNode?.dispose();
    answerCTextController?.dispose();

    answerDFocusNode?.dispose();
    answerDTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
