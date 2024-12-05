import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'teacher_options_widget.dart' show TeacherOptionsWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherOptionsModel extends FlutterFlowModel<TeacherOptionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - exportTestsToExcel] action in Button widget.
  String? result;
  // Stores action output result for [Custom Action - exportTestResultsToExcel] action in Button widget.
  String? results;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
