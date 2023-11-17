import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'confirm_transaction_widget.dart' show ConfirmTransactionWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmTransactionModel
    extends FlutterFlowModel<ConfirmTransactionWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryButtonLoading widget.
  BillpaymentSettingsRecord? getBillKey;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryButtonLoading widget.
  DwAppRecord? getAppInfo;
  // Stores action output result for [Backend Call - API (ValidateCustomer)] action in PrimaryButtonLoading widget.
  ApiCallResponse? apiResultValidatePhoneNumber;
  // Stores action output result for [Backend Call - API (CreateBill)] action in PrimaryButtonLoading widget.
  ApiCallResponse? apiResultCreateBill;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    pinCodeController = TextEditingController();
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    pinCodeController?.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
