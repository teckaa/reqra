import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/global/app_rectangle_dark_logo/app_rectangle_dark_logo_widget.dart';
import '/application/frontend/components/download_app/download_app_widget.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'footer_abuja_widget.dart' show FooterAbujaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterAbujaModel extends FlutterFlowModel<FooterAbujaWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryButton-GetStated.
  late PrimaryButtonModel primaryButtonGetStatedModel;
  // Model for AppRectangleDarkLogo component.
  late AppRectangleDarkLogoModel appRectangleDarkLogoModel;
  // Model for DownloadApp component.
  late DownloadAppModel downloadAppModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryButtonGetStatedModel =
        createModel(context, () => PrimaryButtonModel());
    appRectangleDarkLogoModel =
        createModel(context, () => AppRectangleDarkLogoModel());
    downloadAppModel = createModel(context, () => DownloadAppModel());
  }

  void dispose() {
    primaryButtonGetStatedModel.dispose();
    appRectangleDarkLogoModel.dispose();
    downloadAppModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
