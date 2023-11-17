import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/cryptos/admin/wallets/cryptos/components/create_wallet/create_wallet_widget.dart';
import '/application/backend/d_w_plugins/cryptos/admin/wallets/cryptos/components/read_wallet/read_wallet_widget.dart';
import '/application/backend/d_w_plugins/cryptos/admin/wallets/cryptos/components/update_wallet/update_wallet_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_wallets_model.dart';
export 'list_of_wallets_model.dart';

class ListOfWalletsWidget extends StatefulWidget {
  const ListOfWalletsWidget({Key? key}) : super(key: key);

  @override
  _ListOfWalletsWidgetState createState() => _ListOfWalletsWidgetState();
}

class _ListOfWalletsWidgetState extends State<ListOfWalletsWidget> {
  late ListOfWalletsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfWalletsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListOfWallets'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'List of wallets',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 0.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'LIST_OF_WALLETS_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'llkpk81b' /* List all wallet */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.dWSidebarModel,
                    updateCallback: () => setState(() {}),
                    child: DWSidebarWidget(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              if ((valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'User') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'user') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'USER')) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    wrapWithModel(
                                      model: _model.noAccessErrorModel,
                                      updateCallback: () => setState(() {}),
                                      child: NoAccessErrorWidget(),
                                    ),
                                  ],
                                );
                              } else {
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      wrapWithModel(
                                        model: _model.dWHeaderModel,
                                        updateCallback: () => setState(() {}),
                                        child: DWHeaderWidget(
                                          pageTitle: 'List of Wallets',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 15.0, 15.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 800.0,
                                          constraints: BoxConstraints(
                                            maxWidth: double.infinity,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              StreamBuilder<
                                                  List<CryptoWalletsRecord>>(
                                                stream:
                                                    queryCryptoWalletsRecord(
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Container(
                                                      width: 350.0,
                                                      height: 135.0,
                                                      child:
                                                          ShimmerCardWidget(),
                                                    );
                                                  }
                                                  List<CryptoWalletsRecord>
                                                      columnCryptoWalletsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final columnCryptoWalletsRecord =
                                                      columnCryptoWalletsRecordList
                                                              .isNotEmpty
                                                          ? columnCryptoWalletsRecordList
                                                              .first
                                                          : null;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .titleWithBackButtonModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            TitleWithBackButtonWidget(
                                                          titleName: 'Wallets',
                                                          actionPara:
                                                              () async {},
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 400.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              child: Container(
                                                                width: 300.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .searchTextFieldModel,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      SearchTextFieldWidget(
                                                                    hintPara:
                                                                        'Search',
                                                                    readOnlyStatusPara:
                                                                        false,
                                                                    actionPara:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .primaryButtonModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  PrimaryButtonWidget(
                                                                buttonText:
                                                                    'Add new',
                                                                disableStatusPara:
                                                                    false,
                                                                buttonAction:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'LIST_OF_WALLETS_Container_knbz3vte_CALLB');
                                                                  logFirebaseEvent(
                                                                      'PrimaryButton_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .overlay,
                                                                    useSafeArea:
                                                                        true,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              CreateWalletWidget(),
                                                                        ),
                                                                      ));
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                      FutureBuilder<int>(
                                                        future:
                                                            queryCryptoWalletsRecordCount(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return ShimmerCountWidget();
                                                          }
                                                          int textCount =
                                                              snapshot.data!;
                                                          return Text(
                                                            '${textCount.toString()} Wallets',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 20.0)),
                                                  );
                                                },
                                              ),
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<CryptoWalletsRecord>>(
                                                  stream:
                                                      queryCryptoWalletsRecord(
                                                    queryBuilder:
                                                        (cryptoWalletsRecord) =>
                                                            cryptoWalletsRecord
                                                                .where(
                                                                  'wallet_name',
                                                                  isEqualTo: _model
                                                                              .searchTextFieldModel
                                                                              .searchTextFieldController
                                                                              .text !=
                                                                          ''
                                                                      ? _model
                                                                          .searchTextFieldModel
                                                                          .searchTextFieldController
                                                                          .text
                                                                      : null,
                                                                )
                                                                .orderBy(
                                                                    'created_at',
                                                                    descending:
                                                                        true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Container(
                                                        width: double.infinity,
                                                        child:
                                                            ShimmerListOfTablesWidget(),
                                                      );
                                                    }
                                                    List<CryptoWalletsRecord>
                                                        dataTableCryptoWalletsRecordList =
                                                        snapshot.data!;
                                                    if (dataTableCryptoWalletsRecordList
                                                        .isEmpty) {
                                                      return EmptyTableWidget(
                                                        titlePara:
                                                            'You have not create any wallet yet',
                                                        descPara:
                                                            'Once you\'ve create your wallet/coin, they\'ll be displayed here for your convenience. Take your time and enjoy browsing our offerings.',
                                                        buttonTextPara:
                                                            'Create  wallet',
                                                        buttonActionPara:
                                                            () async {
                                                          logFirebaseEvent(
                                                              'LIST_OF_WALLETS_DataTable_22q1pbaj_CALLB');
                                                          logFirebaseEvent(
                                                              'DataTable_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .overlay,
                                                            enableDrag: false,
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      CreateWalletWidget(),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      );
                                                    }
                                                    return DataTable2(
                                                      columns: [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ugtz4uur' /* Coin */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          fixedWidth: 180.0,
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Visibility(
                                                              visible:
                                                                  responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                              ),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'c9v0giwl' /* Wallet */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'zd6vjjeh' /* Rates */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          fixedWidth: 200.0,
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Visibility(
                                                              visible:
                                                                  responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                              ),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'czt036qo' /* Action */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          fixedWidth: 150.0,
                                                        ),
                                                      ],
                                                      rows:
                                                          dataTableCryptoWalletsRecordList
                                                              .mapIndexed((dataTableIndex,
                                                                      dataTableCryptoWalletsRecord) =>
                                                                  [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'LIST_OF_WALLETS_Container_x22pgx7p_ON_TA');
                                                                        logFirebaseEvent(
                                                                            'PhotoGridWithDetails_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          barrierColor:
                                                                              FlutterFlowTheme.of(context).overlay,
                                                                          enableDrag:
                                                                              false,
                                                                          useSafeArea:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                                child: GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: ReadWalletWidget(
                                                                                  recordRef: dataTableCryptoWalletsRecord.reference,
                                                                                ),
                                                                              ),
                                                                            ));
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          PhotoGridWithDetailsWidget(
                                                                        key: Key(
                                                                            'Keyx22_${dataTableIndex}_of_${dataTableCryptoWalletsRecordList.length}'),
                                                                        photoPathPara:
                                                                            valueOrDefault<String>(
                                                                          'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/${functions.allLetterLowerCase(dataTableCryptoWalletsRecord.walletCode)}.svg',
                                                                          'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/btc.svg',
                                                                        ),
                                                                        titlePara:
                                                                            valueOrDefault<String>(
                                                                          functions
                                                                              .firstLetterUpperCase(dataTableCryptoWalletsRecord.walletName),
                                                                          'Coin name',
                                                                        ),
                                                                        descPara:
                                                                            valueOrDefault<String>(
                                                                          functions
                                                                              .allLetterUpperCase(dataTableCryptoWalletsRecord.walletCode),
                                                                          'Shortcode',
                                                                        ),
                                                                        widthPara:
                                                                            30,
                                                                        heightPara:
                                                                            30,
                                                                        titleSizePara:
                                                                            13,
                                                                        descSizePara:
                                                                            11,
                                                                      ),
                                                                    ),
                                                                    Visibility(
                                                                      visible:
                                                                          responsiveVisibility(
                                                                        context:
                                                                            context,
                                                                        phone:
                                                                            false,
                                                                        tablet:
                                                                            false,
                                                                        tabletLandscape:
                                                                            false,
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('LIST_OF_WALLETS_Icon_p8cnlzba_ON_TAP');
                                                                                logFirebaseEvent('Icon_action_block');
                                                                                await action_blocks.copiedAction(
                                                                                  context,
                                                                                  message: dataTableCryptoWalletsRecord.walletAddress,
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                FFIcons.kcopy,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 12.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              dataTableCryptoWalletsRecord.walletAddress,
                                                                              style: FlutterFlowTheme.of(context).bodySmall,
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 3.0, 6.0, 3.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'jiwfklt5' /* Sell */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '1 ${dataTableCryptoWalletsRecord.exchangeCurrency}/${formatNumber(
                                                                                dataTableCryptoWalletsRecord.sellingRate,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                              )} ${dataTableCryptoWalletsRecord.receivedCurrency}',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 3.0, 6.0, 3.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'fuc0xe4a' /* Buy */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '1 ${dataTableCryptoWalletsRecord.exchangeCurrency}/${formatNumber(
                                                                                dataTableCryptoWalletsRecord.buyingRate,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                              )} ${dataTableCryptoWalletsRecord.receivedCurrency}',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 3.0)),
                                                                    ),
                                                                    Visibility(
                                                                      visible:
                                                                          responsiveVisibility(
                                                                        context:
                                                                            context,
                                                                        phone:
                                                                            false,
                                                                        tablet:
                                                                            false,
                                                                        tabletLandscape:
                                                                            false,
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('LIST_OF_WALLETS_Text_664bq5dx_ON_TAP');
                                                                                logFirebaseEvent('Text_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                  useSafeArea: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                        child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: UpdateWalletWidget(
                                                                                          recordRef: dataTableCryptoWalletsRecord.reference,
                                                                                        ),
                                                                                      ),
                                                                                    ));
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '55d5hucz' /* Update */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                      decoration: TextDecoration.underline,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('LIST_OF_WALLETS_Text_7guzfxgl_ON_TAP');
                                                                                logFirebaseEvent('Text_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                  enableDrag: false,
                                                                                  useSafeArea: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                        child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: ReadWalletWidget(
                                                                                          recordRef: dataTableCryptoWalletsRecord.reference,
                                                                                        ),
                                                                                      ),
                                                                                    ));
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'has65kjh' /* Read */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                      decoration: TextDecoration.underline,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('LIST_OF_WALLETS_Text_958islt3_ON_TAP');
                                                                                  logFirebaseEvent('Text_alert_dialog');
                                                                                  await showAlignedDialog(
                                                                                    context: context,
                                                                                    isGlobal: true,
                                                                                    avoidOverflow: false,
                                                                                    targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    builder: (dialogContext) {
                                                                                      return Material(
                                                                                        color: Colors.transparent,
                                                                                        child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: ModalConfirmWidget(
                                                                                            modalTitle: 'Delete record',
                                                                                            modalDesc: 'Are you sure you want to delete ${functions.firstLetterUpperCase(dataTableCryptoWalletsRecord.walletName)} record?',
                                                                                            modalAction: () async {
                                                                                              logFirebaseEvent('_backend_call');
                                                                                              await dataTableCryptoWalletsRecord.reference.delete();
                                                                                              logFirebaseEvent('_close_dialog,_drawer,_etc');
                                                                                              Navigator.pop(context);
                                                                                            },
                                                                                          ),
                                                                                        )),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ude112n6' /* Delete */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        decoration: TextDecoration.underline,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 15.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                                      .map((c) =>
                                                                          DataCell(
                                                                              c))
                                                                      .toList())
                                                              .map((e) =>
                                                                  DataRow(
                                                                      cells: e))
                                                              .toList(),
                                                      headingRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        Color(0x00000000),
                                                      ),
                                                      headingRowHeight: 56.0,
                                                      dataRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                      dataRowHeight: 56.0,
                                                      border: TableBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      dividerThickness: 1.0,
                                                      showBottomBorder: false,
                                                      minWidth: 49.0,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 15.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
