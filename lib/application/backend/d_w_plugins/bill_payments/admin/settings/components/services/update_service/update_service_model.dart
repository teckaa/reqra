import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/providers/list_of_providers_comp/list_of_providers_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/number_text_field/number_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'update_service_widget.dart' show UpdateServiceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateServiceModel extends FlutterFlowModel<UpdateServiceWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Switch-Status widget.
  bool? switchStatusValue;
  // Model for RightSidedAmountTextField-Min.
  late RightSidedAmountTextFieldModel rightSidedAmountTextFieldMinModel;
  // Model for RightSidedAmountTextField-Max.
  late RightSidedAmountTextFieldModel rightSidedAmountTextFieldMaxModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel1;
  // Model for ListOfProvidersComp component.
  late ListOfProvidersCompModel listOfProvidersCompModel;
  // State field(s) for Switch-CashBack widget.
  bool? switchCashBackValue;
  // State field(s) for TextField-CashBackPercent widget.
  FocusNode? textFieldCashBackPercentFocusNode;
  TextEditingController? textFieldCashBackPercentController;
  String? Function(BuildContext, String?)?
      textFieldCashBackPercentControllerValidator;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel2;
  // State field(s) for Switch-AmountPicker widget.
  bool? switchAmountPickerValue;
  // Model for NumberTextField-AmountPicker.
  late NumberTextFieldModel numberTextFieldAmountPickerModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel3;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel4;
  // Model for InputTextField-SuspensionTitle.
  late InputTextFieldModel inputTextFieldSuspensionTitleModel;
  // Model for InputTextArea-SuspensionDesc.
  late InputTextAreaModel inputTextAreaSuspensionDescModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    rightSidedAmountTextFieldMinModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    rightSidedAmountTextFieldMaxModel =
        createModel(context, () => RightSidedAmountTextFieldModel());
    primaryButtonLoadingModel1 =
        createModel(context, () => PrimaryButtonLoadingModel());
    listOfProvidersCompModel =
        createModel(context, () => ListOfProvidersCompModel());
    primaryButtonLoadingModel2 =
        createModel(context, () => PrimaryButtonLoadingModel());
    numberTextFieldAmountPickerModel =
        createModel(context, () => NumberTextFieldModel());
    primaryButtonLoadingModel3 =
        createModel(context, () => PrimaryButtonLoadingModel());
    primaryButtonLoadingModel4 =
        createModel(context, () => PrimaryButtonLoadingModel());
    inputTextFieldSuspensionTitleModel =
        createModel(context, () => InputTextFieldModel());
    inputTextAreaSuspensionDescModel =
        createModel(context, () => InputTextAreaModel());
    primaryButtonLoadingModel5 =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    tabBarController?.dispose();
    rightSidedAmountTextFieldMinModel.dispose();
    rightSidedAmountTextFieldMaxModel.dispose();
    primaryButtonLoadingModel1.dispose();
    listOfProvidersCompModel.dispose();
    textFieldCashBackPercentFocusNode?.dispose();
    textFieldCashBackPercentController?.dispose();

    primaryButtonLoadingModel2.dispose();
    numberTextFieldAmountPickerModel.dispose();
    primaryButtonLoadingModel3.dispose();
    primaryButtonLoadingModel4.dispose();
    inputTextFieldSuspensionTitleModel.dispose();
    inputTextAreaSuspensionDescModel.dispose();
    primaryButtonLoadingModel5.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
