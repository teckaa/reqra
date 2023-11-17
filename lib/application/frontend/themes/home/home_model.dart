import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/frontend/themes/abuja/home_abuja/home_abuja_widget.dart';
import '/application/frontend/themes/enugu/home_enugu/home_enugu_widget.dart';
import '/application/frontend/themes/footer/footer_widget.dart';
import '/application/frontend/themes/header/header_widget.dart';
import '/application/frontend/themes/lagos/home_lagos/home_lagos_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'home_widget.dart' show HomeWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  String? checkForOwner = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  int? countUser;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for HomeLagos component.
  late HomeLagosModel homeLagosModel;
  // Model for HomeAbuja component.
  late HomeAbujaModel homeAbujaModel;
  // Model for HomeEnugu component.
  late HomeEnuguModel homeEnuguModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for Footer component.
  late FooterModel footerModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    homeLagosModel = createModel(context, () => HomeLagosModel());
    homeAbujaModel = createModel(context, () => HomeAbujaModel());
    homeEnuguModel = createModel(context, () => HomeEnuguModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    footerModel = createModel(context, () => FooterModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    homeLagosModel.dispose();
    homeAbujaModel.dispose();
    homeEnuguModel.dispose();
    primaryButtonModel1.dispose();
    footerModel.dispose();
    primaryButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
