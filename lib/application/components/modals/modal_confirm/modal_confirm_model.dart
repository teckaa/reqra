import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_confirm_widget.dart' show ModalConfirmWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalConfirmModel extends FlutterFlowModel<ModalConfirmWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryButtonLoading-Delete.
  late PrimaryButtonLoadingModel primaryButtonLoadingDeleteModel;
  // Model for PrimaryButton-Cancel.
  late PrimaryButtonModel primaryButtonCancelModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryButtonLoadingDeleteModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    primaryButtonCancelModel = createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    primaryButtonLoadingDeleteModel.dispose();
    primaryButtonCancelModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
