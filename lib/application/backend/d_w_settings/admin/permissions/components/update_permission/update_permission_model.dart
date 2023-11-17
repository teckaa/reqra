import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_permission_widget.dart' show UpdatePermissionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdatePermissionModel extends FlutterFlowModel<UpdatePermissionWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for InputTextField-PermissionName.
  late InputTextFieldModel inputTextFieldPermissionNameModel;
  // Model for InputTextArea-PermissionDesc.
  late InputTextAreaModel inputTextAreaPermissionDescModel;
  // Model for ModalFooterColumn component.
  late ModalFooterColumnModel modalFooterColumnModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputTextFieldPermissionNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaPermissionDescModel =
        createModel(context, () => InputTextAreaModel());
    modalFooterColumnModel =
        createModel(context, () => ModalFooterColumnModel());

    inputTextFieldPermissionNameModel.textControllerValidator =
        _formTextFieldValidator1;
    inputTextAreaPermissionDescModel.textControllerValidator =
        _formTextFieldValidator2;
  }

  void dispose() {
    inputTextFieldPermissionNameModel.dispose();
    inputTextAreaPermissionDescModel.dispose();
    modalFooterColumnModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6bupn4nn' /* Please enter the name of the r... */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gvbubnaz' /* Please enter the description o... */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }
}
