import '/application/backend/d_w_users/admin/components/read_user/read_user_widget.dart';
import '/application/backend/d_w_users/admin/components/update_user/update_user_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/pop_over_menu_item/pop_over_menu_item_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pop_over_edit_user_widget.dart' show PopOverEditUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PopOverEditUserModel extends FlutterFlowModel<PopOverEditUserWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PopMenuItem-View.
  late PopOverMenuItemModel popMenuItemViewModel;
  // Model for PopMenuItem-Edit.
  late PopOverMenuItemModel popMenuItemEditModel;
  // Model for PopMenuItem-CreateOrder.
  late PopOverMenuItemModel popMenuItemCreateOrderModel;
  // Model for PopMenuItem-CreateBeneficiary.
  late PopOverMenuItemModel popMenuItemCreateBeneficiaryModel;
  // Model for PopMenuItem-Suspend.
  late PopOverMenuItemModel popMenuItemSuspendModel;
  // Model for PopMenuItem-Activate.
  late PopOverMenuItemModel popMenuItemActivateModel;
  // Model for PopMenuItem-Delete.
  late PopOverMenuItemModel popMenuItemDeleteModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    popMenuItemViewModel = createModel(context, () => PopOverMenuItemModel());
    popMenuItemEditModel = createModel(context, () => PopOverMenuItemModel());
    popMenuItemCreateOrderModel =
        createModel(context, () => PopOverMenuItemModel());
    popMenuItemCreateBeneficiaryModel =
        createModel(context, () => PopOverMenuItemModel());
    popMenuItemSuspendModel =
        createModel(context, () => PopOverMenuItemModel());
    popMenuItemActivateModel =
        createModel(context, () => PopOverMenuItemModel());
    popMenuItemDeleteModel = createModel(context, () => PopOverMenuItemModel());
  }

  void dispose() {
    popMenuItemViewModel.dispose();
    popMenuItemEditModel.dispose();
    popMenuItemCreateOrderModel.dispose();
    popMenuItemCreateBeneficiaryModel.dispose();
    popMenuItemSuspendModel.dispose();
    popMenuItemActivateModel.dispose();
    popMenuItemDeleteModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
