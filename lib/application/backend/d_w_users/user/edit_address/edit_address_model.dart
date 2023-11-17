import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'edit_address_widget.dart' show EditAddressWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAddressModel extends FlutterFlowModel<EditAddressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for InputTextField-Apt.
  late InputTextFieldModel inputTextFieldAptModel;
  // Model for InputTextField-Street.
  late InputTextFieldModel inputTextFieldStreetModel;
  // Model for InputTextField-Zipcode.
  late InputTextFieldModel inputTextFieldZipcodeModel;
  // Model for InputTextField-City.
  late InputTextFieldModel inputTextFieldCityModel;
  // Model for InputTextField-State.
  late InputTextFieldModel inputTextFieldStateModel;
  // Model for CountryTextFieldWithFlag component.
  late CountryTextFieldWithFlagModel countryTextFieldWithFlagModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    inputTextFieldAptModel = createModel(context, () => InputTextFieldModel());
    inputTextFieldStreetModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldZipcodeModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldCityModel = createModel(context, () => InputTextFieldModel());
    inputTextFieldStateModel =
        createModel(context, () => InputTextFieldModel());
    countryTextFieldWithFlagModel =
        createModel(context, () => CountryTextFieldWithFlagModel());
    primaryButtonLoadingSaveModel =
        createModel(context, () => PrimaryButtonLoadingModel());

    inputTextFieldStreetModel.textControllerValidator =
        _formTextFieldValidator1;
    inputTextFieldZipcodeModel.textControllerValidator =
        _formTextFieldValidator2;
    inputTextFieldCityModel.textControllerValidator = _formTextFieldValidator3;
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    inputTextFieldAptModel.dispose();
    inputTextFieldStreetModel.dispose();
    inputTextFieldZipcodeModel.dispose();
    inputTextFieldCityModel.dispose();
    inputTextFieldStateModel.dispose();
    countryTextFieldWithFlagModel.dispose();
    primaryButtonLoadingSaveModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r165mkhp' /* Street is required */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o9994z7u' /* Zipcode is required */,
      );
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0672gyvh' /* City is required */,
      );
    }

    return null;
  }
}
