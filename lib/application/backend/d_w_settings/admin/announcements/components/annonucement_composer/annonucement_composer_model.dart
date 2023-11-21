import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'annonucement_composer_widget.dart' show AnnonucementComposerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnnonucementComposerModel
    extends FlutterFlowModel<AnnonucementComposerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch-AnnouncementStatus widget.
  bool? switchAnnouncementStatusValue;
  Color? colorPicked;
  // State field(s) for TextField-Title widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleController;
  String? Function(BuildContext, String?)? textFieldTitleControllerValidator;
  // State field(s) for TextField-Message widget.
  FocusNode? textFieldMessageFocusNode;
  TextEditingController? textFieldMessageController;
  String? Function(BuildContext, String?)? textFieldMessageControllerValidator;
  // State field(s) for ChoiceChips-Responsive widget.
  List<String>? choiceChipsResponsiveValues;
  FormFieldController<List<String>>? choiceChipsResponsiveValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldTitleFocusNode?.dispose();
    textFieldTitleController?.dispose();

    textFieldMessageFocusNode?.dispose();
    textFieldMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
