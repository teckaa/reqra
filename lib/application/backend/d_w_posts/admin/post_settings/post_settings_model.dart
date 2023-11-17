import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'post_settings_widget.dart' show PostSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostSettingsModel extends FlutterFlowModel<PostSettingsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for TextField-PageTitle widget.
  FocusNode? textFieldPageTitleFocusNode;
  TextEditingController? textFieldPageTitleController;
  String? Function(BuildContext, String?)?
      textFieldPageTitleControllerValidator;
  // State field(s) for TextField-BlogDesc widget.
  FocusNode? textFieldBlogDescFocusNode;
  TextEditingController? textFieldBlogDescController;
  String? Function(BuildContext, String?)? textFieldBlogDescControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
    primaryRoundedButtonLoadingModel =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
  }

  void dispose() {
    primaryRoundedButtonModel.dispose();
    primaryRoundedButtonLoadingModel.dispose();
    textFieldPageTitleFocusNode?.dispose();
    textFieldPageTitleController?.dispose();

    textFieldBlogDescFocusNode?.dispose();
    textFieldBlogDescController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
