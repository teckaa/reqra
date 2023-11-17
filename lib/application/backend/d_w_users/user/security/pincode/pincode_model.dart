import '/application/components/layouts/photo_column_with_details/photo_column_with_details_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'pincode_widget.dart' show PincodeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PincodeModel extends FlutterFlowModel<PincodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PhotoColumnWithDetails component.
  late PhotoColumnWithDetailsModel photoColumnWithDetailsModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoColumnWithDetailsModel =
        createModel(context, () => PhotoColumnWithDetailsModel());
    pinCodeController = TextEditingController();
  }

  void dispose() {
    unfocusNode.dispose();
    photoColumnWithDetailsModel.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
