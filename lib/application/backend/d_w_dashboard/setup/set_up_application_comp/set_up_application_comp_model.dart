import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/currency_text_field/currency_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'set_up_application_comp_widget.dart' show SetUpApplicationCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetUpApplicationCompModel
    extends FlutterFlowModel<SetUpApplicationCompWidget> {
  ///  Local state fields for this component.

  String? setupStep = 'Set Up';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for InputTextField-AppName.
  late InputTextFieldModel inputTextFieldAppNameModel;
  // Model for InputTextField-AppEmail.
  late InputTextFieldModel inputTextFieldAppEmailModel;
  // Model for CountryTextFieldWithFlag-AppCountry.
  late CountryTextFieldWithFlagModel countryTextFieldWithFlagAppCountryModel;
  // Model for CurrencyTextField-AppCurrency.
  late CurrencyTextFieldModel currencyTextFieldAppCurrencyModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel1;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel2;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputTextFieldAppNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldAppEmailModel =
        createModel(context, () => InputTextFieldModel());
    countryTextFieldWithFlagAppCountryModel =
        createModel(context, () => CountryTextFieldWithFlagModel());
    currencyTextFieldAppCurrencyModel =
        createModel(context, () => CurrencyTextFieldModel());
    primaryRoundedButtonModel1 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonLoadingModel =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonModel2 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonModel3 =
        createModel(context, () => PrimaryRoundedButtonModel());

    inputTextFieldAppNameModel.textControllerValidator =
        _formTextFieldValidator1;
    inputTextFieldAppEmailModel.textControllerValidator =
        _formTextFieldValidator2;
  }

  void dispose() {
    inputTextFieldAppNameModel.dispose();
    inputTextFieldAppEmailModel.dispose();
    countryTextFieldWithFlagAppCountryModel.dispose();
    currencyTextFieldAppCurrencyModel.dispose();
    primaryRoundedButtonModel1.dispose();
    primaryRoundedButtonLoadingModel.dispose();
    primaryRoundedButtonModel2.dispose();
    primaryRoundedButtonModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'aotvaoe7' /* Your Name is required */,
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
        '23scu6d1' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }
}
