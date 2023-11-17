import '/application/frontend/themes/abuja/components/footer_abuja/footer_abuja_widget.dart';
import '/application/frontend/themes/enugu/components/footer_enugu/footer_enugu_widget.dart';
import '/application/frontend/themes/lagos/components/footer_lagos/footer_lagos_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'footer_widget.dart' show FooterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FooterModel extends FlutterFlowModel<FooterWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Footer-Lagos component.
  late FooterLagosModel footerLagosModel;
  // Model for Footer-Abuja component.
  late FooterAbujaModel footerAbujaModel;
  // Model for Footer-Enugu component.
  late FooterEnuguModel footerEnuguModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    footerLagosModel = createModel(context, () => FooterLagosModel());
    footerAbujaModel = createModel(context, () => FooterAbujaModel());
    footerEnuguModel = createModel(context, () => FooterEnuguModel());
  }

  void dispose() {
    footerLagosModel.dispose();
    footerAbujaModel.dispose();
    footerEnuguModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
