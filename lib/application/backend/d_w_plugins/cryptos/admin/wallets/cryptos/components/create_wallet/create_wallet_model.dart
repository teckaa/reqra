import '/application/backend/d_w_plugins/cryptos/admin/wallets/cryptos/components/list_of_coins_from_api/list_of_coins_from_api_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/dropdown_searchable/dropdown_searchable_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/left_sided_amount_text_field/left_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_wallet_widget.dart' show CreateWalletWidget;
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

class CreateWalletModel extends FlutterFlowModel<CreateWalletWidget> {
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
  // Model for LeftSidedAmountTextField-Selling.
  late LeftSidedAmountTextFieldModel leftSidedAmountTextFieldSellingModel;
  // Model for LeftSidedAmountTextField-Buying.
  late LeftSidedAmountTextFieldModel leftSidedAmountTextFieldBuyingModel;
  // Model for PrimaryButtonLoading-Save.
  late PrimaryButtonLoadingModel primaryButtonLoadingSaveModel;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryButtonLoading-Save widget.
  CryptoWalletsRecord? checkDocumentExist;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    dropdownSearchableWalletNetworkModel =
        createModel(context, () => DropdownSearchableModel());
    inputTextFieldWalletAddressModel =
        createModel(context, () => InputTextFieldModel());
    leftSidedAmountTextFieldSellingModel =
        createModel(context, () => LeftSidedAmountTextFieldModel());
    leftSidedAmountTextFieldBuyingModel =
        createModel(context, () => LeftSidedAmountTextFieldModel());
    primaryButtonLoadingSaveModel =
        createModel(context, () => PrimaryButtonLoadingModel());

    inputTextFieldWalletAddressModel.textControllerValidator =
        _formTextFieldValidator1;
    leftSidedAmountTextFieldSellingModel.textControllerValidator =
        _formTextFieldValidator2;
    leftSidedAmountTextFieldBuyingModel.textControllerValidator =
        _formTextFieldValidator3;
  }

  void dispose() {
    modalHeaderModel.dispose();
    textFieldCoinnameFocusNode?.dispose();
    textFieldCoinnameController?.dispose();

    textFieldCoincodeFocusNode?.dispose();
    textFieldCoincodeController?.dispose();

    dropdownSearchableWalletNetworkModel.dispose();
    inputTextFieldWalletAddressModel.dispose();
    leftSidedAmountTextFieldSellingModel.dispose();
    leftSidedAmountTextFieldBuyingModel.dispose();
    primaryButtonLoadingSaveModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ksslxwnw' /* Wallet address is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qzxyj4mu' /* Selling rate is required */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ahlzso1s' /* Buying rate is required */,
      );
    }

    return null;
  }
}
