import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'updat_app_security_widget.dart' show UpdatAppSecurityWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdatAppSecurityModel extends FlutterFlowModel<UpdatAppSecurityWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for Switch-Security widget.
  bool? switchSecurityValue;
  // Model for InputTextArea component.
  late InputTextAreaModel inputTextAreaModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    inputTextAreaModel = createModel(context, () => InputTextAreaModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    inputTextAreaModel.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
