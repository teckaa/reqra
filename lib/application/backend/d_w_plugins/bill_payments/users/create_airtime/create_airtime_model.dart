import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/components/confirm_transaction/confirm_transaction_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/components/security_alert/security_alert_widget.dart';
import '/application/backend/d_w_recipients/users/components/my_recipients/my_recipients_widget.dart';
import '/application/backend/d_w_settings/admin/adverts/users/list_of_ads/list_of_ads_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_one_line/shimmer_one_line_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/request_manager.dart';

import 'create_airtime_widget.dart' show CreateAirtimeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateAirtimeModel extends FlutterFlowModel<CreateAirtimeWidget> {
  ///  Local state fields for this page.

  double? commission;

  double? tax;

  double? amount;

  String? providerBillerCode = '';

  String? providerLogo;

  DocumentReference? providerRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in CreateAirtime widget.
  BillpaymentProvidersRecord? getFirstProvider;
  // Stores action output result for [Firestore Query - Query a collection] action in CreateAirtime widget.
  int? getAdsData;
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for ListOfAds component.
  late ListOfAdsModel listOfAdsModel1;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel2;
  // Stores action output result for [Bottom Sheet - MyRecipients] action in Row widget.
  DwRecipientsRecord? getMyRecipient;
  // State field(s) for TextField-PhoneNumber widget.
  FocusNode? textFieldPhoneNumberFocusNode;
  TextEditingController? textFieldPhoneNumberController;
  final textFieldPhoneNumberMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)?
      textFieldPhoneNumberControllerValidator;
  String? _textFieldPhoneNumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yooxcoai' /* Phone Number is required */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'tblwq2wb' /* Phone numbers must be 11 digit... */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        'tpellcad' /* Phone numbers must be 11 digit... */,
      );
    }

    return null;
  }

  // State field(s) for TextField-Amount widget.
  FocusNode? textFieldAmountFocusNode;
  TextEditingController? textFieldAmountController;
  String? Function(BuildContext, String?)? textFieldAmountControllerValidator;
  String? _textFieldAmountControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xoce3wjg' /* Amount is required */,
      );
    }

    return null;
  }

  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryButton widget.
  DwPluginsRecord? getBillPaymentSettings;
  // Model for ListOfAds component.
  late ListOfAdsModel listOfAdsModel2;
  // Model for NoAccessError component.
  late NoAccessErrorModel noAccessErrorModel;

  /// Query cache managers for this widget.

  final _billPaymentSettingsManager =
      StreamRequestManager<List<BillpaymentsServicesRecord>>();
  Stream<List<BillpaymentsServicesRecord>> billPaymentSettings({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BillpaymentsServicesRecord>> Function() requestFn,
  }) =>
      _billPaymentSettingsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBillPaymentSettingsCache() => _billPaymentSettingsManager.clear();
  void clearBillPaymentSettingsCacheKey(String? uniqueKey) =>
      _billPaymentSettingsManager.clearRequest(uniqueKey);

  final _listOfProviderQueryManager =
      StreamRequestManager<List<BillpaymentProvidersRecord>>();
  Stream<List<BillpaymentProvidersRecord>> listOfProviderQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BillpaymentProvidersRecord>> Function() requestFn,
  }) =>
      _listOfProviderQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListOfProviderQueryCache() => _listOfProviderQueryManager.clear();
  void clearListOfProviderQueryCacheKey(String? uniqueKey) =>
      _listOfProviderQueryManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    listOfAdsModel1 = createModel(context, () => ListOfAdsModel());
    photoGridCoverModel2 = createModel(context, () => PhotoGridCoverModel());
    textFieldPhoneNumberControllerValidator =
        _textFieldPhoneNumberControllerValidator;
    textFieldAmountControllerValidator = _textFieldAmountControllerValidator;
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    listOfAdsModel2 = createModel(context, () => ListOfAdsModel());
    noAccessErrorModel = createModel(context, () => NoAccessErrorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    listOfAdsModel1.dispose();
    photoGridCoverModel2.dispose();
    textFieldPhoneNumberFocusNode?.dispose();
    textFieldPhoneNumberController?.dispose();

    textFieldAmountFocusNode?.dispose();
    textFieldAmountController?.dispose();

    primaryButtonModel.dispose();
    listOfAdsModel2.dispose();
    noAccessErrorModel.dispose();

    /// Dispose query cache managers for this widget.

    clearBillPaymentSettingsCache();

    clearListOfProviderQueryCache();
  }

  /// Action blocks are added here.

  Future airtimeAmount(BuildContext context) async {}

  /// Additional helper methods are added here.
}
