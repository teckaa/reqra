import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/fintech/users/visual_cards/components/credit_card/credit_card_widget.dart';
import '/application/backend/d_w_plugins/fintech/users/visual_cards/components/fund_card/fund_card_widget.dart';
import '/application/backend/d_w_plugins/fintech/users/visual_cards/components/list_of_cards_order_comp/list_of_cards_order_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/icons/copy_icon/copy_icon_widget.dart';
import '/application/components/modals/modal_confirm_2/modal_confirm2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'virtual_card_widget.dart' show VirtualCardWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VirtualCardModel extends FlutterFlowModel<VirtualCardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for CreditCard component.
  late CreditCardWidgetModel creditCardModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel3;
  // Model for CopyIcon component.
  late CopyIconModel copyIconModel1;
  // Model for CopyIcon component.
  late CopyIconModel copyIconModel2;
  // Model for CopyIcon component.
  late CopyIconModel copyIconModel3;
  // Model for ListOfCardsOrderComp component.
  late ListOfCardsOrderCompModel listOfCardsOrderCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    creditCardModel = createModel(context, () => CreditCardWidgetModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel3 = createModel(context, () => PrimaryButtonModel());
    copyIconModel1 = createModel(context, () => CopyIconModel());
    copyIconModel2 = createModel(context, () => CopyIconModel());
    copyIconModel3 = createModel(context, () => CopyIconModel());
    listOfCardsOrderCompModel =
        createModel(context, () => ListOfCardsOrderCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    creditCardModel.dispose();
    primaryButtonModel1.dispose();
    primaryButtonModel2.dispose();
    primaryButtonModel3.dispose();
    copyIconModel1.dispose();
    copyIconModel2.dispose();
    copyIconModel3.dispose();
    listOfCardsOrderCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
