import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/menus/circle_menu_item/circle_menu_item_widget.dart';
import '/application/frontend/themes/abuja/components/mobile_dropdown_abuja/mobile_dropdown_abuja_widget.dart';
import '/application/frontend/themes/abuja/components/products_dropdown_abuja/products_dropdown_abuja_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'header_enugu_widget.dart' show HeaderEnuguWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HeaderEnuguModel extends FlutterFlowModel<HeaderEnuguWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AppRectangleLogo component.
  late AppRectangleLogoModel appRectangleLogoModel;
  // Model for CircleMenuItem-Home.
  late CircleMenuItemModel circleMenuItemHomeModel;
  // Model for CircleMenuItem-About.
  late CircleMenuItemModel circleMenuItemAboutModel;
  // Model for CircleMenuItem-Products.
  late CircleMenuItemModel circleMenuItemProductsModel;
  // Model for CircleMenuItem-Blog.
  late CircleMenuItemModel circleMenuItemBlogModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appRectangleLogoModel = createModel(context, () => AppRectangleLogoModel());
    circleMenuItemHomeModel = createModel(context, () => CircleMenuItemModel());
    circleMenuItemAboutModel =
        createModel(context, () => CircleMenuItemModel());
    circleMenuItemProductsModel =
        createModel(context, () => CircleMenuItemModel());
    circleMenuItemBlogModel = createModel(context, () => CircleMenuItemModel());
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
  }

  void dispose() {
    appRectangleLogoModel.dispose();
    circleMenuItemHomeModel.dispose();
    circleMenuItemAboutModel.dispose();
    circleMenuItemProductsModel.dispose();
    circleMenuItemBlogModel.dispose();
    primaryRoundedButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
