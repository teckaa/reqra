import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/frontend/components/download_app/download_app_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_abuja_widget.dart' show HomeAbujaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeAbujaModel extends FlutterFlowModel<HomeAbujaWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DownloadApp component.
  late DownloadAppModel downloadAppModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    downloadAppModel = createModel(context, () => DownloadAppModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    downloadAppModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
