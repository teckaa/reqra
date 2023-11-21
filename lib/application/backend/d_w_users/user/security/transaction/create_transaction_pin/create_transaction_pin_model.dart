import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/pin6_text_field/pin6_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'create_transaction_pin_widget.dart' show CreateTransactionPinWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTransactionPinModel
    extends FlutterFlowModel<CreateTransactionPinWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel1;
  // Model for Pin6TextField-CurrentPin.
  late Pin6TextFieldModel pin6TextFieldCurrentPinModel;
  // Model for Pin6TextField-ChangeNew.
  late Pin6TextFieldModel pin6TextFieldChangeNewModel;
  // Model for Pin6TextField-ChangeConfirm.
  late Pin6TextFieldModel pin6TextFieldChangeConfirmModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel1;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel2;
  // Model for Pin6TextField-CreatePin.
  late Pin6TextFieldModel pin6TextFieldCreatePinModel;
  // Model for Pin6TextField-CreateConfirm.
  late Pin6TextFieldModel pin6TextFieldCreateConfirmModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel1 =
        createModel(context, () => TitleWithBackButtonModel());
    pin6TextFieldCurrentPinModel =
        createModel(context, () => Pin6TextFieldModel());
    pin6TextFieldChangeNewModel =
        createModel(context, () => Pin6TextFieldModel());
    pin6TextFieldChangeConfirmModel =
        createModel(context, () => Pin6TextFieldModel());
    primaryButtonLoadingModel1 =
        createModel(context, () => PrimaryButtonLoadingModel());
    titleWithBackButtonModel2 =
        createModel(context, () => TitleWithBackButtonModel());
    pin6TextFieldCreatePinModel =
        createModel(context, () => Pin6TextFieldModel());
    pin6TextFieldCreateConfirmModel =
        createModel(context, () => Pin6TextFieldModel());
    primaryButtonLoadingModel2 =
        createModel(context, () => PrimaryButtonLoadingModel());

    pin6TextFieldCurrentPinModel.textControllerValidator =
        _formTextFieldValidator21;
    pin6TextFieldChangeNewModel.textControllerValidator =
        _formTextFieldValidator22;
    pin6TextFieldChangeConfirmModel.textControllerValidator =
        _formTextFieldValidator23;
    pin6TextFieldCreatePinModel.textControllerValidator =
        _formTextFieldValidator11;
    pin6TextFieldCreateConfirmModel.textControllerValidator =
        _formTextFieldValidator12;
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel1.dispose();
    pin6TextFieldCurrentPinModel.dispose();
    pin6TextFieldChangeNewModel.dispose();
    pin6TextFieldChangeConfirmModel.dispose();
    primaryButtonLoadingModel1.dispose();
    titleWithBackButtonModel2.dispose();
    pin6TextFieldCreatePinModel.dispose();
    pin6TextFieldCreateConfirmModel.dispose();
    primaryButtonLoadingModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator21(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm5qam720' /* Current is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 6) {
      return 'Maximum 6 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator22(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fnzjzu7g' /* Pin is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 6) {
      return FFLocalizations.of(context).getText(
        't0yeszie' /* Pin must be 6 digits */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator23(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3mhdctl6' /* Confirm pin is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 6) {
      return FFLocalizations.of(context).getText(
        '6kfu1jki' /* Confirm pin must be 6 digits */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator11(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qumiljzf' /* Pin is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '35pn9kmc' /* Pin must be 6 digits */,
      );
    }
    if (val.length > 6) {
      return FFLocalizations.of(context).getText(
        't9teiqys' /* Pin must be 6 digits */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator12(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'af1kw8lv' /* Confirm pin is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'vmut8b3x' /* Confirm pin must be 6 digits */,
      );
    }
    if (val.length > 6) {
      return FFLocalizations.of(context).getText(
        '8e4m1q12' /* Confirm pin must be 6 digits */,
      );
    }

    return null;
  }
}
