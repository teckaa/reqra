import '/application/components/countries_data_lists/list_of_countries_dial_code/list_of_countries_dial_code_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tel_text_field_with_dial_code_widget.dart'
    show TelTextFieldWithDialCodeWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TelTextFieldWithDialCodeModel
    extends FlutterFlowModel<TelTextFieldWithDialCodeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField-PhoneNumber widget.
  FocusNode? textFieldPhoneNumberFocusNode;
  TextEditingController? textFieldPhoneNumberController;
  String? Function(BuildContext, String?)?
      textFieldPhoneNumberControllerValidator;
  // Stores action output result for [Bottom Sheet - ListOfCountriesDialCode] action in Container-DialCode widget.
  String? countryInfoOutput;
  // State field(s) for TextField-DialCode widget.
  FocusNode? textFieldDialCodeFocusNode;
  TextEditingController? textFieldDialCodeController;
  String? Function(BuildContext, String?)? textFieldDialCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldPhoneNumberFocusNode?.dispose();
    textFieldPhoneNumberController?.dispose();

    textFieldDialCodeFocusNode?.dispose();
    textFieldDialCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
