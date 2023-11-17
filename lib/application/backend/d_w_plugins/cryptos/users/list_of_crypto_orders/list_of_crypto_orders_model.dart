import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/cryptos/filter_crypto_order/filter_crypto_order_widget.dart';
import '/application/backend/d_w_plugins/cryptos/users/components/list_of_crypto_order_comp/list_of_crypto_order_comp_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_of_crypto_orders_widget.dart' show ListOfCryptoOrdersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ListOfCryptoOrdersModel
    extends FlutterFlowModel<ListOfCryptoOrdersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for ListOfCryptoOrderComp component.
  late ListOfCryptoOrderCompModel listOfCryptoOrderCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
    listOfCryptoOrderCompModel =
        createModel(context, () => ListOfCryptoOrderCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    searchTextFieldModel.dispose();
    listOfCryptoOrderCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
