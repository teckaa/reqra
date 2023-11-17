import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'no_access_error_widget.dart' show NoAccessErrorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoAccessErrorModel extends FlutterFlowModel<NoAccessErrorWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
  }

  void dispose() {
    primaryRoundedButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
