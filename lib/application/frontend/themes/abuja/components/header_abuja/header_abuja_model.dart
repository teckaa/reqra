import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/application/frontend/themes/abuja/components/mobile_dropdown_abuja/mobile_dropdown_abuja_widget.dart';
import '/application/frontend/themes/abuja/components/products_dropdown_abuja/products_dropdown_abuja_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'header_abuja_widget.dart' show HeaderAbujaWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HeaderAbujaModel extends FlutterFlowModel<HeaderAbujaWidget> {
  ///  State fields for stateful widgets in this component.

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
  // Model for MenuItem-Faq.
  late MenuItemModel menuItemFaqModel;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for PrimaryButton-LoginButton.
  late PrimaryButtonModel primaryButtonLoginButtonModel;
  // Model for PrimaryButton-GetStarted.
  late PrimaryButtonModel primaryButtonGetStartedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appRectangleLogoModel = createModel(context, () => AppRectangleLogoModel());
    menuItemHomeModel = createModel(context, () => MenuItemModel());
    menuItemAboutModel = createModel(context, () => MenuItemModel());
    menuItemProductsModel = createModel(context, () => MenuItemModel());
    menuItemBlogModel = createModel(context, () => MenuItemModel());
    menuItemFaqModel = createModel(context, () => MenuItemModel());
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    primaryButtonLoginButtonModel =
        createModel(context, () => PrimaryButtonModel());
    primaryButtonGetStartedModel =
        createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    appRectangleLogoModel.dispose();
    menuItemHomeModel.dispose();
    menuItemAboutModel.dispose();
    menuItemProductsModel.dispose();
    menuItemBlogModel.dispose();
    menuItemFaqModel.dispose();
    photoGridCoverModel.dispose();
    primaryButtonLoginButtonModel.dispose();
    primaryButtonGetStartedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
