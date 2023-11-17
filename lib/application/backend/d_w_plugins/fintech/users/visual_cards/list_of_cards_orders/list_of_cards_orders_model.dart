import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/fintech/users/visual_cards/components/list_of_cards_order_comp/list_of_cards_order_comp_widget.dart';
import '/application/backend/d_w_users/admin/components/filter_users/filter_users_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_of_cards_orders_widget.dart' show ListOfCardsOrdersWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ListOfCardsOrdersModel extends FlutterFlowModel<ListOfCardsOrdersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for ListOfCardsOrderComp component.
  late ListOfCardsOrderCompModel listOfCardsOrderCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
    listOfCardsOrderCompModel =
        createModel(context, () => ListOfCardsOrderCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    searchTextFieldModel.dispose();
    listOfCardsOrderCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
