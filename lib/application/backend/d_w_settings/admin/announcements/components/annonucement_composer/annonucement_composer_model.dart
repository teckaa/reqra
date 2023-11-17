import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'annonucement_composer_widget.dart' show AnnonucementComposerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnnonucementComposerModel
    extends FlutterFlowModel<AnnonucementComposerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for InputTextField-Title.
  late InputTextFieldModel inputTextFieldTitleModel;
  // Model for InputTextArea-Desc.
  late InputTextAreaModel inputTextAreaDescModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputTextFieldTitleModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaDescModel = createModel(context, () => InputTextAreaModel());
  }

  void dispose() {
    inputTextFieldTitleModel.dispose();
    inputTextAreaDescModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
