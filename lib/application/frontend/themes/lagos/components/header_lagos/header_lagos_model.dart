import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/application/frontend/themes/lagos/components/mobile_dropdown_lagos/mobile_dropdown_lagos_widget.dart';
import '/application/frontend/themes/lagos/components/products_dropdown_lagos/products_dropdown_lagos_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'header_lagos_widget.dart' show HeaderLagosWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HeaderLagosModel extends FlutterFlowModel<HeaderLagosWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel1;
  // Model for AppRectangleLogo component.
  late AppRectangleLogoModel appRectangleLogoModel;
  // Model for MenuItem-Home.
  late MenuItemModel menuItemHomeModel;
  // Model for MenuItem-About.
  late MenuItemModel menuItemAboutModel;
  // Model for MenuItem-Products.
  late MenuItemModel menuItemProductsModel;
  // Model for MenuItem-Blog.
  late MenuItemModel menuItemBlogModel;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel2;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel3;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel1 =
        createModel(context, () => PrimaryRoundedButtonModel());
    appRectangleLogoModel = createModel(context, () => AppRectangleLogoModel());
    menuItemHomeModel = createModel(context, () => MenuItemModel());
    menuItemAboutModel = createModel(context, () => MenuItemModel());
    menuItemProductsModel = createModel(context, () => MenuItemModel());
    menuItemBlogModel = createModel(context, () => MenuItemModel());
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    primaryRoundedButtonModel2 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonModel3 =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonModel4 =
        createModel(context, () => PrimaryRoundedButtonModel());
  }

  void dispose() {
    primaryRoundedButtonModel1.dispose();
    appRectangleLogoModel.dispose();
    menuItemHomeModel.dispose();
    menuItemAboutModel.dispose();
    menuItemProductsModel.dispose();
    menuItemBlogModel.dispose();
    photoGridCoverModel.dispose();
    primaryRoundedButtonModel2.dispose();
    primaryRoundedButtonModel3.dispose();
    primaryRoundedButtonModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
