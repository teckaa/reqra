import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'a_p_i_integration_widget.dart' show APIIntegrationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class APIIntegrationModel extends FlutterFlowModel<APIIntegrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown-EmailName widget.
  String? dropDownEmailNameValue;
  FormFieldController<String>? dropDownEmailNameValueController;
  // Model for InputTextField-EmailApi.
  late InputTextFieldModel inputTextFieldEmailApiModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel1;
  // State field(s) for DropDown-SmsName widget.
  String? dropDownSmsNameValue;
  FormFieldController<String>? dropDownSmsNameValueController;
  // Model for InputTextField-SmsApi.
  late InputTextFieldModel inputTextFieldSmsApiModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel2;
  // State field(s) for DropDown-LiveChatName widget.
  String? dropDownLiveChatNameValue;
  FormFieldController<String>? dropDownLiveChatNameValueController;
  // Model for InputTextField-LiveChatApi.
  late InputTextFieldModel inputTextFieldLiveChatApiModel;
  // State field(s) for SwitchListTile-Frontend widget.
  bool? switchListTileFrontendValue;
  // State field(s) for SwitchListTile-WebApp widget.
  bool? switchListTileWebAppValue;
  // State field(s) for SwitchListTile-MobileApp widget.
  bool? switchListTileMobileAppValue;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel3;
  // State field(s) for Switch-PexelsStatus widget.
  bool? switchPexelsStatusValue;
  // Model for InputTextField-PexelsApi.
  late InputTextFieldModel inputTextFieldPexelsApiModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel4;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    inputTextFieldEmailApiModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonLoadingSaveModel1 =
        createModel(context, () => PrimaryButtonLoadingModel());
    inputTextFieldSmsApiModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonLoadingSaveModel2 =
        createModel(context, () => PrimaryButtonLoadingModel());
    inputTextFieldLiveChatApiModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonLoadingSaveModel3 =
        createModel(context, () => PrimaryButtonLoadingModel());
    inputTextFieldPexelsApiModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonLoadingSaveModel4 =
        createModel(context, () => PrimaryButtonLoadingModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    tabBarController?.dispose();
    inputTextFieldEmailApiModel.dispose();
    primaryButtonLoadingSaveModel1.dispose();
    inputTextFieldSmsApiModel.dispose();
    primaryButtonLoadingSaveModel2.dispose();
    inputTextFieldLiveChatApiModel.dispose();
    primaryButtonLoadingSaveModel3.dispose();
    inputTextFieldPexelsApiModel.dispose();
    primaryButtonLoadingSaveModel4.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
