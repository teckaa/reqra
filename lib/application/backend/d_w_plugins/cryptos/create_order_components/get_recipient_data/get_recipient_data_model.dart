import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'get_recipient_data_widget.dart' show GetRecipientDataWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GetRecipientDataModel extends FlutterFlowModel<GetRecipientDataWidget> {
  ///  Local state fields for this component.

  bool verifyBankDetailsError = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for InputTextField-Country.
  late InputTextFieldModel inputTextFieldCountryModel;
  // Model for InputTextField-AccountOwner.
  late InputTextFieldModel inputTextFieldAccountOwnerModel;
  // Model for InputTextField-BankName.
  late InputTextFieldModel inputTextFieldBankNameModel;
  // Model for InputTextField-AccountNumber.
  late InputTextFieldModel inputTextFieldAccountNumberModel;
  // Model for InputTextField-AccountName.
  late InputTextFieldModel inputTextFieldAccountNameModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputTextFieldCountryModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldAccountOwnerModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldBankNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldAccountNumberModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldAccountNameModel =
        createModel(context, () => InputTextFieldModel());
  }

  void dispose() {
    inputTextFieldCountryModel.dispose();
    inputTextFieldAccountOwnerModel.dispose();
    inputTextFieldBankNameModel.dispose();
    inputTextFieldAccountNumberModel.dispose();
    inputTextFieldAccountNameModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
