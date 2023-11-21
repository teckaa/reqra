import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for PasswordTextField-Current.
  late PasswordTextFieldModel passwordTextFieldCurrentModel;
  // Model for PasswordTextField-New.
  late PasswordTextFieldModel passwordTextFieldNewModel;
  // Model for PasswordTextField-ConfirmNew.
  late PasswordTextFieldModel passwordTextFieldConfirmNewModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    passwordTextFieldCurrentModel =
        createModel(context, () => PasswordTextFieldModel());
    passwordTextFieldNewModel =
        createModel(context, () => PasswordTextFieldModel());
    passwordTextFieldConfirmNewModel =
        createModel(context, () => PasswordTextFieldModel());
    primaryButtonLoadingSaveModel =
        createModel(context, () => PrimaryButtonLoadingModel());

    passwordTextFieldCurrentModel.textControllerValidator =
        _formTextFieldValidator1;
    passwordTextFieldNewModel.textControllerValidator =
        _formTextFieldValidator2;
    passwordTextFieldConfirmNewModel.textControllerValidator =
        _formTextFieldValidator3;
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    passwordTextFieldCurrentModel.dispose();
    passwordTextFieldNewModel.dispose();
    passwordTextFieldConfirmNewModel.dispose();
    primaryButtonLoadingSaveModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pd2v7wad' /* Current password is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gcr1o33o' /* New password is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w7ektosl' /* Confirm password is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }
}
