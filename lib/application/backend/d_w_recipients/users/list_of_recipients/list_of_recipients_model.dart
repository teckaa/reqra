import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_recipients/users/components/create_recipient/create_recipient_widget.dart';
import '/application/backend/d_w_recipients/users/components/read_recipient/read_recipient_widget.dart';
import '/application/backend/d_w_recipients/users/components/update_contact/update_contact_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_recipients_widget.dart' show ListOfRecipientsWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ListOfRecipientsModel extends FlutterFlowModel<ListOfRecipientsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel;
  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
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
    dWHeaderModel.dispose();
    titleWithBackButtonModel.dispose();
    searchTextFieldModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
