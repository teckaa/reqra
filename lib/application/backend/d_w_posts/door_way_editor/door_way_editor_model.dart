import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/layouts/icon_square_box/icon_square_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'door_way_editor_widget.dart' show DoorWayEditorWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoorWayEditorModel extends FlutterFlowModel<DoorWayEditorWidget> {
  ///  Local state fields for this page.

  int? editorWidth = 1240;

  int? editorHeight = 837;

  bool? toggleSidebar = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel1;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel2;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel3;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel4;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel5;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel6;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel7;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel8;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel9;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel10;
  // Model for IconSquareBox component.
  late IconSquareBoxModel iconSquareBoxModel11;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    iconSquareBoxModel1 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel2 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel3 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel4 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel5 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel6 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel7 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel8 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel9 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel10 = createModel(context, () => IconSquareBoxModel());
    iconSquareBoxModel11 = createModel(context, () => IconSquareBoxModel());
  }

  void dispose() {
    unfocusNode.dispose();
    primaryButtonLoadingModel.dispose();
    iconSquareBoxModel1.dispose();
    iconSquareBoxModel2.dispose();
    iconSquareBoxModel3.dispose();
    iconSquareBoxModel4.dispose();
    iconSquareBoxModel5.dispose();
    iconSquareBoxModel6.dispose();
    iconSquareBoxModel7.dispose();
    iconSquareBoxModel8.dispose();
    iconSquareBoxModel9.dispose();
    iconSquareBoxModel10.dispose();
    iconSquareBoxModel11.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
