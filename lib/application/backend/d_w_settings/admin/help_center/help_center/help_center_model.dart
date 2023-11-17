import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/backend/d_w_settings/admin/help_center/components/help_center_live_chat/help_center_live_chat_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/menus/sidebar_menu_item/sidebar_menu_item_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'help_center_widget.dart' show HelpCenterWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HelpCenterModel extends FlutterFlowModel<HelpCenterWidget> {
  ///  Local state fields for this page.

  bool? editLayout = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel1;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel2;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel3;
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getLogoPath;
  // Model for InputTextField-Title.
  late InputTextFieldModel inputTextFieldTitleModel;
  // Model for InputTextArea-Desc.
  late InputTextAreaModel inputTextAreaDescModel;
  // Model for InputTextField-PhoneNumber.
  late InputTextFieldModel inputTextFieldPhoneNumberModel;
  // Model for EmailTextField-Email.
  late EmailTextFieldModel emailTextFieldEmailModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    sidebarMenuItemModel1 = createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemModel2 = createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemModel3 = createModel(context, () => SidebarMenuItemModel());
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    photoGridModel = createModel(context, () => PhotoGridModel());
    inputTextFieldTitleModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaDescModel = createModel(context, () => InputTextAreaModel());
    inputTextFieldPhoneNumberModel =
        createModel(context, () => InputTextFieldModel());
    emailTextFieldEmailModel =
        createModel(context, () => EmailTextFieldModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    primaryRoundedButtonModel.dispose();
    photoGridCoverModel.dispose();
    sidebarMenuItemModel1.dispose();
    sidebarMenuItemModel2.dispose();
    sidebarMenuItemModel3.dispose();
    modalHeaderModel.dispose();
    photoGridModel.dispose();
    inputTextFieldTitleModel.dispose();
    inputTextAreaDescModel.dispose();
    inputTextFieldPhoneNumberModel.dispose();
    emailTextFieldEmailModel.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
