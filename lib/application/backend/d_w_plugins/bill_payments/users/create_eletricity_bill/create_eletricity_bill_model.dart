import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/components/confirm_transaction/confirm_transaction_widget.dart';
import '/application/backend/d_w_recipients/users/components/my_recipients/my_recipients_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_eletricity_bill_widget.dart' show CreateEletricityBillWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateEletricityBillModel
    extends FlutterFlowModel<CreateEletricityBillWidget> {
  ///  Local state fields for this page.

  double? commission;

  double? tax;

  double? amount;

  String? providerLogo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel2;
  // Stores action output result for [Bottom Sheet - MyRecipients] action in Row widget.
  DwRecipientsRecord? getMyRecipient;
  // State field(s) for TextField-MeterNumber widget.
  FocusNode? textFieldMeterNumberFocusNode;
  TextEditingController? textFieldMeterNumberController;
  final textFieldMeterNumberMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)?
      textFieldMeterNumberControllerValidator;
  // State field(s) for TextField-TypeOfService widget.
  FocusNode? textFieldTypeOfServiceFocusNode;
  TextEditingController? textFieldTypeOfServiceController;
  String? Function(BuildContext, String?)?
      textFieldTypeOfServiceControllerValidator;
  // State field(s) for TextField-Provider widget.
  FocusNode? textFieldProviderFocusNode;
  TextEditingController? textFieldProviderController;
  String? Function(BuildContext, String?)? textFieldProviderControllerValidator;
  // State field(s) for TextField-BillerCode widget.
  FocusNode? textFieldBillerCodeFocusNode;
  TextEditingController? textFieldBillerCodeController;
  String? Function(BuildContext, String?)?
      textFieldBillerCodeControllerValidator;
  // State field(s) for TextField-ItemCode widget.
  FocusNode? textFieldItemCodeFocusNode;
  TextEditingController? textFieldItemCodeController;
  String? Function(BuildContext, String?)? textFieldItemCodeControllerValidator;
  // State field(s) for TextField-ShortName widget.
  FocusNode? textFieldShortNameFocusNode;
  TextEditingController? textFieldShortNameController;
  String? Function(BuildContext, String?)?
      textFieldShortNameControllerValidator;
  // State field(s) for TextField-ProviderFee widget.
  FocusNode? textFieldProviderFeeFocusNode;
  TextEditingController? textFieldProviderFeeController;
  String? Function(BuildContext, String?)?
      textFieldProviderFeeControllerValidator;
  // State field(s) for TextField-Country widget.
  FocusNode? textFieldCountryFocusNode;
  TextEditingController? textFieldCountryController;
  String? Function(BuildContext, String?)? textFieldCountryControllerValidator;
  // State field(s) for TextField-Currency widget.
  FocusNode? textFieldCurrencyFocusNode;
  TextEditingController? textFieldCurrencyController;
  String? Function(BuildContext, String?)? textFieldCurrencyControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel3;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel4;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel5;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel6;
  // State field(s) for TextField-Amount widget.
  FocusNode? textFieldAmountFocusNode;
  TextEditingController? textFieldAmountController;
  String? Function(BuildContext, String?)? textFieldAmountControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel7;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    photoGridCoverModel2 = createModel(context, () => PhotoGridCoverModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel3 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel4 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel5 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel6 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel7 = createModel(context, () => PrimaryButtonModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    photoGridCoverModel2.dispose();
    textFieldMeterNumberFocusNode?.dispose();
    textFieldMeterNumberController?.dispose();

    textFieldTypeOfServiceFocusNode?.dispose();
    textFieldTypeOfServiceController?.dispose();

    textFieldProviderFocusNode?.dispose();
    textFieldProviderController?.dispose();

    textFieldBillerCodeFocusNode?.dispose();
    textFieldBillerCodeController?.dispose();

    textFieldItemCodeFocusNode?.dispose();
    textFieldItemCodeController?.dispose();

    textFieldShortNameFocusNode?.dispose();
    textFieldShortNameController?.dispose();

    textFieldProviderFeeFocusNode?.dispose();
    textFieldProviderFeeController?.dispose();

    textFieldCountryFocusNode?.dispose();
    textFieldCountryController?.dispose();

    textFieldCurrencyFocusNode?.dispose();
    textFieldCurrencyController?.dispose();

    primaryButtonModel1.dispose();
    primaryButtonModel2.dispose();
    primaryButtonModel3.dispose();
    primaryButtonModel4.dispose();
    primaryButtonModel5.dispose();
    primaryButtonModel6.dispose();
    textFieldAmountFocusNode?.dispose();
    textFieldAmountController?.dispose();

    primaryButtonModel7.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
