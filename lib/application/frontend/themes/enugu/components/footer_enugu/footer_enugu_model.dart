import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/frontend/components/download_app/download_app_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'footer_enugu_widget.dart' show FooterEnuguWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FooterEnuguModel extends FlutterFlowModel<FooterEnuguWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryButton-GetStated.
  late PrimaryButtonModel primaryButtonGetStatedModel;
  // Model for AppRectangleLogo component.
  late AppRectangleLogoModel appRectangleLogoModel;
  // Model for DownloadApp component.
  late DownloadAppModel downloadAppModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryButtonGetStatedModel =
        createModel(context, () => PrimaryButtonModel());
    appRectangleLogoModel = createModel(context, () => AppRectangleLogoModel());
    downloadAppModel = createModel(context, () => DownloadAppModel());
  }

  void dispose() {
    primaryButtonGetStatedModel.dispose();
    appRectangleLogoModel.dispose();
    downloadAppModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
