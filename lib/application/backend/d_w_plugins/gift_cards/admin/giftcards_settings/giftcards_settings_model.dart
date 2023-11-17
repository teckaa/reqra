import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/dropdown_searchable/dropdown_searchable_widget.dart';
import '/application/components/forms/left_sided_amount_text_field/left_sided_amount_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/application/components/shimmers/shimmer_one_line/shimmer_one_line_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'giftcards_settings_widget.dart' show GiftcardsSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GiftcardsSettingsModel extends FlutterFlowModel<GiftcardsSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // State field(s) for Checkbox-SellPermit widget.
  bool? checkboxSellPermitValue;
  // State field(s) for Checkbox-BuyPermit widget.
  bool? checkboxBuyPermitValue;
  // Model for DropdownSearchable-PlatformCurrency.
  late DropdownSearchableModel dropdownSearchablePlatformCurrencyModel;
  // Model for DropdownSearchable-ReceiverCurrency.
  late DropdownSearchableModel dropdownSearchableReceiverCurrencyModel;
  // Model for LeftSidedAmountTextField-TransactionFee.
  late LeftSidedAmountTextFieldModel
      leftSidedAmountTextFieldTransactionFeeModel;
  // Model for LeftSidedAmountTextField-BankTransferFee.
  late LeftSidedAmountTextFieldModel
      leftSidedAmountTextFieldBankTransferFeeModel;
  // Model for RightSidedAmountTextField-TaxFee.
  late RightSidedAmountTextFieldModel rightSidedAmountTextFieldTaxFeeModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    dropdownSearchablePlatformCurrencyModel =
        createModel(context, () => DropdownSearchableModel());
    dropdownSearchableReceiverCurrencyModel =
        createModel(context, () => DropdownSearchableModel());
    leftSidedAmountTextFieldTransactionFeeModel =
        createModel(context, () => LeftSidedAmountTextFieldModel());
    leftSidedAmountTextFieldBankTransferFeeModel =
        createModel(context, () => LeftSidedAmountTextFieldModel());
    rightSidedAmountTextFieldTaxFeeModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    noAccessErrorModel.dispose();
    dWHeaderModel.dispose();
    dropdownSearchablePlatformCurrencyModel.dispose();
    dropdownSearchableReceiverCurrencyModel.dispose();
    leftSidedAmountTextFieldTransactionFeeModel.dispose();
    leftSidedAmountTextFieldBankTransferFeeModel.dispose();
    rightSidedAmountTextFieldTaxFeeModel.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
