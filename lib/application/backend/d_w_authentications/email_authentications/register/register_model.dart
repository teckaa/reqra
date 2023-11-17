import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'register_widget.dart' show RegisterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
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
  // Model for EmailTextField-Email.
  late EmailTextFieldModel emailTextFieldEmailModel;
  // Model for PasswordTextField-Password.
  late PasswordTextFieldModel passwordTextFieldPasswordModel;
  // Model for TextFieldWithLabel-ConfirmPassword.
  late PasswordTextFieldModel textFieldWithLabelConfirmPasswordModel;
  // Model for PrimaryButtonLoading-Register.
  late PrimaryButtonLoadingModel primaryButtonLoadingRegisterModel;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryButtonLoading-Register widget.
  int? countUser;

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
    emailTextFieldEmailModel =
        createModel(context, () => EmailTextFieldModel());
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
    telTextFieldWithDialCodeModel.textFieldPhoneNumberControllerValidator =
        _formTextFieldValidator3;
    emailTextFieldEmailModel.textControllerValidator = _formTextFieldValidator4;
    passwordTextFieldPasswordModel.textControllerValidator =
        _formTextFieldValidator5;
    textFieldWithLabelConfirmPasswordModel.textControllerValidator =
        _formTextFieldValidator6;
  }

  void dispose() {
    unfocusNode.dispose();
    authHeaderModel.dispose();
    textFieldWithLabelFirstnameModel.dispose();
    textFieldWithLabelLastnameModel.dispose();
    countryTextFieldWithFlagModel.dispose();
    telTextFieldWithDialCodeModel.dispose();
    emailTextFieldEmailModel.dispose();
    passwordTextFieldPasswordModel.dispose();
    textFieldWithLabelConfirmPasswordModel.dispose();
    primaryButtonLoadingRegisterModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hjkocsgv' /* Firstname is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k8wrre2a' /* Lastname is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1omafuzw' /* Phone Number is required */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        '1ka4f81y' /* Your phone number must consist... */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        'vz0nz6ou' /* Your phone number must consist... */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator4(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3cs30fup' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  String? _formTextFieldValidator5(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ng8a566e' /* Password is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '79dmemel' /* Password must be at least 6 ch... */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'iwx5afg0' /* Password must not exceed 20 ch... */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator6(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ldj9abke' /* Confirm Password is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '4jthjtru' /* Confirm Password must be at le... */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        '4zomla87' /* Confirm Password must not exce... */,
      );
    }

    return null;
  }
}
