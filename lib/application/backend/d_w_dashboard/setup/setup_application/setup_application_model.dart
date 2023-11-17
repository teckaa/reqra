import '/application/backend/d_w_dashboard/setup/set_up_application_comp/set_up_application_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'setup_application_widget.dart' show SetupApplicationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetupApplicationModel extends FlutterFlowModel<SetupApplicationWidget> {
  ///  Local state fields for this page.

  String? setupStep = 'Set Up';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SetUpApplicationComp component.
  late SetUpApplicationCompModel setUpApplicationCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    setUpApplicationCompModel =
        createModel(context, () => SetUpApplicationCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    setUpApplicationCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
