import '/application/components/countries_data_lists/list_of_countries/list_of_countries_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'country_text_field_with_flag_widget.dart'
    show CountryTextFieldWithFlagWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CountryTextFieldWithFlagModel
    extends FlutterFlowModel<CountryTextFieldWithFlagWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - ListOfCountries] action in Container widget.
  dynamic? countryNameOutput;
  // State field(s) for TextField-Country widget.
  FocusNode? textFieldCountryFocusNode;
  TextEditingController? textFieldCountryController;
  String? Function(BuildContext, String?)? textFieldCountryControllerValidator;
  // State field(s) for TextField-IsoCode widget.
  FocusNode? textFieldIsoCodeFocusNode;
  TextEditingController? textFieldIsoCodeController;
  String? Function(BuildContext, String?)? textFieldIsoCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldCountryFocusNode?.dispose();
    textFieldCountryController?.dispose();

    textFieldIsoCodeFocusNode?.dispose();
    textFieldIsoCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
