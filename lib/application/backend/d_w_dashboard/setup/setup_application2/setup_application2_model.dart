import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/currency_text_field/currency_text_field_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'setup_application2_widget.dart' show SetupApplication2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetupApplication2Model extends FlutterFlowModel<SetupApplication2Widget> {
  ///  Local state fields for this page.

  String? setupStep = 'Set Up';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel1;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel2;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel3;
  // Model for InputTextField-AppName.
  late InputTextFieldModel inputTextFieldAppNameModel;
  // Model for InputTextField-AppEmail.
  late InputTextFieldModel inputTextFieldAppEmailModel;
  // Model for CountryTextFieldWithFlag-AppCountry.
  late CountryTextFieldWithFlagModel countryTextFieldWithFlagAppCountryModel;
  // Model for CurrencyTextField-AppCurrency.
  late CurrencyTextFieldModel currencyTextFieldAppCurrencyModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel4;
  // Model for TextFieldWithLabel-Firstname.
  late InputTextFieldModel textFieldWithLabelFirstnameModel;
  // Model for TextFieldWithLabel-Lastname.
  late InputTextFieldModel textFieldWithLabelLastnameModel;
  // Model for EmailTextField-Email.
  late EmailTextFieldModel emailTextFieldEmailModel;
  // Model for PasswordTextField-Password.
  late PasswordTextFieldModel passwordTextFieldPasswordModel;
  // Model for TextFieldWithLabel-ConfirmPassword.
  late PasswordTextFieldModel textFieldWithLabelConfirmPasswordModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel5;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel6;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel7;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel1 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonModel2 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonModel3 =
        createModel(context, () => PrimaryRoundedButtonModel());
    inputTextFieldAppNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldAppEmailModel =
        createModel(context, () => InputTextFieldModel());
    countryTextFieldWithFlagAppCountryModel =
        createModel(context, () => CountryTextFieldWithFlagModel());
    currencyTextFieldAppCurrencyModel =
        createModel(context, () => CurrencyTextFieldModel());
    primaryRoundedButtonModel4 =
        createModel(context, () => PrimaryRoundedButtonModel());
    textFieldWithLabelFirstnameModel =
        createModel(context, () => InputTextFieldModel());
    textFieldWithLabelLastnameModel =
        createModel(context, () => InputTextFieldModel());
    emailTextFieldEmailModel =
        createModel(context, () => EmailTextFieldModel());
    passwordTextFieldPasswordModel =
        createModel(context, () => PasswordTextFieldModel());
    textFieldWithLabelConfirmPasswordModel =
        createModel(context, () => PasswordTextFieldModel());
    primaryRoundedButtonModel5 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonLoadingModel =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonModel6 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonModel7 =
        createModel(context, () => PrimaryRoundedButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    primaryRoundedButtonModel1.dispose();
    primaryRoundedButtonModel2.dispose();
    primaryRoundedButtonModel3.dispose();
    inputTextFieldAppNameModel.dispose();
    inputTextFieldAppEmailModel.dispose();
    countryTextFieldWithFlagAppCountryModel.dispose();
    currencyTextFieldAppCurrencyModel.dispose();
    primaryRoundedButtonModel4.dispose();
    textFieldWithLabelFirstnameModel.dispose();
    textFieldWithLabelLastnameModel.dispose();
    emailTextFieldEmailModel.dispose();
    passwordTextFieldPasswordModel.dispose();
    textFieldWithLabelConfirmPasswordModel.dispose();
    primaryRoundedButtonModel5.dispose();
    primaryRoundedButtonLoadingModel.dispose();
    primaryRoundedButtonModel6.dispose();
    primaryRoundedButtonModel7.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
