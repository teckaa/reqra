import '/application/backend/d_w_plugins/cryptos/users/components/list_of_crypto_order_comp/list_of_crypto_order_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_account_balance/shimmer_account_balance_widget.dart';
import '/application/components/shimmers/shimmer_button/shimmer_button_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid_details/shimmer_photo_grid_details_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_for_crypto_user_widget.dart'
    show DashboardForCryptoUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardForCryptoUserModel
    extends FlutterFlowModel<DashboardForCryptoUserWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;
  // Model for ListOfCryptoOrderComp component.
  late ListOfCryptoOrderCompModel listOfCryptoOrderCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
    listOfCryptoOrderCompModel =
        createModel(context, () => ListOfCryptoOrderCompModel());
  }

  void dispose() {
    photoGridCoverModel.dispose();
    primaryButtonModel1.dispose();
    primaryButtonModel2.dispose();
    listOfCryptoOrderCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
