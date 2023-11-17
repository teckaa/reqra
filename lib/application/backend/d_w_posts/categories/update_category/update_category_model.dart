import '/application/backend/d_w_posts/categories/category_composer/category_composer_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_category_widget.dart' show UpdateCategoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateCategoryModel extends FlutterFlowModel<UpdateCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for CategoryComposer component.
  late CategoryComposerModel categoryComposerModel;
  // Model for ModalFooterRow component.
  late ModalFooterRowModel modalFooterRowModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    categoryComposerModel = createModel(context, () => CategoryComposerModel());
    modalFooterRowModel = createModel(context, () => ModalFooterRowModel());

    categoryComposerModel.inputTextFieldCatNameModel.textControllerValidator =
        _formTextFieldValidator;
  }

  void dispose() {
    modalHeaderModel.dispose();
    categoryComposerModel.dispose();
    modalFooterRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u6ta2oyv' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }
}
