import '/application/backend/d_w_plugins/bill_payments/components/list_of_bill_order_comp/list_of_bill_order_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_for_giftcard_user_widget.dart'
    show DashboardForGiftcardUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardForGiftcardUserModel
    extends FlutterFlowModel<DashboardForGiftcardUserWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for ListOfBillOrderComp component.
  late ListOfBillOrderCompModel listOfBillOrderCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    listOfBillOrderCompModel =
        createModel(context, () => ListOfBillOrderCompModel());
  }

  void dispose() {
    photoGridCoverModel.dispose();
    primaryButtonModel.dispose();
    listOfBillOrderCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
