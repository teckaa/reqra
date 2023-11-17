import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field/tel_text_field_widget.dart';
import '/application/frontend/themes/footer/footer_widget.dart';
import '/application/frontend/themes/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'contact_widget.dart' show ContactWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactModel extends FlutterFlowModel<ContactWidget> {
  ///  Local state fields for this page.

  bool? toggleState = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for InputTextField-Fullname.
  late InputTextFieldModel inputTextFieldFullnameModel;
  // Model for EmailTextField-Email.
  late EmailTextFieldModel emailTextFieldEmailModel;
  // Model for TelTextField-PhoneNumber.
  late TelTextFieldModel telTextFieldPhoneNumberModel;
  // Model for InputTextField-Subject.
  late InputTextFieldModel inputTextFieldSubjectModel;
  // Model for InputTextArea-Message.
  late InputTextAreaModel inputTextAreaMessageModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    inputTextFieldFullnameModel =
        createModel(context, () => InputTextFieldModel());
    emailTextFieldEmailModel =
        createModel(context, () => EmailTextFieldModel());
    telTextFieldPhoneNumberModel =
        createModel(context, () => TelTextFieldModel());
    inputTextFieldSubjectModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaMessageModel =
        createModel(context, () => InputTextAreaModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    inputTextFieldFullnameModel.dispose();
    emailTextFieldEmailModel.dispose();
    telTextFieldPhoneNumberModel.dispose();
    inputTextFieldSubjectModel.dispose();
    inputTextAreaMessageModel.dispose();
    primaryButtonModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
