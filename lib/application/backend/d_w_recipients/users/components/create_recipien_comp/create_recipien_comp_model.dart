import '/application/backend/d_w_recipients/users/components/list_of_banks/list_of_banks_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field/tel_text_field_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_recipien_comp_widget.dart' show CreateRecipienCompWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateRecipienCompModel
    extends FlutterFlowModel<CreateRecipienCompWidget> {
  ///  Local state fields for this component.

  bool? checkAccountNumberError;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for DropDown-TypeOfNumber widget.
  String? dropDownTypeOfNumberValue;
  FormFieldController<String>? dropDownTypeOfNumberValueController;
  // Stores action output result for [Bottom Sheet - ListOfBanks] action in Stack widget.
  dynamic? getBankNameCode;
  // State field(s) for TextField-BankName widget.
  FocusNode? textFieldBankNameFocusNode;
  TextEditingController? textFieldBankNameController;
  String? Function(BuildContext, String?)? textFieldBankNameControllerValidator;
  String? _textFieldBankNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zppt8fw2' /* Bank name is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextField-AccountNumber widget.
  FocusNode? textFieldAccountNumberFocusNode;
  TextEditingController? textFieldAccountNumberController;
  final textFieldAccountNumberMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)?
      textFieldAccountNumberControllerValidator;
  String? _textFieldAccountNumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hjyvm0js' /* Enter 10 digit Account number */,
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

  // Stores action output result for [Backend Call - API (AccountResolve)] action in TextField-AccountNumber widget.
  ApiCallResponse? apiResultVerifyAccount;
  // State field(s) for TextField-AccountName widget.
  FocusNode? textFieldAccountNameFocusNode;
  TextEditingController? textFieldAccountNameController;
  String? Function(BuildContext, String?)?
      textFieldAccountNameControllerValidator;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel1;
  // State field(s) for TextField-Provider widget.
  FocusNode? textFieldProviderFocusNode;
  TextEditingController? textFieldProviderController;
  String? Function(BuildContext, String?)? textFieldProviderControllerValidator;
  // State field(s) for TextField-CustomerNumber widget.
  FocusNode? textFieldCustomerNumberFocusNode;
  TextEditingController? textFieldCustomerNumberController;
  final textFieldCustomerNumberMask =
      MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)?
      textFieldCustomerNumberControllerValidator;
  // State field(s) for TextField-CustomerName widget.
  FocusNode? textFieldCustomerNameFocusNode;
  TextEditingController? textFieldCustomerNameController;
  String? Function(BuildContext, String?)?
      textFieldCustomerNameControllerValidator;
  // Model for TelTextField-PhoneNumber.
  late TelTextFieldModel telTextFieldPhoneNumberModel;
  // Model for InputTextField-PhoneName.
  late InputTextFieldModel inputTextFieldPhoneNameModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldBankNameControllerValidator =
        _textFieldBankNameControllerValidator;
    textFieldAccountNumberControllerValidator =
        _textFieldAccountNumberControllerValidator;
    primaryButtonLoadingModel1 =
        createModel(context, () => PrimaryButtonLoadingModel());
    telTextFieldPhoneNumberModel =
        createModel(context, () => TelTextFieldModel());
    inputTextFieldPhoneNameModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonLoadingModel2 =
        createModel(context, () => PrimaryButtonLoadingModel());

    telTextFieldPhoneNumberModel.textControllerValidator =
        _formTextFieldValidator11;
    inputTextFieldPhoneNameModel.textControllerValidator =
        _formTextFieldValidator12;
  }

  void dispose() {
    textFieldBankNameFocusNode?.dispose();
    textFieldBankNameController?.dispose();

    textFieldAccountNumberFocusNode?.dispose();
    textFieldAccountNumberController?.dispose();

    textFieldAccountNameFocusNode?.dispose();
    textFieldAccountNameController?.dispose();

    primaryButtonLoadingModel1.dispose();
    textFieldProviderFocusNode?.dispose();
    textFieldProviderController?.dispose();

    textFieldCustomerNumberFocusNode?.dispose();
    textFieldCustomerNumberController?.dispose();

    textFieldCustomerNameFocusNode?.dispose();
    textFieldCustomerNameController?.dispose();

    telTextFieldPhoneNumberModel.dispose();
    inputTextFieldPhoneNameModel.dispose();
    primaryButtonLoadingModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator11(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z8cmkb9z' /* Phone number is required */,
      );
    }

    if (val.length < 11) {
      return FFLocalizations.of(context).getText(
        'a2l3ripn' /* Phone number must be 11 digits... */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        '67a1vpri' /* Phone number must be 11 digits... */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator12(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rjkl4u9c' /* Name is required */,
      );
    }

    if (val.length < 1) {
      return FFLocalizations.of(context).getText(
        'hkyk1p4r' /* Name cannot be empty */,
      );
    }

    return null;
  }
}
