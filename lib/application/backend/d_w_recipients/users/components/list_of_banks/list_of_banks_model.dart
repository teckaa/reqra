import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_banks_widget.dart' show ListOfBanksWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfBanksModel extends FlutterFlowModel<ListOfBanksWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SearchTextField-Search.
  late SearchTextFieldModel searchTextFieldSearchModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchTextFieldSearchModel =
        createModel(context, () => SearchTextFieldModel());
  }

  void dispose() {
    searchTextFieldSearchModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
