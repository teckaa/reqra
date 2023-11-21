import '/application/backend/d_w_plugins/bill_payments/components/list_of_bill_order_comp/list_of_bill_order_comp_widget.dart';
import '/application/backend/d_w_settings/admin/adverts/users/list_of_ads/list_of_ads_widget.dart';
import '/application/backend/d_w_users/user/components/account_balance/account_balance_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/layouts/icon_square_box/icon_square_box_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_for_bill_user_widget.dart' show DashboardForBillUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardForBillUserModel
    extends FlutterFlowModel<DashboardForBillUserWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for AccountBalance component.
  late AccountBalanceModel accountBalanceModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;
  // Model for IconSquareBox-Airtime.
  late IconSquareBoxModel iconSquareBoxAirtimeModel;
  // Model for IconSquareBox-Data.
  late IconSquareBoxModel iconSquareBoxDataModel;
  // Model for IconSquareBox-CableTV.
  late IconSquareBoxModel iconSquareBoxCableTVModel;
  // Model for IconSquareBox-More.
  late IconSquareBoxModel iconSquareBoxMoreModel;
  // Model for ListOfAds component.
  late ListOfAdsModel listOfAdsModel;
  // Model for ListOfBillOrderComp component.
  late ListOfBillOrderCompModel listOfBillOrderCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    accountBalanceModel = createModel(context, () => AccountBalanceModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
    iconSquareBoxAirtimeModel =
        createModel(context, () => IconSquareBoxModel());
    iconSquareBoxDataModel = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxCableTVModel =
        createModel(context, () => IconSquareBoxModel());
    iconSquareBoxMoreModel = createModel(context, () => IconSquareBoxModel());
    listOfAdsModel = createModel(context, () => ListOfAdsModel());
    listOfBillOrderCompModel =
        createModel(context, () => ListOfBillOrderCompModel());
  }

  void dispose() {
    photoGridCoverModel.dispose();
    accountBalanceModel.dispose();
    primaryButtonModel1.dispose();
    primaryButtonModel2.dispose();
    iconSquareBoxAirtimeModel.dispose();
    iconSquareBoxDataModel.dispose();
    iconSquareBoxCableTVModel.dispose();
    iconSquareBoxMoreModel.dispose();
    listOfAdsModel.dispose();
    listOfBillOrderCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
