import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/components/confirm_transaction/confirm_transaction_widget.dart';
import '/application/backend/d_w_recipients/users/components/my_recipients/my_recipients_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_cable_t_v_widget.dart' show CreateCableTVWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateCableTVModel extends FlutterFlowModel<CreateCableTVWidget> {
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
  // State field(s) for TextField-SmartNumber widget.
  FocusNode? textFieldSmartNumberFocusNode;
  TextEditingController? textFieldSmartNumberController;
  final textFieldSmartNumberMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)?
      textFieldSmartNumberControllerValidator;
  String? _textFieldSmartNumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9nptuphx' /* Smart Card is required */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

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
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    photoGridCoverModel2 = createModel(context, () => PhotoGridCoverModel());
    textFieldSmartNumberControllerValidator =
        _textFieldSmartNumberControllerValidator;
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    photoGridCoverModel2.dispose();
    textFieldSmartNumberFocusNode?.dispose();
    textFieldSmartNumberController?.dispose();

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

    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
