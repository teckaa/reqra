import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/fintech/users/confirm_transfer_details/confirm_transfer_details_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transfer_amount_widget.dart' show TransferAmountWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransferAmountModel extends FlutterFlowModel<TransferAmountWidget> {
  ///  Local state fields for this page.

  int? amount;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Model for RightSidedAmountTextField component.
  late RightSidedAmountTextFieldModel rightSidedAmountTextFieldModel;
  // Model for InputTextField component.
  late InputTextFieldModel inputTextFieldModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    rightSidedAmountTextFieldModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    inputTextFieldModel = createModel(context, () => InputTextFieldModel());

    rightSidedAmountTextFieldModel.textControllerValidator =
        _formTextFieldValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    photoGridCoverModel.dispose();
    rightSidedAmountTextFieldModel.dispose();
    inputTextFieldModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9hyfdnfp' /* Amount is required */,
      );
    }

    return null;
  }
}
