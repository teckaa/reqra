import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'forget_password_widget.dart' show ForgetPasswordWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPasswordModel extends FlutterFlowModel<ForgetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AuthHeader component.
  late AuthHeaderModel authHeaderModel;
  // Model for EmailTextField component.
  late EmailTextFieldModel emailTextFieldModel;
  // Model for PrimaryButtonLoading-Forget.
  late PrimaryButtonLoadingModel primaryButtonLoadingForgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authHeaderModel = createModel(context, () => AuthHeaderModel());
    emailTextFieldModel = createModel(context, () => EmailTextFieldModel());
    primaryButtonLoadingForgetModel =
        createModel(context, () => PrimaryButtonLoadingModel());

    emailTextFieldModel.textControllerValidator = _formTextFieldValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    authHeaderModel.dispose();
    emailTextFieldModel.dispose();
    primaryButtonLoadingForgetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tdynm9ka' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }
}
