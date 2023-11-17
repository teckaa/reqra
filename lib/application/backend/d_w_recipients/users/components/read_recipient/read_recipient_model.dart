import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'read_recipient_widget.dart' show ReadRecipientWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ReadRecipientModel extends FlutterFlowModel<ReadRecipientWidget> {
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
