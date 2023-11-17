import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/icons/copy_icon/copy_icon_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'list_of_crypto_order_comp_widget.dart' show ListOfCryptoOrderCompWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfCryptoOrderCompModel
    extends FlutterFlowModel<ListOfCryptoOrderCompWidget> {
  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
