import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_lists_of_cards/shimmer_lists_of_cards_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/application/frontend/themes/footer/footer_widget.dart';
import '/application/frontend/themes/header/header_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'single_widget.dart' show SingleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleModel extends FlutterFlowModel<SingleWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for PhotoGridWithDetails component.
  late PhotoGridWithDetailsModel photoGridWithDetailsModel;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
    headerModel = createModel(context, () => HeaderModel());
    photoGridWithDetailsModel =
        createModel(context, () => PhotoGridWithDetailsModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    primaryRoundedButtonModel.dispose();
    headerModel.dispose();
    photoGridWithDetailsModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
