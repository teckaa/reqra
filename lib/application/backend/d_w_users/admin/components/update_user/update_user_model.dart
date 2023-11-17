import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/dropdown_basic/dropdown_basic_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_list_of_details/shimmer_list_of_details_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_user_widget.dart' show UpdateUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateUserModel extends FlutterFlowModel<UpdateUserWidget> {
  ///  Local state fields for this component.

  bool? showAdvance = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for InputTextField-Firstname.
  late InputTextFieldModel inputTextFieldFirstnameModel;
  // Model for InputTextField-Lastname.
  late InputTextFieldModel inputTextFieldLastnameModel;
  // Model for EmailTextField-Email.
  late EmailTextFieldModel emailTextFieldEmailModel;
  // Model for TelTextFieldWithDialCode component.
  late TelTextFieldWithDialCodeModel telTextFieldWithDialCodeModel;
  // State field(s) for RadioButton-Gender widget.
  FormFieldController<String>? radioButtonGenderValueController;
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
  // Model for DropdownBasic-Role.
  late DropdownBasicModel dropdownBasicRoleModel;
  // Model for ModalFooterRow component.
  late ModalFooterRowModel modalFooterRowModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    inputTextFieldFirstnameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldLastnameModel =
        createModel(context, () => InputTextFieldModel());
    emailTextFieldEmailModel =
        createModel(context, () => EmailTextFieldModel());
    telTextFieldWithDialCodeModel =
        createModel(context, () => TelTextFieldWithDialCodeModel());
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
    dropdownBasicRoleModel = createModel(context, () => DropdownBasicModel());
    modalFooterRowModel = createModel(context, () => ModalFooterRowModel());

    inputTextFieldFirstnameModel.textControllerValidator =
        _formTextFieldValidator1;
    inputTextFieldLastnameModel.textControllerValidator =
        _formTextFieldValidator2;
    emailTextFieldEmailModel.textControllerValidator = _formTextFieldValidator3;
  }

  void dispose() {
    modalHeaderModel.dispose();
    inputTextFieldFirstnameModel.dispose();
    inputTextFieldLastnameModel.dispose();
    emailTextFieldEmailModel.dispose();
    telTextFieldWithDialCodeModel.dispose();
    inputTextFieldAptModel.dispose();
    inputTextFieldStreetModel.dispose();
    inputTextFieldZipcodeModel.dispose();
    inputTextFieldCityModel.dispose();
    inputTextFieldStateModel.dispose();
    countryTextFieldWithFlagModel.dispose();
    dropdownBasicRoleModel.dispose();
    modalFooterRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '22k5vb9f' /* Firstname  is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ea54x08z' /* Lastname is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jptfhh74' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  String? get radioButtonGenderValue => radioButtonGenderValueController?.value;
}
