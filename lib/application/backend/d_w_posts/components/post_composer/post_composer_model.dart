import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/backend/d_w_posts/categories/create_category/create_category_widget.dart';
import '/application/backend/d_w_posts/categories/list_of_categories/list_of_categories_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_circle_button/shimmer_circle_button_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'post_composer_widget.dart' show PostComposerWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PostComposerModel extends FlutterFlowModel<PostComposerWidget> {
  ///  Local state fields for this component.

  bool toggleAdvance = false;

  String? getImagePathFromState;

  ///  State fields for stateful widgets in this component.

  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for TextField-Title widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleController;
  String? Function(BuildContext, String?)? textFieldTitleControllerValidator;
  // Model for PhotoGridWithDetails component.
  late PhotoGridWithDetailsModel photoGridWithDetailsModel;
  // State field(s) for ChoiceChips-Categories widget.
  List<String>? choiceChipsCategoriesValues;
  FormFieldController<List<String>>? choiceChipsCategoriesValueController;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Stack widget.
  String? getPostImagePath;
  // State field(s) for TextField-PostDesc widget.
  FocusNode? textFieldPostDescFocusNode;
  TextEditingController? textFieldPostDescController;
  String? Function(BuildContext, String?)? textFieldPostDescControllerValidator;
  // Model for InputTextArea-Excerpt.
  late InputTextAreaModel inputTextAreaExcerptModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonLoadingModel =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    photoGridWithDetailsModel =
        createModel(context, () => PhotoGridWithDetailsModel());
    inputTextAreaExcerptModel =
        createModel(context, () => InputTextAreaModel());
  }

  void dispose() {
    primaryRoundedButtonModel.dispose();
    primaryRoundedButtonLoadingModel.dispose();
    textFieldTitleFocusNode?.dispose();
    textFieldTitleController?.dispose();

    photoGridWithDetailsModel.dispose();
    textFieldPostDescFocusNode?.dispose();
    textFieldPostDescController?.dispose();

    inputTextAreaExcerptModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
