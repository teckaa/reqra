import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/frontend/components/download_app/download_app_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_enugu_widget.dart' show HomeEnuguWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeEnuguModel extends FlutterFlowModel<HomeEnuguWidget> {
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
