import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/color_text_field/color_text_field_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'create_email_templates_widget.dart' show CreateEmailTemplatesWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateEmailTemplatesModel
    extends FlutterFlowModel<CreateEmailTemplatesWidget> {
  ///  Local state fields for this component.

  String? layoutType = '';

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel1;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel2;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel3;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel1;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getLogoPath;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel4;
  // Model for InputTextField-FromName.
  late InputTextFieldModel inputTextFieldFromNameModel;
  // Model for InputTextField-FromEmail.
  late InputTextFieldModel inputTextFieldFromEmailModel;
  // Model for InputTextField-AdditionalText.
  late InputTextFieldModel inputTextFieldAdditionalTextModel;
  // Model for InputTextArea-FooterText.
  late InputTextAreaModel inputTextAreaFooterTextModel;
  // Model for ColorTextField-BrandColor.
  late ColorTextFieldModel colorTextFieldBrandColorModel;
  // Model for ColorTextField-BgColor.
  late ColorTextFieldModel colorTextFieldBgColorModel;
  // Model for ColorTextField-ContentBgColor.
  late ColorTextFieldModel colorTextFieldContentBgColorModel;
  // Model for ColorTextField-ContentTextColor.
  late ColorTextFieldModel colorTextFieldContentTextColorModel;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel2;
  // State field(s) for TextField-Content widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentController;
  String? Function(BuildContext, String?)? textFieldContentControllerValidator;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel3;
  // Model for InputTextField-TemplateName.
  late InputTextFieldModel inputTextFieldTemplateNameModel;
  // Model for InputTextField-SubjectLine.
  late InputTextFieldModel inputTextFieldSubjectLineModel;
  // Model for InputTextField-PreviewText.
  late InputTextFieldModel inputTextFieldPreviewTextModel;
  // State field(s) for DropDown-Type widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for DropDown-Recipients widget.
  String? dropDownRecipientsValue;
  FormFieldController<String>? dropDownRecipientsValueController;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    primaryRoundedButtonLoadingModel1 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonLoadingModel2 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonLoadingModel3 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    photoGridModel1 = createModel(context, () => PhotoGridModel());
    primaryRoundedButtonLoadingModel4 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    inputTextFieldFromNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldFromEmailModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldAdditionalTextModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaFooterTextModel =
        createModel(context, () => InputTextAreaModel());
    colorTextFieldBrandColorModel =
        createModel(context, () => ColorTextFieldModel());
    colorTextFieldBgColorModel =
        createModel(context, () => ColorTextFieldModel());
    colorTextFieldContentBgColorModel =
        createModel(context, () => ColorTextFieldModel());
    colorTextFieldContentTextColorModel =
        createModel(context, () => ColorTextFieldModel());
    photoGridModel2 = createModel(context, () => PhotoGridModel());
    photoGridModel3 = createModel(context, () => PhotoGridModel());
    inputTextFieldTemplateNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldSubjectLineModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldPreviewTextModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());

    inputTextFieldFromNameModel.textControllerValidator =
        _formTextFieldValidator21;
    inputTextFieldFromEmailModel.textControllerValidator =
        _formTextFieldValidator22;
    inputTextFieldTemplateNameModel.textControllerValidator =
        _formTextFieldValidator11;
    inputTextFieldSubjectLineModel.textControllerValidator =
        _formTextFieldValidator12;
    inputTextFieldPreviewTextModel.textControllerValidator =
        _formTextFieldValidator13;
  }

  void dispose() {
    modalHeaderModel.dispose();
    primaryRoundedButtonLoadingModel1.dispose();
    primaryRoundedButtonLoadingModel2.dispose();
    primaryRoundedButtonLoadingModel3.dispose();
    photoGridModel1.dispose();
    primaryRoundedButtonLoadingModel4.dispose();
    inputTextFieldFromNameModel.dispose();
    inputTextFieldFromEmailModel.dispose();
    inputTextFieldAdditionalTextModel.dispose();
    inputTextAreaFooterTextModel.dispose();
    colorTextFieldBrandColorModel.dispose();
    colorTextFieldBgColorModel.dispose();
    colorTextFieldContentBgColorModel.dispose();
    colorTextFieldContentTextColorModel.dispose();
    photoGridModel2.dispose();
    textFieldContentFocusNode?.dispose();
    textFieldContentController?.dispose();

    photoGridModel3.dispose();
    inputTextFieldTemplateNameModel.dispose();
    inputTextFieldSubjectLineModel.dispose();
    inputTextFieldPreviewTextModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator21(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e6qfejs9' /* Sender name is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator22(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bh4udkum' /* Sender Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  String? _formTextFieldValidator11(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'grjm4xf0' /* Template name is required */,
      );
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator12(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vjy5jlkl' /* Subject link is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator13(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1uh27saj' /* Preview text is required */,
      );
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }
}
