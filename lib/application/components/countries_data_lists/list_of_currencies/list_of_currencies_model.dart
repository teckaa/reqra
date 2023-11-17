import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_currencies_widget.dart' show ListOfCurrenciesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ListOfCurrenciesModel extends FlutterFlowModel<ListOfCurrenciesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;
  List<String> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
  }

  void dispose() {
    searchTextFieldModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
