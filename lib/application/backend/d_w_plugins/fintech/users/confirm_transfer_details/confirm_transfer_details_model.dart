import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'confirm_transfer_details_widget.dart' show ConfirmTransferDetailsWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmTransferDetailsModel
    extends FlutterFlowModel<ConfirmTransferDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel1;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel2;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for ModalFooterColumn component.
  late ModalFooterColumnModel modalFooterColumnModel;
  // Stores action output result for [Firestore Query - Query a collection] action in ModalFooterColumn widget.
  DwAppRecord? getAppInfo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoGridModel1 = createModel(context, () => PhotoGridModel());
    photoGridModel2 = createModel(context, () => PhotoGridModel());
    pinCodeController = TextEditingController();
    modalFooterColumnModel =
        createModel(context, () => ModalFooterColumnModel());
  }

  void dispose() {
    photoGridModel1.dispose();
    photoGridModel2.dispose();
    pinCodeController?.dispose();
    modalFooterColumnModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
