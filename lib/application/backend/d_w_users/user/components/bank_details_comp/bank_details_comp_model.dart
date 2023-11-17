import '/application/components/icons/copy_icon/copy_icon_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bank_details_comp_widget.dart' show BankDetailsCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BankDetailsCompModel extends FlutterFlowModel<BankDetailsCompWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CopyIcon component.
  late CopyIconModel copyIconModel1;
  // Model for CopyIcon component.
  late CopyIconModel copyIconModel2;
  // Model for CopyIcon component.
  late CopyIconModel copyIconModel3;
  // Model for CopyIcon component.
  late CopyIconModel copyIconModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    copyIconModel1 = createModel(context, () => CopyIconModel());
    copyIconModel2 = createModel(context, () => CopyIconModel());
    copyIconModel3 = createModel(context, () => CopyIconModel());
    copyIconModel4 = createModel(context, () => CopyIconModel());
  }

  void dispose() {
    copyIconModel1.dispose();
    copyIconModel2.dispose();
    copyIconModel3.dispose();
    copyIconModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
