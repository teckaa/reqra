import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'app_square_logo_widget.dart' show AppSquareLogoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppSquareLogoModel extends FlutterFlowModel<AppSquareLogoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoGridModel = createModel(context, () => PhotoGridModel());
  }

  void dispose() {
    photoGridModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
