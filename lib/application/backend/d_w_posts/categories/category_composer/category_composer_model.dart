import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_composer_widget.dart' show CategoryComposerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryComposerModel extends FlutterFlowModel<CategoryComposerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for InputTextField-CatName.
  late InputTextFieldModel inputTextFieldCatNameModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputTextFieldCatNameModel =
        createModel(context, () => InputTextFieldModel());
  }

  void dispose() {
    inputTextFieldCatNameModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
