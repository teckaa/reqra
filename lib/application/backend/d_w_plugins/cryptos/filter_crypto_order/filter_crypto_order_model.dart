import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_crypto_order_widget.dart' show FilterCryptoOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterCryptoOrderModel extends FlutterFlowModel<FilterCryptoOrderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for OrderStatusChoiceChips widget.
  String? orderStatusChoiceChipsValue1;
  FormFieldController<List<String>>? orderStatusChoiceChipsValueController1;
  // State field(s) for OrderStatusChoiceChips widget.
  String? orderStatusChoiceChipsValue2;
  FormFieldController<List<String>>? orderStatusChoiceChipsValueController2;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
