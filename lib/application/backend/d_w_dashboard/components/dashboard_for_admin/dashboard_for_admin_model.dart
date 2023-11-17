import '/application/backend/d_w_plugins/bill_payments/components/transaction_details/transaction_details_widget.dart';
import '/application/backend/d_w_users/admin/components/read_user/read_user_widget.dart';
import '/application/backend/external_api/flutterwave/components/list_of_flutterwave_currencies/list_of_flutterwave_currencies_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/layouts/photo_column_with_details/photo_column_with_details_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_amount/shimmer_amount_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_for_admin_widget.dart' show DashboardForAdminWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardForAdminModel extends FlutterFlowModel<DashboardForAdminWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - ListOfFlutterwaveCurrencies] action in Container-Currency widget.
  String? getCurrencyName;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel3 = createModel(context, () => PrimaryButtonModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    primaryButtonModel1.dispose();
    primaryButtonModel2.dispose();
    primaryButtonModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
