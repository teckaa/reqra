import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/frontend/themes/abuja/components/footer_abuja/footer_abuja_widget.dart';
import '/application/frontend/themes/abuja/components/header_abuja/header_abuja_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'gift_cards_widget.dart' show GiftCardsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GiftCardsModel extends FlutterFlowModel<GiftCardsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header-Abuja component.
  late HeaderAbujaModel headerAbujaModel;
  // Model for PrimaryButton-GetStarted.
  late PrimaryButtonModel primaryButtonGetStartedModel;
  // Model for PrimaryButton-ContactUs.
  late PrimaryButtonModel primaryButtonContactUsModel;
  // Model for Footer-Abuja component.
  late FooterAbujaModel footerAbujaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerAbujaModel = createModel(context, () => HeaderAbujaModel());
    primaryButtonGetStartedModel =
        createModel(context, () => PrimaryButtonModel());
    primaryButtonContactUsModel =
        createModel(context, () => PrimaryButtonModel());
    footerAbujaModel = createModel(context, () => FooterAbujaModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerAbujaModel.dispose();
    primaryButtonGetStartedModel.dispose();
    primaryButtonContactUsModel.dispose();
    footerAbujaModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
