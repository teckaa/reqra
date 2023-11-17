import '/application/backend/d_w_dashboard/global/sidebar_comp/sidebar_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'd_w_sidebar_widget.dart' show DWSidebarWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DWSidebarModel extends FlutterFlowModel<DWSidebarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SidebarComp component.
  late SidebarCompModel sidebarCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sidebarCompModel = createModel(context, () => SidebarCompModel());
  }

  void dispose() {
    sidebarCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
