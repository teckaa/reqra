import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'register_sms_widget.dart' show RegisterSmsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterSmsModel extends FlutterFlowModel<RegisterSmsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AuthHeader component.
  late AuthHeaderModel authHeaderModel;
  // Model for TextFieldWithLabel-Firstname.
  late InputTextFieldModel textFieldWithLabelFirstnameModel;
  // Model for TextFieldWithLabel-Lastname.
  late InputTextFieldModel textFieldWithLabelLastnameModel;
  // Model for CountryTextFieldWithFlag component.
  late CountryTextFieldWithFlagModel countryTextFieldWithFlagModel;
  // Model for TelTextFieldWithDialCode component.
  late TelTextFieldWithDialCodeModel telTextFieldWithDialCodeModel;
  // Model for PasswordTextField-Password.
  late PasswordTextFieldModel passwordTextFieldPasswordModel;
  // Model for TextFieldWithLabel-ConfirmPassword.
  late PasswordTextFieldModel textFieldWithLabelConfirmPasswordModel;
  // Model for PrimaryButtonLoading-Register.
  late PrimaryButtonLoadingModel primaryButtonLoadingRegisterModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authHeaderModel = createModel(context, () => AuthHeaderModel());
    textFieldWithLabelFirstnameModel =
        createModel(context, () => InputTextFieldModel());
    textFieldWithLabelLastnameModel =
        createModel(context, () => InputTextFieldModel());
    countryTextFieldWithFlagModel =
        createModel(context, () => CountryTextFieldWithFlagModel());
    telTextFieldWithDialCodeModel =
        createModel(context, () => TelTextFieldWithDialCodeModel());
    passwordTextFieldPasswordModel =
        createModel(context, () => PasswordTextFieldModel());
    textFieldWithLabelConfirmPasswordModel =
        createModel(context, () => PasswordTextFieldModel());
    primaryButtonLoadingRegisterModel =
        createModel(context, () => PrimaryButtonLoadingModel());

    textFieldWithLabelFirstnameModel.textControllerValidator =
        _formTextFieldValidator1;
    textFieldWithLabelLastnameModel.textControllerValidator =
        _formTextFieldValidator2;
  }

  void dispose() {
    unfocusNode.dispose();
    authHeaderModel.dispose();
    textFieldWithLabelFirstnameModel.dispose();
    textFieldWithLabelLastnameModel.dispose();
    countryTextFieldWithFlagModel.dispose();
    telTextFieldWithDialCodeModel.dispose();
    passwordTextFieldPasswordModel.dispose();
    textFieldWithLabelConfirmPasswordModel.dispose();
    primaryButtonLoadingRegisterModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ptxjo6bj' /* Firstname is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7kwe6ysg' /* Lastname is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }
}
