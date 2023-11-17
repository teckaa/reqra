import '/application/backend/d_w_posts/components/post_composer/post_composer_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_post_widget.dart' show UpdatePostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdatePostModel extends FlutterFlowModel<UpdatePostWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PostComposer component.
  late PostComposerModel postComposerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    postComposerModel = createModel(context, () => PostComposerModel());
  }

  void dispose() {
    postComposerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
