import '/application/backend/d_w_recipients/users/components/create_recipien_comp/create_recipien_comp_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'update_contact_widget.dart' show UpdateContactWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateContactModel extends FlutterFlowModel<UpdateContactWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for CreateRecipienComp component.
  late CreateRecipienCompModel createRecipienCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    createRecipienCompModel =
        createModel(context, () => CreateRecipienCompModel());

    createRecipienCompModel.telTextFieldPhoneNumberModel
        .textControllerValidator = _formTextFieldValidator1;
    createRecipienCompModel.inputTextFieldPhoneNameModel
        .textControllerValidator = _formTextFieldValidator2;
  }

  void dispose() {
    modalHeaderModel.dispose();
    createRecipienCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '57vltj52' /* Phone number is required */,
      );
    }

    if (val.length < 11) {
      return FFLocalizations.of(context).getText(
        'aqt9lwfr' /* The phone number must be 11 di... */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jyt65rpd' /* Name is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }
}
