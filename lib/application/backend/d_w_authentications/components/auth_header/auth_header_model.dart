import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'auth_header_widget.dart' show AuthHeaderWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthHeaderModel extends FlutterFlowModel<AuthHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AppRectangleLogo component.
  late AppRectangleLogoModel appRectangleLogoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appRectangleLogoModel = createModel(context, () => AppRectangleLogoModel());
  }

  void dispose() {
    appRectangleLogoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
