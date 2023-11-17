import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/frontend/themes/lagos/components/footer_lagos/footer_lagos_widget.dart';
import '/application/frontend/themes/lagos/components/header_lagos/header_lagos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'cable_t_v_widget.dart' show CableTVWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CableTVModel extends FlutterFlowModel<CableTVWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header-Lagos component.
  late HeaderLagosModel headerLagosModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;
  // Model for Footer-Lagos component.
  late FooterLagosModel footerLagosModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerLagosModel = createModel(context, () => HeaderLagosModel());
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
    footerLagosModel = createModel(context, () => FooterLagosModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerLagosModel.dispose();
    primaryRoundedButtonModel.dispose();
    footerLagosModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
