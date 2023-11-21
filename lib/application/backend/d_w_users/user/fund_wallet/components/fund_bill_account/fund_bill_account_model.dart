import '/application/backend/d_w_users/user/fund_wallet/components/modal_payment/modal_payment_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'fund_bill_account_widget.dart' show FundBillAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FundBillAccountModel extends FlutterFlowModel<FundBillAccountWidget> {
  ///  Local state fields for this component.

  int? amount;

  String? referenceID = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for RightSidedAmountTextField component.
  late RightSidedAmountTextFieldModel rightSidedAmountTextFieldModel;
  // Model for ModalFooterColumn component.
  late ModalFooterColumnModel modalFooterColumnModel;
  // Stores action output result for [Firestore Query - Query a collection] action in ModalFooterColumn widget.
  DwAppRecord? queryAppInfo;
  // Stores action output result for [Firestore Query - Query a collection] action in ModalFooterColumn widget.
  BillpaymentSettingsRecord? getFlutterwaveApiKey;
  // Stores action output result for [Backend Call - API (StandardPayment)] action in ModalFooterColumn widget.
  ApiCallResponse? apiResultForFlutterwave;
  // Stores action output result for [Backend Call - API (VerifyStandardPayment)] action in ModalFooterColumn widget.
  ApiCallResponse? verifyFlutterwavePayment;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    rightSidedAmountTextFieldModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    modalFooterColumnModel =
        createModel(context, () => ModalFooterColumnModel());

    rightSidedAmountTextFieldModel.textControllerValidator =
        _formTextFieldValidator;
  }

  void dispose() {
    modalHeaderModel.dispose();
    rightSidedAmountTextFieldModel.dispose();
    modalFooterColumnModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ign2k49w' /* Amount is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }
}
