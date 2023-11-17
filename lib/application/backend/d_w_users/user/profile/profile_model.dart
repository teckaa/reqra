import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/menus/sidebar_menu_item/sidebar_menu_item_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel1;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel2;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel3;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel4;
  // Model for SidebarMenuItem component.
  late SidebarMenuItemModel sidebarMenuItemModel5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    sidebarMenuItemModel1 = createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemModel2 = createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemModel3 = createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemModel4 = createModel(context, () => SidebarMenuItemModel());
    sidebarMenuItemModel5 = createModel(context, () => SidebarMenuItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    photoGridCoverModel.dispose();
    sidebarMenuItemModel1.dispose();
    sidebarMenuItemModel2.dispose();
    sidebarMenuItemModel3.dispose();
    sidebarMenuItemModel4.dispose();
    sidebarMenuItemModel5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
