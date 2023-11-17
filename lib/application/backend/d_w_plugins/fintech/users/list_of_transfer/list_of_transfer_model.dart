import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/menus/menu_service_box/menu_service_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_of_transfer_widget.dart' show ListOfTransferWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfTransferModel extends FlutterFlowModel<ListOfTransferWidget> {
  ///  Local state fields for this page.

  bool? verifyBankDetailsError = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for MenuServiceBox-MyBank.
  late MenuServiceBoxModel menuServiceBoxMyBankModel;
  // Model for MenuServiceBox-OtheBanks.
  late MenuServiceBoxModel menuServiceBoxOtheBanksModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    menuServiceBoxMyBankModel =
        createModel(context, () => MenuServiceBoxModel());
    menuServiceBoxOtheBanksModel =
        createModel(context, () => MenuServiceBoxModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    menuServiceBoxMyBankModel.dispose();
    menuServiceBoxOtheBanksModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
