import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/menus/menu_service_box/menu_service_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_of_services_widget.dart' show ListOfServicesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfServicesModel extends FlutterFlowModel<ListOfServicesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for MenuServiceBox-Airtime.
  late MenuServiceBoxModel menuServiceBoxAirtimeModel;
  // Model for MenuServiceBox-Data.
  late MenuServiceBoxModel menuServiceBoxDataModel;
  // Model for MenuServiceBox-CableTV.
  late MenuServiceBoxModel menuServiceBoxCableTVModel;
  // Model for MenuServiceBox-Internet.
  late MenuServiceBoxModel menuServiceBoxInternetModel;
  // Model for MenuServiceBox-Eletricity.
  late MenuServiceBoxModel menuServiceBoxEletricityModel;
  // Model for MenuServiceBox-Transport.
  late MenuServiceBoxModel menuServiceBoxTransportModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    menuServiceBoxAirtimeModel =
        createModel(context, () => MenuServiceBoxModel());
    menuServiceBoxDataModel = createModel(context, () => MenuServiceBoxModel());
    menuServiceBoxCableTVModel =
        createModel(context, () => MenuServiceBoxModel());
    menuServiceBoxInternetModel =
        createModel(context, () => MenuServiceBoxModel());
    menuServiceBoxEletricityModel =
        createModel(context, () => MenuServiceBoxModel());
    menuServiceBoxTransportModel =
        createModel(context, () => MenuServiceBoxModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    menuServiceBoxAirtimeModel.dispose();
    menuServiceBoxDataModel.dispose();
    menuServiceBoxCableTVModel.dispose();
    menuServiceBoxInternetModel.dispose();
    menuServiceBoxEletricityModel.dispose();
    menuServiceBoxTransportModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
