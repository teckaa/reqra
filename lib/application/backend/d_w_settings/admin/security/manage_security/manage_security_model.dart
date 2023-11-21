import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_settings/admin/links/components/create_link/create_link_widget.dart';
import '/application/backend/d_w_settings/admin/security/components/updat_app_security/updat_app_security_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'manage_security_widget.dart' show ManageSecurityWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ManageSecurityModel extends FlutterFlowModel<ManageSecurityWidget> {
  ///  Local state fields for this page.

  List<String> providerName = [];
  void addToProviderName(String item) => providerName.add(item);
  void removeFromProviderName(String item) => providerName.remove(item);
  void removeAtIndexFromProviderName(int index) => providerName.removeAt(index);
  void insertAtIndexInProviderName(int index, String item) =>
      providerName.insert(index, item);
  void updateProviderNameAtIndex(int index, Function(String) updateFn) =>
      providerName[index] = updateFn(providerName[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel1;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    primaryRoundedButtonModel1 =
        createModel(context, () => PrimaryRoundedButtonModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    primaryRoundedButtonModel1.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
