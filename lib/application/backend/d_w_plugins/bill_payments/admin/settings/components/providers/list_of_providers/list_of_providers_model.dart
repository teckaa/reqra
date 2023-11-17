import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/providers/list_of_providers_comp/list_of_providers_comp_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_providers_widget.dart' show ListOfProvidersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfProvidersModel extends FlutterFlowModel<ListOfProvidersWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for ListOfProvidersComp component.
  late ListOfProvidersCompModel listOfProvidersCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    listOfProvidersCompModel =
        createModel(context, () => ListOfProvidersCompModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    listOfProvidersCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
