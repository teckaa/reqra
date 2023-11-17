import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/cryptos/create_order_components/get_recipient_data/get_recipient_data_widget.dart';
import '/application/backend/d_w_plugins/cryptos/users/components/list_of_wallet_rate/list_of_wallet_rate_widget.dart';
import '/application/backend/d_w_recipients2/components/create_recipient_comp/create_recipient_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/menus/menu_service_box/menu_service_box_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_order_widget.dart' show CreateOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateOrderModel extends FlutterFlowModel<CreateOrderWidget> {
  ///  Local state fields for this page.

  DocumentReference? recipientDataRef;

  bool? amountState = false;

  bool? recipientState;

  bool? reviewState;

  bool? confirmState;

  String? recipientTypeState;

  double? tender = 1000.0;

  double? receiver = 0.0;

  bool? amountProgressState;

  bool? recipientProgressState;

  bool? reviewProgressState;

  bool? confirmProgressState;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in CreateOrder widget.
  CryptoWalletsRecord? getRateFromFirebase;
  // Model for DWSidebar component.
  late DWSidebarModel dWSidebarModel;
  // Model for DWHeader component.
  late DWHeaderModel dWHeaderModel;
  // Model for PrimaryButtonLoading component.
  late PrimaryButtonLoadingModel primaryButtonLoadingModel;
  // Stores action output result for [Firestore Query - Query a collection] action in PrimaryButtonLoading widget.
  DwRecipientsRecord? checkIfRecipientExist;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Model for CreateRecipientComp component.
  late CreateRecipientCompModel createRecipientCompModel;
  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel2;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DwRecipientsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for TitleWithBackButton component.
  late TitleWithBackButtonModel titleWithBackButtonModel3;
  // Model for GetRecipientData component.
  late GetRecipientDataModel getRecipientDataModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for MenuServiceBox component.
  late MenuServiceBoxModel menuServiceBoxModel1;
  // Model for MenuServiceBox component.
  late MenuServiceBoxModel menuServiceBoxModel2;
  // State field(s) for TextField-Tender widget.
  FocusNode? textFieldTenderFocusNode;
  TextEditingController? textFieldTenderController;
  String? Function(BuildContext, String?)? textFieldTenderControllerValidator;
  // Stores action output result for [Bottom Sheet - ListOfWallet-Rate] action in RichTextSpan widget.
  CryptoWalletsRecord? getRateData;
  // State field(s) for TextField-Received widget.
  FocusNode? textFieldReceivedFocusNode;
  TextEditingController? textFieldReceivedController;
  String? Function(BuildContext, String?)? textFieldReceivedControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dWSidebarModel = createModel(context, () => DWSidebarModel());
    dWHeaderModel = createModel(context, () => DWHeaderModel());
    primaryButtonLoadingModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    titleWithBackButtonModel1 =
        createModel(context, () => TitleWithBackButtonModel());
    createRecipientCompModel =
        createModel(context, () => CreateRecipientCompModel());
    titleWithBackButtonModel2 =
        createModel(context, () => TitleWithBackButtonModel());
    titleWithBackButtonModel3 =
        createModel(context, () => TitleWithBackButtonModel());
    getRecipientDataModel = createModel(context, () => GetRecipientDataModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    menuServiceBoxModel1 = createModel(context, () => MenuServiceBoxModel());
    menuServiceBoxModel2 = createModel(context, () => MenuServiceBoxModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
  }

  void dispose() {
    dWSidebarModel.dispose();
    dWHeaderModel.dispose();
    primaryButtonLoadingModel.dispose();
    titleWithBackButtonModel1.dispose();
    createRecipientCompModel.dispose();
    titleWithBackButtonModel2.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    titleWithBackButtonModel3.dispose();
    getRecipientDataModel.dispose();
    primaryButtonModel1.dispose();
    menuServiceBoxModel1.dispose();
    menuServiceBoxModel2.dispose();
    textFieldTenderFocusNode?.dispose();
    textFieldTenderController?.dispose();

    textFieldReceivedFocusNode?.dispose();
    textFieldReceivedController?.dispose();

    primaryButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, DwRecipientsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, DwRecipientsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, DwRecipientsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDwRecipientsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
