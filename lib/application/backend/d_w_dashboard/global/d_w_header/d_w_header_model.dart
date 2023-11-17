import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/modals/modal_drop_down/modal_drop_down_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'd_w_header_widget.dart' show DWHeaderWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DWHeaderModel extends FlutterFlowModel<DWHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
  }

  void dispose() {
    photoGridCoverModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
