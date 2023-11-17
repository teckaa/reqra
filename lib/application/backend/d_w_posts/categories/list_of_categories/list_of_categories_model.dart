import '/application/backend/d_w_posts/categories/create_category/create_category_widget.dart';
import '/application/backend/d_w_posts/categories/update_category/update_category_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_categories_widget.dart' show ListOfCategoriesWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ListOfCategoriesModel extends FlutterFlowModel<ListOfCategoriesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for SearchTextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    modalHeaderModel.dispose();
    searchTextFieldModel.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
