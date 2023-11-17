import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_drop_down_widget.dart' show ModalDropDownWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalDropDownModel extends FlutterFlowModel<ModalDropDownWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PhotoGridWithDetails component.
  late PhotoGridWithDetailsModel photoGridWithDetailsModel;
  // Model for MenuItem-EditProfile.
  late MenuItemModel menuItemEditProfileModel;
  // Model for MenuItem-Password.
  late MenuItemModel menuItemPasswordModel;
  // Model for MenuItem-Notifications.
  late MenuItemModel menuItemNotificationsModel;
  // Model for MenuItem-Languages.
  late MenuItemModel menuItemLanguagesModel;
  // Model for MenuItem-Help.
  late MenuItemModel menuItemHelpModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoGridWithDetailsModel =
        createModel(context, () => PhotoGridWithDetailsModel());
    menuItemEditProfileModel = createModel(context, () => MenuItemModel());
    menuItemPasswordModel = createModel(context, () => MenuItemModel());
    menuItemNotificationsModel = createModel(context, () => MenuItemModel());
    menuItemLanguagesModel = createModel(context, () => MenuItemModel());
    menuItemHelpModel = createModel(context, () => MenuItemModel());
  }

  void dispose() {
    photoGridWithDetailsModel.dispose();
    menuItemEditProfileModel.dispose();
    menuItemPasswordModel.dispose();
    menuItemNotificationsModel.dispose();
    menuItemLanguagesModel.dispose();
    menuItemHelpModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
