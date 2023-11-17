import '/application/frontend/themes/abuja/components/header_abuja/header_abuja_widget.dart';
import '/application/frontend/themes/enugu/components/header_enugu/header_enugu_widget.dart';
import '/application/frontend/themes/lagos/components/header_lagos/header_lagos_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'header_widget.dart' show HeaderWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Header-Lagos component.
  late HeaderLagosModel headerLagosModel;
  // Model for Header-Abuja component.
  late HeaderAbujaModel headerAbujaModel;
  // Model for Header-Enugu component.
  late HeaderEnuguModel headerEnuguModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerLagosModel = createModel(context, () => HeaderLagosModel());
    headerAbujaModel = createModel(context, () => HeaderAbujaModel());
    headerEnuguModel = createModel(context, () => HeaderEnuguModel());
  }

  void dispose() {
    headerLagosModel.dispose();
    headerAbujaModel.dispose();
    headerEnuguModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
