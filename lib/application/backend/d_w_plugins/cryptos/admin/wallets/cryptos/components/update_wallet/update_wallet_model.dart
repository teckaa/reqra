import '/application/backend/d_w_plugins/cryptos/admin/wallets/cryptos/components/list_of_coins_from_api/list_of_coins_from_api_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/dropdown_searchable/dropdown_searchable_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/left_sided_amount_text_field/left_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_wallet_widget.dart' show UpdateWalletWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateWalletModel extends FlutterFlowModel<UpdateWalletWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Stack widget.
  dynamic? getCoinData;
  // State field(s) for TextField-Coinname widget.
  FocusNode? textFieldCoinnameFocusNode;
  TextEditingController? textFieldCoinnameController;
  String? Function(BuildContext, String?)? textFieldCoinnameControllerValidator;
  // State field(s) for TextField-Coincode widget.
  FocusNode? textFieldCoincodeFocusNode;
  TextEditingController? textFieldCoincodeController;
  String? Function(BuildContext, String?)? textFieldCoincodeControllerValidator;
  // Model for DropdownSearchable-WalletNetwork.
  late DropdownSearchableModel dropdownSearchableWalletNetworkModel;
  // Model for InputTextField-WalletAddress.
  late InputTextFieldModel inputTextFieldWalletAddressModel;
  // Model for SidedAmountTextField-Selling.
  late LeftSidedAmountTextFieldModel sidedAmountTextFieldSellingModel;
  // Model for SidedAmountTextField-Buying.
  late LeftSidedAmountTextFieldModel sidedAmountTextFieldBuyingModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryButtonLoading-Save widget.
  CryptoWalletsRecord? getExistOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    dropdownSearchableWalletNetworkModel =
        createModel(context, () => DropdownSearchableModel());
    inputTextFieldWalletAddressModel =
        createModel(context, () => InputTextFieldModel());
    sidedAmountTextFieldSellingModel =
        createModel(context, () => LeftSidedAmountTextFieldModel());
    sidedAmountTextFieldBuyingModel =
        createModel(context, () => LeftSidedAmountTextFieldModel());
    primaryButtonLoadingSaveModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    textFieldCoinnameFocusNode?.dispose();
    textFieldCoinnameController?.dispose();

    textFieldCoincodeFocusNode?.dispose();
    textFieldCoincodeController?.dispose();

    dropdownSearchableWalletNetworkModel.dispose();
    inputTextFieldWalletAddressModel.dispose();
    sidedAmountTextFieldSellingModel.dispose();
    sidedAmountTextFieldBuyingModel.dispose();
    primaryButtonLoadingSaveModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
