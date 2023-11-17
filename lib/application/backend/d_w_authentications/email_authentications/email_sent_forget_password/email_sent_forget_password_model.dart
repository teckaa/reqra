import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'email_sent_forget_password_widget.dart'
    show EmailSentForgetPasswordWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailSentForgetPasswordModel
    extends FlutterFlowModel<EmailSentForgetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AuthHeader component.
  late AuthHeaderModel authHeaderModel;
  // Model for PrimaryButtonLoading-Forget.
  late PrimaryButtonLoadingModel primaryButtonLoadingForgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authHeaderModel = createModel(context, () => AuthHeaderModel());
    primaryButtonLoadingForgetModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    authHeaderModel.dispose();
    primaryButtonLoadingForgetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
