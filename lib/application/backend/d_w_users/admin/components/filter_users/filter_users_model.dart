import '/application/components/forms/calender_text_field/calender_text_field_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_users_widget.dart' show FilterUsersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterUsersModel extends FlutterFlowModel<FilterUsersWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for OrderStatusChoiceChips widget.
  String? orderStatusChoiceChipsValue;
  FormFieldController<List<String>>? orderStatusChoiceChipsValueController;
  // Model for CalenderTextField component.
  late CalenderTextFieldModel calenderTextFieldModel1;
  // Model for CalenderTextField component.
  late CalenderTextFieldModel calenderTextFieldModel2;
  // Model for ModalFooterColumn component.
  late ModalFooterColumnModel modalFooterColumnModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    calenderTextFieldModel1 =
        createModel(context, () => CalenderTextFieldModel());
    calenderTextFieldModel2 =
        createModel(context, () => CalenderTextFieldModel());
    modalFooterColumnModel =
        createModel(context, () => ModalFooterColumnModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    calenderTextFieldModel1.dispose();
    calenderTextFieldModel2.dispose();
    modalFooterColumnModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
