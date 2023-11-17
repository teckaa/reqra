import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_footer_column_widget.dart' show ModalFooterColumnWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalFooterColumnModel extends FlutterFlowModel<ModalFooterColumnWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    primaryButtonLoadingModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
