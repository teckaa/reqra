import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_settings/admin/announcements/components/create_announcement/create_announcement_widget.dart';
import '/application/backend/d_w_settings/admin/announcements/components/update_announcement/update_announcement_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_of_annonucements_widget.dart' show ListOfAnnonucementsWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ListOfAnnonucementsModel
    extends FlutterFlowModel<ListOfAnnonucementsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    titleWithBackButtonModel =
        createModel(context, () => TitleWithBackButtonModel());
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    noAccessErrorModel.dispose();
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    searchTextFieldModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
