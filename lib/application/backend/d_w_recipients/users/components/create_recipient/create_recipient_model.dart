import '/application/backend/d_w_recipients/users/components/create_recipien_comp/create_recipien_comp_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_recipient_widget.dart' show CreateRecipientWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRecipientModel extends FlutterFlowModel<CreateRecipientWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for CreateRecipienComp.
  late CreateRecipienCompModel createRecipienCompModel;
  // Stores action output result for [Firestore Query - Query a collection] action in CreateRecipienComp widget.
  DwRecipientsRecord? checkIfRecipientExist;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    createRecipienCompModel =
        createModel(context, () => CreateRecipienCompModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    createRecipienCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
