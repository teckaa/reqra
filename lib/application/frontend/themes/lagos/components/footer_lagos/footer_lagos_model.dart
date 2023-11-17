import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/frontend/components/download_app/download_app_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'footer_lagos_widget.dart' show FooterLagosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterLagosModel extends FlutterFlowModel<FooterLagosWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;
  // Model for AppRectangleLogo component.
  late AppRectangleLogoModel appRectangleLogoModel;
  // Model for DownloadApp component.
  late DownloadAppModel downloadAppModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
    appRectangleLogoModel = createModel(context, () => AppRectangleLogoModel());
    downloadAppModel = createModel(context, () => DownloadAppModel());
  }

  void dispose() {
    primaryRoundedButtonModel.dispose();
    appRectangleLogoModel.dispose();
    downloadAppModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
