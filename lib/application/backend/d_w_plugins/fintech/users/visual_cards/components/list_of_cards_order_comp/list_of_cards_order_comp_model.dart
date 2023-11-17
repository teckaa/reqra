import '/application/backend/d_w_plugins/bill_payments/components/transaction_details/transaction_details_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_cards_order_comp_widget.dart' show ListOfCardsOrderCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ListOfCardsOrderCompModel
    extends FlutterFlowModel<ListOfCardsOrderCompWidget> {
  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
