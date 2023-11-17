import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'fund_card_widget.dart' show FundCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FundCardModel extends FlutterFlowModel<FundCardWidget> {
  ///  Local state fields for this component.

  double? amountToFund;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for RightSidedAmountTextField-AccountBalance.
  late RightSidedAmountTextFieldModel
      rightSidedAmountTextFieldAccountBalanceModel;
  // Model for RightSidedAmountTextField-Amount.
  late RightSidedAmountTextFieldModel rightSidedAmountTextFieldAmountModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ModalFooterRow component.
  late ModalFooterRowModel modalFooterRowModel;
  // Stores action output result for [Firestore Query - Query a collection] action in ModalFooterRow widget.
  DwAppRecord? getAppInfo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    rightSidedAmountTextFieldAccountBalanceModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    rightSidedAmountTextFieldAmountModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    modalFooterRowModel = createModel(context, () => ModalFooterRowModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    rightSidedAmountTextFieldAccountBalanceModel.dispose();
    rightSidedAmountTextFieldAmountModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    modalFooterRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
