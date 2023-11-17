import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/url_text_field/url_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'create_link_widget.dart' show CreateLinkWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateLinkModel extends FlutterFlowModel<CreateLinkWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for Switch-Link widget.
  bool? switchLinkValue;
  // Model for InputTextField-StoreName.
  late InputTextFieldModel inputTextFieldStoreNameModel;
  // Model for InputTextArea-StoreDesc.
  late InputTextAreaModel inputTextAreaStoreDescModel;
  // Model for UrlTextField component.
  late UrlTextFieldModel urlTextFieldModel;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getImageData;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    inputTextFieldStoreNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaStoreDescModel =
        createModel(context, () => InputTextAreaModel());
    urlTextFieldModel = createModel(context, () => UrlTextFieldModel());
    photoGridModel = createModel(context, () => PhotoGridModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    inputTextFieldStoreNameModel.dispose();
    inputTextAreaStoreDescModel.dispose();
    urlTextFieldModel.dispose();
    photoGridModel.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
