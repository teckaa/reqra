import '/application/backend/d_w_settings/admin/announcements/components/annonucement_composer/annonucement_composer_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_announcement_widget.dart' show UpdateAnnouncementWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateAnnouncementModel
    extends FlutterFlowModel<UpdateAnnouncementWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for AnnonucementComposer component.
  late AnnonucementComposerModel annonucementComposerModel;
  // Model for ModalFooterRow component.
  late ModalFooterRowModel modalFooterRowModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    annonucementComposerModel =
        createModel(context, () => AnnonucementComposerModel());
    modalFooterRowModel = createModel(context, () => ModalFooterRowModel());

    annonucementComposerModel.textFieldTitleControllerValidator =
        _formTextFieldValidator1;
    annonucementComposerModel.textFieldMessageControllerValidator =
        _formTextFieldValidator2;
  }

  void dispose() {
    modalHeaderModel.dispose();
    annonucementComposerModel.dispose();
    modalFooterRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wol3l7do' /* Title is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kh5s3bms' /* Message is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }
}
