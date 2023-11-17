import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'mobile_dropdown_abuja_widget.dart' show MobileDropdownAbujaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MobileDropdownAbujaModel
    extends FlutterFlowModel<MobileDropdownAbujaWidget> {
  ///  Local state fields for this component.

  bool subMenuState = true;

  ///  State fields for stateful widgets in this component.

  // Model for PrimaryButton-Login.
  late PrimaryButtonModel primaryButtonLoginModel;
  // Model for PrimaryButton-Register.
  late PrimaryButtonModel primaryButtonRegisterModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryButtonLoginModel = createModel(context, () => PrimaryButtonModel());
    primaryButtonRegisterModel =
        createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    primaryButtonLoginModel.dispose();
    primaryButtonRegisterModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
