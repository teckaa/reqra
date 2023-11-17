import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/forms/calender_text_field/calender_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_bill_orders_widget.dart' show FilterBillOrdersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterBillOrdersModel extends FlutterFlowModel<FilterBillOrdersWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for ChoiceChips-ServiceProvider widget.
  String? choiceChipsServiceProviderValue;
  FormFieldController<List<String>>? choiceChipsServiceProviderValueController;
  // Model for CalenderTextField component.
  late CalenderTextFieldModel calenderTextFieldModel1;
  // Model for CalenderTextField component.
  late CalenderTextFieldModel calenderTextFieldModel2;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    calenderTextFieldModel1 =
        createModel(context, () => CalenderTextFieldModel());
    calenderTextFieldModel2 =
        createModel(context, () => CalenderTextFieldModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    calenderTextFieldModel1.dispose();
    calenderTextFieldModel2.dispose();
    primaryButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
