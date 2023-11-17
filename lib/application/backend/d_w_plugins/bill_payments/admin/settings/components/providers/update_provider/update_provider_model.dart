import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_provider_widget.dart' show UpdateProviderWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateProviderModel extends FlutterFlowModel<UpdateProviderWidget> {
  ///  Local state fields for this component.

  List<int> amountPicker = [];
  void addToAmountPicker(int item) => amountPicker.add(item);
  void removeFromAmountPicker(int item) => amountPicker.remove(item);
  void removeAtIndexFromAmountPicker(int index) => amountPicker.removeAt(index);
  void insertAtIndexInAmountPicker(int index, int item) =>
      amountPicker.insert(index, item);
  void updateAmountPickerAtIndex(int index, Function(int) updateFn) =>
      amountPicker[index] = updateFn(amountPicker[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;
  // Model for PhotoGrid component.
  late PhotoGridModel photoGridModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGrid widget.
  String? getImageData;
  // State field(s) for Switch-Provider widget.
  bool? switchProviderValue;
  // State field(s) for DropDown-Country widget.
  String? dropDownCountryValue;
  FormFieldController<String>? dropDownCountryValueController;
  // State field(s) for DropDown-Currency widget.
  String? dropDownCurrencyValue;
  FormFieldController<String>? dropDownCurrencyValueController;
  // State field(s) for DropDown-TypeOfService widget.
  String? dropDownTypeOfServiceValue;
  FormFieldController<String>? dropDownTypeOfServiceValueController;
  // Model for InputTextField-ProviderName.
  late InputTextFieldModel inputTextFieldProviderNameModel;
  // Model for InputTextField-ProviderCommission.
  late InputTextFieldModel inputTextFieldProviderCommissionModel;
  // Model for RightSidedAmountTextField-TransferFee.
  late RightSidedAmountTextFieldModel rightSidedAmountTextFieldTransferFeeModel;
  // Model for InputTextField-BillerName.
  late InputTextFieldModel inputTextFieldBillerNameModel;
  // Model for InputTextField-BillerCode.
  late InputTextFieldModel inputTextFieldBillerCodeModel;
  // Model for InputTextField-ItemCode.
  late InputTextFieldModel inputTextFieldItemCodeModel;
  // Model for InputTextField-ProviderShortName.
  late InputTextFieldModel inputTextFieldProviderShortNameModel;
  // State field(s) for Switch-CashBack widget.
  bool? switchCashBackValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    photoGridModel = createModel(context, () => PhotoGridModel());
    inputTextFieldProviderNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldProviderCommissionModel =
        createModel(context, () => InputTextFieldModel());
    rightSidedAmountTextFieldTransferFeeModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    inputTextFieldBillerNameModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldBillerCodeModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldItemCodeModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldProviderShortNameModel =
        createModel(context, () => InputTextFieldModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    primaryButtonLoadingModel.dispose();
    photoGridModel.dispose();
    inputTextFieldProviderNameModel.dispose();
    inputTextFieldProviderCommissionModel.dispose();
    rightSidedAmountTextFieldTransferFeeModel.dispose();
    inputTextFieldBillerNameModel.dispose();
    inputTextFieldBillerCodeModel.dispose();
    inputTextFieldItemCodeModel.dispose();
    inputTextFieldProviderShortNameModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
