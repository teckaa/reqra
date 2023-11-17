import '/application/backend/d_w_plugins/bill_payments/components/list_of_bill_order_comp/list_of_bill_order_comp_widget.dart';
import '/application/backend/d_w_users/admin/components/update_user/update_user_widget.dart';
import '/application/backend/d_w_users/user/components/bank_details_comp/bank_details_comp_widget.dart';
import '/application/backend/d_w_users/user/fund_wallet/components/fund_user/fund_user_widget.dart';
import '/application/backend/d_w_users/user/fund_wallet/components/list_of_fundings_comp/list_of_fundings_comp_widget.dart';
import '/application/backend/external_api/flutterwave/components/list_of_flutterwave_currencies/list_of_flutterwave_currencies_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_list_of_details/shimmer_list_of_details_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'read_user_widget.dart' show ReadUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ReadUserModel extends FlutterFlowModel<ReadUserWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for ListOfBillOrderComp component.
  late ListOfBillOrderCompModel listOfBillOrderCompModel;
  // Model for BankDetailsComp component.
  late BankDetailsCompModel bankDetailsCompModel;
  // Stores action output result for [Bottom Sheet - ListOfFlutterwaveCurrencies] action in Container-Currency widget.
  String? getCurrencyName;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel2;
  // Model for ListOfFundingsComp component.
  late ListOfFundingsCompModel listOfFundingsCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    photoGridModel = createModel(context, () => PhotoGridModel());
    primaryRoundedButtonModel1 =
        createModel(context, () => PrimaryRoundedButtonModel());
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
    listOfBillOrderCompModel =
        createModel(context, () => ListOfBillOrderCompModel());
    bankDetailsCompModel = createModel(context, () => BankDetailsCompModel());
    primaryRoundedButtonModel2 =
        createModel(context, () => PrimaryRoundedButtonModel());
    listOfFundingsCompModel =
        createModel(context, () => ListOfFundingsCompModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    photoGridModel.dispose();
    primaryRoundedButtonModel1.dispose();
    tabBarController?.dispose();
    searchTextFieldModel.dispose();
    listOfBillOrderCompModel.dispose();
    bankDetailsCompModel.dispose();
    primaryRoundedButtonModel2.dispose();
    listOfFundingsCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
