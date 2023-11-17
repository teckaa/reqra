import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/dropdown_searchable/dropdown_searchable_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_user_widget.dart' show CreateUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateUserModel extends FlutterFlowModel<CreateUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TextFieldWithLabel-Firstname.
  late InputTextFieldModel textFieldWithLabelFirstnameModel;
  // Model for TextFieldWithLabel-Lastname.
  late InputTextFieldModel textFieldWithLabelLastnameModel;
  // Model for DropdownSearchable-Country.
  late DropdownSearchableModel dropdownSearchableCountryModel;
  // Model for EmailTextField-Email.
  late EmailTextFieldModel emailTextFieldEmailModel;
  // Model for TelTextFieldWithDialCode component.
  late TelTextFieldWithDialCodeModel telTextFieldWithDialCodeModel;
  // Model for PasswordTextField-Password.
  late PasswordTextFieldModel passwordTextFieldPasswordModel;
  // Model for PrimaryButtonLoading-CreateUser.
  late PrimaryButtonLoadingModel primaryButtonLoadingCreateUserModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    textFieldWithLabelFirstnameModel =
        createModel(context, () => InputTextFieldModel());
    textFieldWithLabelLastnameModel =
        createModel(context, () => InputTextFieldModel());
    dropdownSearchableCountryModel =
        createModel(context, () => DropdownSearchableModel());
    emailTextFieldEmailModel =
        createModel(context, () => EmailTextFieldModel());
    telTextFieldWithDialCodeModel =
        createModel(context, () => TelTextFieldWithDialCodeModel());
    passwordTextFieldPasswordModel =
        createModel(context, () => PasswordTextFieldModel());
    primaryButtonLoadingCreateUserModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    noAccessErrorModel.dispose();
    dWHeaderModel.dispose();
    textFieldWithLabelFirstnameModel.dispose();
    textFieldWithLabelLastnameModel.dispose();
    dropdownSearchableCountryModel.dispose();
    emailTextFieldEmailModel.dispose();
    telTextFieldWithDialCodeModel.dispose();
    passwordTextFieldPasswordModel.dispose();
    primaryButtonLoadingCreateUserModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
