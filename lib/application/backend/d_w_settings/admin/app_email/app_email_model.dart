import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'app_email_widget.dart' show AppEmailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppEmailModel extends FlutterFlowModel<AppEmailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for EmailTextField-AppEmail.
  late EmailTextFieldModel emailTextFieldAppEmailModel;
  // Model for EmailTextField-AppAlert.
  late EmailTextFieldModel emailTextFieldAppAlertModel;
  // Model for EmailTextField-AppSupport.
  late EmailTextFieldModel emailTextFieldAppSupportModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    emailTextFieldAppEmailModel =
        createModel(context, () => EmailTextFieldModel());
    emailTextFieldAppAlertModel =
        createModel(context, () => EmailTextFieldModel());
    emailTextFieldAppSupportModel =
        createModel(context, () => EmailTextFieldModel());
    primaryButtonLoadingSaveModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    emailTextFieldAppEmailModel.dispose();
    emailTextFieldAppAlertModel.dispose();
    emailTextFieldAppSupportModel.dispose();
    primaryButtonLoadingSaveModel.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
