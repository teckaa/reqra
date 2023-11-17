import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_wallet_rate_widget.dart' show ListOfWalletRateWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfWalletRateModel extends FlutterFlowModel<ListOfWalletRateWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;

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
