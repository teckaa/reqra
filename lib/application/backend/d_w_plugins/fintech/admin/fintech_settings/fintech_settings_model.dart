import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'fintech_settings_widget.dart' show FintechSettingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FintechSettingsModel extends FlutterFlowModel<FintechSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    noAccessErrorModel.dispose();
    dWHeaderModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
