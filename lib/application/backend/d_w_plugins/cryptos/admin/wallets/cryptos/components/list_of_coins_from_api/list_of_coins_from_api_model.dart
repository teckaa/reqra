import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_coins_from_api_widget.dart' show ListOfCoinsFromApiWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfCoinsFromApiModel
    extends FlutterFlowModel<ListOfCoinsFromApiWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField-Search widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchController;
  String? Function(BuildContext, String?)? textFieldSearchControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldSearchFocusNode?.dispose();
    textFieldSearchController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
