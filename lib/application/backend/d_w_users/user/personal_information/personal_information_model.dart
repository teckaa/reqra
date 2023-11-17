import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'personal_information_widget.dart' show PersonalInformationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalInformationModel
    extends FlutterFlowModel<PersonalInformationWidget> {
  ///  Local state fields for this page.

  bool profilePhotoSaveButton = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel;
  // Model for InputTextField-Firstname.
  late InputTextFieldModel inputTextFieldFirstnameModel;
  // Model for InputTextField-Lastname.
  late InputTextFieldModel inputTextFieldLastnameModel;
  // Model for EmailTextField-Email.
  late EmailTextFieldModel emailTextFieldEmailModel;
  // Model for TelTextFieldWithDialCode component.
  late TelTextFieldWithDialCodeModel telTextFieldWithDialCodeModel;
  // State field(s) for RadioButton-Gender widget.
  FormFieldController<String>? radioButtonGenderValueController;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    primaryRoundedButtonLoadingModel =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    inputTextFieldFirstnameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldLastnameModel =
        createModel(context, () => InputTextFieldModel());
    emailTextFieldEmailModel =
        createModel(context, () => EmailTextFieldModel());
    telTextFieldWithDialCodeModel =
        createModel(context, () => TelTextFieldWithDialCodeModel());
    primaryButtonLoadingSaveModel =
        createModel(context, () => PrimaryButtonLoadingModel());

    inputTextFieldFirstnameModel.textControllerValidator =
        _formTextFieldValidator1;
    inputTextFieldLastnameModel.textControllerValidator =
        _formTextFieldValidator2;
    emailTextFieldEmailModel.textControllerValidator = _formTextFieldValidator3;
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    photoGridCoverModel.dispose();
    primaryRoundedButtonLoadingModel.dispose();
    inputTextFieldFirstnameModel.dispose();
    inputTextFieldLastnameModel.dispose();
    emailTextFieldEmailModel.dispose();
    telTextFieldWithDialCodeModel.dispose();
    primaryButtonLoadingSaveModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4l4ysc4m' /* Firstname  is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8aa4ixyp' /* Lastname is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'swa7ienu' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  String? get radioButtonGenderValue => radioButtonGenderValueController?.value;
}
