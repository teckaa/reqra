import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/frontend/components/download_app/download_app_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'home_lagos_widget.dart' show HomeLagosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeLagosModel extends FlutterFlowModel<HomeLagosWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel1;
  // Model for DownloadApp component.
  late DownloadAppModel downloadAppModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel2;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel1 =
        createModel(context, () => PrimaryRoundedButtonModel());
    downloadAppModel = createModel(context, () => DownloadAppModel());
    primaryRoundedButtonModel2 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonModel3 =
        createModel(context, () => PrimaryRoundedButtonModel());
  }

  void dispose() {
    primaryRoundedButtonModel1.dispose();
    downloadAppModel.dispose();
    primaryRoundedButtonModel2.dispose();
    primaryRoundedButtonModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
