import '/application/backend/d_w_recipients/users/components/list_of_banks/list_of_banks_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_recipient_comp_widget.dart' show CreateRecipientCompWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateRecipientCompModel
    extends FlutterFlowModel<CreateRecipientCompWidget> {
  ///  Local state fields for this component.

  bool verifyBankDetailsError = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown-Country widget.
  String? dropDownCountryValue;
  FormFieldController<String>? dropDownCountryValueController;
  // State field(s) for TextField-BankName widget.
  FocusNode? textFieldBankNameFocusNode;
  TextEditingController? textFieldBankNameController;
  String? Function(BuildContext, String?)? textFieldBankNameControllerValidator;
  String? _textFieldBankNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vc2o39y8' /*  Bank name is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for DropDown-AccountOwner widget.
  String? dropDownAccountOwnerValue;
  FormFieldController<String>? dropDownAccountOwnerValueController;
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
        'k49ev06h' /* Account Number is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (AccountResolve)] action in TextField-AccountNumber widget.
  ApiCallResponse? verifyBankapiResult;
  // State field(s) for TextField-AccountName widget.
  FocusNode? textFieldAccountNameFocusNode;
  TextEditingController? textFieldAccountNameController;
  String? Function(BuildContext, String?)?
      textFieldAccountNameControllerValidator;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldBankNameControllerValidator =
        _textFieldBankNameControllerValidator;
    textFieldAccountNumberControllerValidator =
        _textFieldAccountNumberControllerValidator;
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    textFieldBankNameFocusNode?.dispose();
    textFieldBankNameController?.dispose();

    textFieldAccountNumberFocusNode?.dispose();
    textFieldAccountNumberController?.dispose();

    textFieldAccountNameFocusNode?.dispose();
    textFieldAccountNameController?.dispose();

    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
