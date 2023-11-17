import '/application/backend/d_w_dashboard/components/dashboard_for_admin/dashboard_for_admin_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_bill_user/dashboard_for_bill_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_crypto_user/dashboard_for_crypto_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_e_commerce_user/dashboard_for_e_commerce_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_fintech_user/dashboard_for_fintech_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_giftcard_user/dashboard_for_giftcard_user_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_dashboard/setup/set_up_application_comp/set_up_application_comp_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/menus/circle_menu_item/circle_menu_item_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  String? dafaultDashboard = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard widget.
  int? dashboardAppInfo;
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for CircleMenuItem-Bill.
  late CircleMenuItemModel circleMenuItemBillModel;
  // Model for CircleMenuItem-Cryptos.
  late CircleMenuItemModel circleMenuItemCryptosModel;
  // Model for CircleMenuItem-GiftCards.
  late CircleMenuItemModel circleMenuItemGiftCardsModel;
  // Model for CircleMenuItem-Ecommerce.
  late CircleMenuItemModel circleMenuItemEcommerceModel;
  // Model for CircleMenuItem-Fintech.
  late CircleMenuItemModel circleMenuItemFintechModel;
  // Model for DashboardForAdmin component.
  late DashboardForAdminModel dashboardForAdminModel;
  // Model for DashboardForBillUser component.
  late DashboardForBillUserModel dashboardForBillUserModel1;
  // Model for DashboardForCryptoUser component.
  late DashboardForCryptoUserModel dashboardForCryptoUserModel;
  // Model for DashboardForGiftcardUser component.
  late DashboardForGiftcardUserModel dashboardForGiftcardUserModel;
  // Model for DashboardForECommerceUser component.
  late DashboardForECommerceUserModel dashboardForECommerceUserModel;
  // Model for DashboardForFintechUser component.
  late DashboardForFintechUserModel dashboardForFintechUserModel;
  // Model for DashboardForBillUser component.
  late DashboardForBillUserModel dashboardForBillUserModel2;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    circleMenuItemBillModel = createModel(context, () => CircleMenuItemModel());
    circleMenuItemCryptosModel =
        createModel(context, () => CircleMenuItemModel());
    circleMenuItemGiftCardsModel =
        createModel(context, () => CircleMenuItemModel());
    circleMenuItemEcommerceModel =
        createModel(context, () => CircleMenuItemModel());
    circleMenuItemFintechModel =
        createModel(context, () => CircleMenuItemModel());
    dashboardForAdminModel =
        createModel(context, () => DashboardForAdminModel());
    dashboardForBillUserModel1 =
        createModel(context, () => DashboardForBillUserModel());
    dashboardForCryptoUserModel =
        createModel(context, () => DashboardForCryptoUserModel());
    dashboardForGiftcardUserModel =
        createModel(context, () => DashboardForGiftcardUserModel());
    dashboardForECommerceUserModel =
        createModel(context, () => DashboardForECommerceUserModel());
    dashboardForFintechUserModel =
        createModel(context, () => DashboardForFintechUserModel());
    dashboardForBillUserModel2 =
        createModel(context, () => DashboardForBillUserModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    circleMenuItemBillModel.dispose();
    circleMenuItemCryptosModel.dispose();
    circleMenuItemGiftCardsModel.dispose();
    circleMenuItemEcommerceModel.dispose();
    circleMenuItemFintechModel.dispose();
    dashboardForAdminModel.dispose();
    dashboardForBillUserModel1.dispose();
    dashboardForCryptoUserModel.dispose();
    dashboardForGiftcardUserModel.dispose();
    dashboardForECommerceUserModel.dispose();
    dashboardForFintechUserModel.dispose();
    dashboardForBillUserModel2.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
