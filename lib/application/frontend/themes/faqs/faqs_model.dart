import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/frontend/themes/footer/footer_widget.dart';
import '/application/frontend/themes/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'faqs_widget.dart' show FaqsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FaqsModel extends FlutterFlowModel<FaqsWidget> {
  ///  Local state fields for this page.

  bool? toggleState = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for PrimaryButton-Contact.
  late PrimaryButtonModel primaryButtonContactModel;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    primaryButtonContactModel =
        createModel(context, () => PrimaryButtonModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    primaryButtonContactModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
