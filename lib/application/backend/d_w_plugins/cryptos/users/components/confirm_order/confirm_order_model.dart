import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_order_widget.dart' show ConfirmOrderWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmOrderModel extends FlutterFlowModel<ConfirmOrderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for ModalFooterColumn component.
  late ModalFooterColumnModel modalFooterColumnModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    modalFooterColumnModel =
        createModel(context, () => ModalFooterColumnModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    modalFooterColumnModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
