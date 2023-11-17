import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/services/create_service/create_service_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/services/update_service/update_service_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/application/components/shimmers/shimmer_circle_button/shimmer_circle_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'bill_settings_widget.dart' show BillSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BillSettingsModel extends FlutterFlowModel<BillSettingsWidget> {
  ///  Local state fields for this page.

  List<String> providerName = [];
  void addToProviderName(String item) => providerName.add(item);
  void removeFromProviderName(String item) => providerName.remove(item);
  void removeAtIndexFromProviderName(int index) => providerName.removeAt(index);
  void insertAtIndexInProviderName(int index, String item) =>
      providerName.insert(index, item);
  void updateProviderNameAtIndex(int index, Function(String) updateFn) =>
      providerName[index] = updateFn(providerName[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for RadioButton-KeyMode widget.
  FormFieldController<String>? radioButtonKeyModeValueController;
  // State field(s) for DropDown-Provider widget.
  String? dropDownProviderValue;
  FormFieldController<String>? dropDownProviderValueController;
  // Model for InputTextField-PublicProviderApi.
  late InputTextFieldModel inputTextFieldPublicProviderApiModel;
  // Model for InputTextField-TestProviderApi.
  late InputTextFieldModel inputTextFieldTestProviderApiModel;
  // State field(s) for DropDown-Country widget.
  String? dropDownCountryValue;
  FormFieldController<String>? dropDownCountryValueController;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;
  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel1;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryRoundedButton widget.
  BillpaymentSettingsRecord? getBillSettingsData;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    inputTextFieldPublicProviderApiModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldTestProviderApiModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    primaryRoundedButtonModel1 =
        createModel(context, () => PrimaryRoundedButtonModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    tabBarController?.dispose();
    inputTextFieldPublicProviderApiModel.dispose();
    inputTextFieldTestProviderApiModel.dispose();
    primaryButtonLoadingModel.dispose();
    primaryRoundedButtonModel1.dispose();
    noAccessErrorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonKeyModeValue =>
      radioButtonKeyModeValueController?.value;
}
