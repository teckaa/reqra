import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/forms/dropdown_basic/dropdown_basic_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_two_line/shimmer_two_line_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'transfer_widget.dart' show TransferWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class TransferModel extends FlutterFlowModel<TransferWidget> {
  ///  Local state fields for this page.

  bool toggleOption = false;

  double? commission;

  double? tax;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for DropdownBasic-BankName.
  late DropdownBasicModel dropdownBasicBankNameModel;
  // State field(s) for TextField-AccountNumber widget.
  FocusNode? textFieldAccountNumberFocusNode;
  TextEditingController? textFieldAccountNumberController;
  final textFieldAccountNumberMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)?
      textFieldAccountNumberControllerValidator;
  // Stores action output result for [Backend Call - API (AccountResolve)] action in TextField-AccountNumber widget.
  ApiCallResponse? verifyBankapiResult;
  // State field(s) for TextField-AccountName widget.
  FocusNode? textFieldAccountNameFocusNode;
  TextEditingController? textFieldAccountNameController;
  String? Function(BuildContext, String?)?
      textFieldAccountNameControllerValidator;
  // Model for InputTextField component.
  late InputTextFieldModel inputTextFieldModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    dropdownBasicBankNameModel =
        createModel(context, () => DropdownBasicModel());
    inputTextFieldModel = createModel(context, () => InputTextFieldModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    dropdownBasicBankNameModel.dispose();
    textFieldAccountNumberFocusNode?.dispose();
    textFieldAccountNumberController?.dispose();

    textFieldAccountNameFocusNode?.dispose();
    textFieldAccountNameController?.dispose();

    inputTextFieldModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
