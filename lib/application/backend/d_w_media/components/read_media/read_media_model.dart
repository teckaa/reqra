import '/application/components/icons/copy_icon/copy_icon_widget.dart';
import '/application/components/icons/lunch_url_icon/lunch_url_icon_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_lists_of_cards/shimmer_lists_of_cards_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'read_media_widget.dart' show ReadMediaWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ReadMediaModel extends FlutterFlowModel<ReadMediaWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for CopyIcon component.
  late CopyIconModel copyIconModel;
  // Model for LunchUrlIcon component.
  late LunchUrlIconModel lunchUrlIconModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    copyIconModel = createModel(context, () => CopyIconModel());
    lunchUrlIconModel = createModel(context, () => LunchUrlIconModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    copyIconModel.dispose();
    lunchUrlIconModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
