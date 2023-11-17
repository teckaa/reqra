import '/application/backend/d_w_dashboard/global/sidebar_comp/sidebar_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SidebarComp component.
  late SidebarCompModel sidebarCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sidebarCompModel = createModel(context, () => SidebarCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sidebarCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
