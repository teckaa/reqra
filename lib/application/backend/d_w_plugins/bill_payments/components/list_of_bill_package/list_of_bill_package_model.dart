import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'list_of_bill_package_widget.dart' show ListOfBillPackageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfBillPackageModel extends FlutterFlowModel<ListOfBillPackageWidget> {
  /// Query cache managers for this widget.

  final _billservicesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> billservices({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _billservicesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBillservicesCache() => _billservicesManager.clear();
  void clearBillservicesCacheKey(String? uniqueKey) =>
      _billservicesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearBillservicesCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
