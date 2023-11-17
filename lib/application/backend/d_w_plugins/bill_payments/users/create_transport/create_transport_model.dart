import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/components/list_of_network/list_of_network_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/dropdown_basic/dropdown_basic_widget.dart';
import '/application/components/forms/text_field_image_with_icon/text_field_image_with_icon_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_transport_widget.dart' show CreateTransportWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateTransportModel extends FlutterFlowModel<CreateTransportWidget> {
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
  // Model for TextFieldImageWithIcon component.
  late TextFieldImageWithIconModel textFieldImageWithIconModel;
  // Stores action output result for [Bottom Sheet - ListOfNetwork] action in TextFieldImageWithIcon widget.
  dynamic? getBillerDetails;
  // State field(s) for TextField-BillerCode widget.
  FocusNode? textFieldBillerCodeFocusNode;
  TextEditingController? textFieldBillerCodeController;
  String? Function(BuildContext, String?)?
      textFieldBillerCodeControllerValidator;
  // State field(s) for TextField-ItemCode widget.
  FocusNode? textFieldItemCodeFocusNode;
  TextEditingController? textFieldItemCodeController;
  String? Function(BuildContext, String?)? textFieldItemCodeControllerValidator;
  // State field(s) for TextField-ProductName widget.
  FocusNode? textFieldProductNameFocusNode;
  TextEditingController? textFieldProductNameController;
  String? Function(BuildContext, String?)?
      textFieldProductNameControllerValidator;
  // Model for DropdownBasic component.
  late DropdownBasicModel dropdownBasicModel;
  // State field(s) for TextField-PhoneNumber widget.
  FocusNode? textFieldPhoneNumberFocusNode;
  TextEditingController? textFieldPhoneNumberController;
  final textFieldPhoneNumberMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)?
      textFieldPhoneNumberControllerValidator;
  // State field(s) for TextField-Amount widget.
  FocusNode? textFieldAmountFocusNode;
  TextEditingController? textFieldAmountController;
  String? Function(BuildContext, String?)? textFieldAmountControllerValidator;
  // Model for PrimaryButton-Back.
  late PrimaryButtonModel primaryButtonBackModel;
  // Model for PrimaryButtonLoading-Airtime.
  late PrimaryButtonLoadingModel primaryButtonLoadingAirtimeModel;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    textFieldImageWithIconModel =
        createModel(context, () => TextFieldImageWithIconModel());
    dropdownBasicModel = createModel(context, () => DropdownBasicModel());
    primaryButtonBackModel = createModel(context, () => PrimaryButtonModel());
    primaryButtonLoadingAirtimeModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    textFieldImageWithIconModel.dispose();
    textFieldBillerCodeFocusNode?.dispose();
    textFieldBillerCodeController?.dispose();

    textFieldItemCodeFocusNode?.dispose();
    textFieldItemCodeController?.dispose();

    textFieldProductNameFocusNode?.dispose();
    textFieldProductNameController?.dispose();

    dropdownBasicModel.dispose();
    textFieldPhoneNumberFocusNode?.dispose();
    textFieldPhoneNumberController?.dispose();

    textFieldAmountFocusNode?.dispose();
    textFieldAmountController?.dispose();

    primaryButtonBackModel.dispose();
    primaryButtonLoadingAirtimeModel.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
