import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/providers/create_provider/create_provider_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/providers/list_of_providers_comp/list_of_providers_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_service_widget.dart' show CreateServiceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateServiceModel extends FlutterFlowModel<CreateServiceWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for InputTextField-ServiceName.
  late InputTextFieldModel inputTextFieldServiceNameModel;
  // Model for InputTextArea-ServiceDesc.
  late InputTextAreaModel inputTextAreaServiceDescModel;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    inputTextFieldServiceNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaServiceDescModel =
        createModel(context, () => InputTextAreaModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());

    inputTextFieldServiceNameModel.textControllerValidator =
        _formTextFieldValidator;
  }

  void dispose() {
    modalHeaderModel.dispose();
    inputTextFieldServiceNameModel.dispose();
    inputTextAreaServiceDescModel.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ycn7re4x' /* Name is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }
}
