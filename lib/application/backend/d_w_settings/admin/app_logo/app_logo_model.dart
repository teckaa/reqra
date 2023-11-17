import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'app_logo_widget.dart' show AppLogoWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AppLogoModel extends FlutterFlowModel<AppLogoWidget> {
  ///  Local state fields for this page.

  bool lightRectangleLogoSaveButton = false;

  bool darkRectangleLogoSaveButton = false;

  bool lightSquareLogoSaveButton = false;

  bool darkSquareLogoSaveButton = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel1;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getLightImagePathForSquareLogo;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel1;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel2;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getLightImagePathForRectangleLogo;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel3;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel4;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getDarkImagePathForSquareLogo;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel5;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel6;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel4;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getDarkImagePathForRectangleLogo;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel7;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel8;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    photoGridModel1 = createModel(context, () => PhotoGridModel());
    primaryRoundedButtonLoadingModel1 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonLoadingModel2 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    photoGridModel2 = createModel(context, () => PhotoGridModel());
    primaryRoundedButtonLoadingModel3 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonLoadingModel4 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    photoGridModel3 = createModel(context, () => PhotoGridModel());
    primaryRoundedButtonLoadingModel5 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonLoadingModel6 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    photoGridModel4 = createModel(context, () => PhotoGridModel());
    primaryRoundedButtonLoadingModel7 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonLoadingModel8 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    photoGridModel1.dispose();
    primaryRoundedButtonLoadingModel1.dispose();
    primaryRoundedButtonLoadingModel2.dispose();
    photoGridModel2.dispose();
    primaryRoundedButtonLoadingModel3.dispose();
    primaryRoundedButtonLoadingModel4.dispose();
    photoGridModel3.dispose();
    primaryRoundedButtonLoadingModel5.dispose();
    primaryRoundedButtonLoadingModel6.dispose();
    photoGridModel4.dispose();
    primaryRoundedButtonLoadingModel7.dispose();
    primaryRoundedButtonLoadingModel8.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
