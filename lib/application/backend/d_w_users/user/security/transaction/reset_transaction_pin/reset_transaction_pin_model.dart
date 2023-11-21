import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/pin6_text_field/pin6_text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'reset_transaction_pin_widget.dart' show ResetTransactionPinWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetTransactionPinModel
    extends FlutterFlowModel<ResetTransactionPinWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for Pin6TextField component.
  late Pin6TextFieldModel pin6TextFieldModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    pin6TextFieldModel = createModel(context, () => Pin6TextFieldModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    pin6TextFieldModel.dispose();
    primaryButtonLoadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
