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
import 'create_order_model.dart';
export 'create_order_model.dart';

class CreateOrderWidget extends StatefulWidget {
  const CreateOrderWidget({
    Key? key,
    this.orderType,
  }) : super(key: key);

  final String? orderType;

  @override
  _CreateOrderWidgetState createState() => _CreateOrderWidgetState();
}

class _CreateOrderWidgetState extends State<CreateOrderWidget>
    with TickerProviderStateMixin {
  late CreateOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasColumnTriggered = false;
  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(40.0, -58.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateOrderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreateOrder'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_ORDER_CreateOrder_ON_INIT_STATE');
      logFirebaseEvent('CreateOrder_firestore_query');
      _model.getRateFromFirebase = await queryCryptoWalletsRecordOnce(
        queryBuilder: (cryptoWalletsRecord) => cryptoWalletsRecord.where(
          'wallet_code',
          isEqualTo: 'btc',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('CreateOrder_set_form_field');
      setState(() {
        _model.textFieldReceivedController?.text = (_model.tender! *
                valueOrDefault<double>(
                  _model.getRateData?.buyingRate == null
                      ? _model.getRateFromFirebase?.buyingRate
                      : _model.getRateData?.buyingRate,
                  0.0,
                ))
            .toString();
      });
    });

    _model.textFieldTenderController ??= TextEditingController();
    _model.textFieldTenderFocusNode ??= FocusNode();

    _model.textFieldReceivedController ??= TextEditingController();
    _model.textFieldReceivedFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textFieldTenderController?.text =
              FFLocalizations.of(context).getText(
            '3vxdu3el' /* 1000 */,
          );
        }));
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
        title: 'Create order',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
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
                          'CREATE_ORDER_PAGE_arrowLeft2_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'p4q90th9' /* Create order */,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.dWSidebarModel,
                  updateCallback: () => setState(() {}),
                  child: DWSidebarWidget(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.dWHeaderModel,
                          updateCallback: () => setState(() {}),
                          child: DWHeaderWidget(
                            pageTitle: 'Create order',
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 500.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 15.0),
                                child:
                                    StreamBuilder<List<CryptoSettingsRecord>>(
                                  stream: queryCryptoSettingsRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Container(
                                        width: double.infinity,
                                        child: ShimmerCardWidget(),
                                      );
                                    }
                                    List<CryptoSettingsRecord>
                                        columnCryptoSettingsRecordList =
                                        snapshot.data!;
                                    final columnCryptoSettingsRecord =
                                        columnCryptoSettingsRecordList
                                                .isNotEmpty
                                            ? columnCryptoSettingsRecordList
                                                .first
                                            : null;
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .amountProgressState ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Divider(
                                                                thickness: 2.0,
                                                                color: _model
                                                                            .amountProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gcbdqasz' /* Amount */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: _model
                                                                            .amountProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .recipientProgressState ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Divider(
                                                                thickness: 2.0,
                                                                color: _model
                                                                            .recipientProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'i252jy05' /* Recipient */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: _model
                                                                            .recipientProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .reviewProgressState ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Divider(
                                                                thickness: 2.0,
                                                                color: _model
                                                                            .reviewProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'h6a5atfb' /* Review */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: _model
                                                                            .reviewProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .confirmProgressState ==
                                                                    true
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Divider(
                                                                thickness: 2.0,
                                                                color: _model
                                                                            .confirmProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'vnx8q62o' /* Confirm */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: _model
                                                                            .confirmProgressState ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        StreamBuilder<
                                            List<CryptoWalletsRecord>>(
                                          stream: queryCryptoWalletsRecord(
                                            queryBuilder:
                                                (cryptoWalletsRecord) =>
                                                    cryptoWalletsRecord.where(
                                              'wallet_code',
                                              isEqualTo: 'btc',
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Container(
                                                width: double.infinity,
                                                child: ShimmerCardWidget(),
                                              );
                                            }
                                            List<CryptoWalletsRecord>
                                                containerCryptoWalletsRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final containerCryptoWalletsRecord =
                                                containerCryptoWalletsRecordList
                                                        .isNotEmpty
                                                    ? containerCryptoWalletsRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (_model.confirmState ==
                                                          true) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'hdk3bmk1' /* Please confirm the recipient i... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '7hu0kqa4' /* Bank Name */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                      Text(
                                                                        _model.createRecipientCompModel.textFieldBankNameController.text != null &&
                                                                                _model.createRecipientCompModel.textFieldBankNameController.text != ''
                                                                            ? _model.createRecipientCompModel.textFieldBankNameController.text
                                                                            : _model.getRecipientDataModel.inputTextFieldBankNameModel.textController.text,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '834k0tm5' /* Account Number */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                      Text(
                                                                        _model.createRecipientCompModel.textFieldAccountNumberController.text != null &&
                                                                                _model.createRecipientCompModel.textFieldAccountNumberController.text != ''
                                                                            ? _model.createRecipientCompModel.textFieldAccountNumberController.text
                                                                            : _model.getRecipientDataModel.inputTextFieldAccountNumberModel.textController.text,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'fryodclo' /* Account Name */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                      Text(
                                                                        _model.createRecipientCompModel.textFieldAccountNameController.text != null &&
                                                                                _model.createRecipientCompModel.textFieldAccountNameController.text != ''
                                                                            ? _model.createRecipientCompModel.textFieldAccountNameController.text
                                                                            : _model.getRecipientDataModel.inputTextFieldAccountNameModel.textController.text,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        15.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 25.0)),
                                                          ),
                                                        );
                                                      } else if (_model
                                                              .reviewState ==
                                                          true) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      25.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            0.0,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 0.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'vpaxh64u' /* Order summary */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '5pe9g0f1' /* Date */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                  Text(
                                                                                    '${dateTimeFormat(
                                                                                      'yMMMd',
                                                                                      getCurrentTimestamp,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )} ${dateTimeFormat(
                                                                                      'jm',
                                                                                      getCurrentTimestamp,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )}',
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'l9zrnoe5' /* Order Reference */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'ae32vpou' /* Order Id */,
                                                                                    ),
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'nezjbs2a' /* Amount Tender */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                  Text(
                                                                                    '${_model.textFieldTenderController.text} ${columnCryptoSettingsRecord?.pluginCurrency}',
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '02f1qa87' /* Exchange Rate */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      _model.getRateData?.buyingRate != null ? '${_model.getRateData?.buyingRate?.toString()} ${columnCryptoSettingsRecord?.pluginReceivedCurrency}' : '${containerCryptoWalletsRecord?.buyingRate?.toString()} ${columnCryptoSettingsRecord?.pluginReceivedCurrency}',
                                                                                      'COIN',
                                                                                    ),
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'xidclh6l' /* Received */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                  Text(
                                                                                    '${_model.textFieldReceivedController.text} ${columnCryptoSettingsRecord?.pluginReceivedCurrency}',
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ].divide(SizedBox(height: 15.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            width:
                                                                                0.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '39h9zplx' /* Payment method */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'a4zqzs4u' /* Bank Transfer */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '69w6g6kz' /* Recipient */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        _model.createRecipientCompModel.dropDownAccountOwnerValue != null && _model.createRecipientCompModel.dropDownAccountOwnerValue != '' ? _model.createRecipientCompModel.dropDownAccountOwnerValue : _model.getRecipientDataModel.inputTextFieldAccountOwnerModel.textController.text,
                                                                                        'Myself',
                                                                                      ),
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'oga3smk7' /* Bank Name */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      _model.createRecipientCompModel.textFieldBankNameController.text != null && _model.createRecipientCompModel.textFieldBankNameController.text != '' ? _model.createRecipientCompModel.textFieldBankNameController.text : _model.getRecipientDataModel.inputTextFieldBankNameModel.textController.text,
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'zzedy3ln' /* Account Number */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                Text(
                                                                                  _model.createRecipientCompModel.textFieldAccountNumberController.text != null && _model.createRecipientCompModel.textFieldAccountNumberController.text != '' ? _model.createRecipientCompModel.textFieldAccountNumberController.text : _model.getRecipientDataModel.inputTextFieldAccountNumberModel.textController.text,
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'igwl67pm' /* Account Name */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                Text(
                                                                                  _model.createRecipientCompModel.textFieldAccountNameController.text != null && _model.createRecipientCompModel.textFieldAccountNameController.text != '' ? _model.createRecipientCompModel.textFieldAccountNameController.text : _model.getRecipientDataModel.inputTextFieldAccountNameModel.textController.text,
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'iagnrg55' /* Country */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    _model.createRecipientCompModel.dropDownCountryValue != null && _model.createRecipientCompModel.dropDownCountryValue != '' ? _model.createRecipientCompModel.dropDownCountryValue : _model.getRecipientDataModel.inputTextFieldCountryModel.textController.text,
                                                                                    'NG',
                                                                                  ),
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(height: 15.0)),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        height:
                                                                            2.0,
                                                                        thickness:
                                                                            1.0,
                                                                        indent:
                                                                            16.0,
                                                                        endIndent:
                                                                            16.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            30.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .primaryButtonLoadingModel,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          PrimaryButtonLoadingWidget(
                                                                        buttonText:
                                                                            'Confirm',
                                                                        buttonHeight:
                                                                            50,
                                                                        disableStatusPara:
                                                                            false,
                                                                        buttonAction:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'CREATE_ORDER_Container_kclj7hc0_CALLBACK');
                                                                          final firestoreBatch = FirebaseFirestore
                                                                              .instance
                                                                              .batch();
                                                                          try {
                                                                            logFirebaseEvent('PrimaryButtonLoading_firestore_query');
                                                                            _model.checkIfRecipientExist =
                                                                                await queryDwRecipientsRecordOnce(
                                                                              queryBuilder: (dwRecipientsRecord) => dwRecipientsRecord.where(
                                                                                'user_ref',
                                                                                isEqualTo: currentUserReference,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            if ((_model.createRecipientCompModel.textFieldAccountNumberController.text == _model.checkIfRecipientExist?.accountNumber) &&
                                                                                (_model.createRecipientCompModel.textFieldBankNameController.text == _model.checkIfRecipientExist?.bankName)) {
                                                                              // Action 2 - Create new order
                                                                              logFirebaseEvent('PrimaryButtonLoading_Action2-Createnewor');

                                                                              firestoreBatch.set(
                                                                                  CryptoOrdersRecord.collection.doc(),
                                                                                  createCryptoOrdersRecordData(
                                                                                    createdAt: getCurrentTimestamp,
                                                                                    userRef: currentUserReference,
                                                                                    country: valueOrDefault<String>(
                                                                                      _model.createRecipientCompModel.dropDownCountryValue != null && _model.createRecipientCompModel.dropDownCountryValue != '' ? _model.createRecipientCompModel.dropDownCountryValue : _model.getRecipientDataModel.inputTextFieldCountryModel.textController.text,
                                                                                      'NG',
                                                                                    ),
                                                                                    tender: _model.tender,
                                                                                    received: double.tryParse(_model.textFieldReceivedController.text),
                                                                                    buyingRate: containerCryptoWalletsRecord?.buyingRate,
                                                                                    bankName: _model.createRecipientCompModel.textFieldBankNameController.text != null && _model.createRecipientCompModel.textFieldBankNameController.text != '' ? _model.createRecipientCompModel.textFieldBankNameController.text : _model.getRecipientDataModel.inputTextFieldBankNameModel.textController.text,
                                                                                    accountNumber: 090,
                                                                                    accountName: _model.createRecipientCompModel.textFieldAccountNameController.text != null && _model.createRecipientCompModel.textFieldAccountNameController.text != '' ? _model.createRecipientCompModel.textFieldAccountNameController.text : _model.getRecipientDataModel.inputTextFieldAccountNameModel.textController.text,
                                                                                    orderType: widget.orderType,
                                                                                    orderWalletName: valueOrDefault<String>(
                                                                                      _model.getRateData?.walletCode == null || _model.getRateData?.walletCode == ''
                                                                                          ? functions.allLetterUpperCase(containerCryptoWalletsRecord?.walletCode)
                                                                                          : valueOrDefault<String>(
                                                                                              functions.allLetterUpperCase(_model.getRateData?.walletCode),
                                                                                              'BTC',
                                                                                            ),
                                                                                      'COIN',
                                                                                    ),
                                                                                  ));
                                                                            } else {
                                                                              // Action 2 - Create new order
                                                                              logFirebaseEvent('PrimaryButtonLoading_Action2-Createnewor');

                                                                              firestoreBatch.set(
                                                                                  CryptoOrdersRecord.collection.doc(),
                                                                                  createCryptoOrdersRecordData(
                                                                                    createdAt: getCurrentTimestamp,
                                                                                    userRef: currentUserReference,
                                                                                    country: valueOrDefault<String>(
                                                                                      _model.createRecipientCompModel.dropDownCountryValue != null && _model.createRecipientCompModel.dropDownCountryValue != '' ? _model.createRecipientCompModel.dropDownCountryValue : _model.getRecipientDataModel.inputTextFieldCountryModel.textController.text,
                                                                                      'NG',
                                                                                    ),
                                                                                    tender: _model.tender,
                                                                                    received: double.tryParse(_model.textFieldReceivedController.text),
                                                                                    buyingRate: containerCryptoWalletsRecord?.buyingRate,
                                                                                    bankName: _model.createRecipientCompModel.textFieldBankNameController.text != null && _model.createRecipientCompModel.textFieldBankNameController.text != '' ? _model.createRecipientCompModel.textFieldBankNameController.text : _model.getRecipientDataModel.inputTextFieldBankNameModel.textController.text,
                                                                                    accountNumber: 090,
                                                                                    accountName: _model.createRecipientCompModel.textFieldAccountNameController.text != null && _model.createRecipientCompModel.textFieldAccountNameController.text != '' ? _model.createRecipientCompModel.textFieldAccountNameController.text : _model.getRecipientDataModel.inputTextFieldAccountNameModel.textController.text,
                                                                                    orderType: widget.orderType,
                                                                                    orderWalletName: valueOrDefault<String>(
                                                                                      _model.getRateData?.walletCode == null || _model.getRateData?.walletCode == ''
                                                                                          ? functions.allLetterUpperCase(containerCryptoWalletsRecord?.walletCode)
                                                                                          : valueOrDefault<String>(
                                                                                              functions.allLetterUpperCase(_model.getRateData?.walletCode),
                                                                                              'BTC',
                                                                                            ),
                                                                                      'COIN',
                                                                                    ),
                                                                                    orderStatus: 'Pending',
                                                                                    orderWallet: valueOrDefault<String>(
                                                                                      _model.getRateData?.walletAddress != null && _model.getRateData?.walletAddress != '' ? _model.getRateData?.walletAddress : containerCryptoWalletsRecord?.walletAddress,
                                                                                      'COIN',
                                                                                    ),
                                                                                    orderNetwork: valueOrDefault<String>(
                                                                                      _model.getRateData?.walletNetwork != null && _model.getRateData?.walletNetwork != '' ? _model.getRateData?.walletNetwork : containerCryptoWalletsRecord?.walletNetwork,
                                                                                      'COIN',
                                                                                    ),
                                                                                    uuid: functions.uUIDReference(),
                                                                                  ));
                                                                              // Action 3 - Save to Recipent List
                                                                              logFirebaseEvent('PrimaryButtonLoading_Action3-SavetoRecip');

                                                                              firestoreBatch.set(
                                                                                  DwRecipientsRecord.collection.doc(),
                                                                                  createDwRecipientsRecordData(
                                                                                    country: 'NG',
                                                                                    bankName: _model.createRecipientCompModel.textFieldBankNameController.text,
                                                                                    accountNumber: _model.createRecipientCompModel.textFieldAccountNumberController.text,
                                                                                    accountName: _model.createRecipientCompModel.textFieldAccountNameController.text,
                                                                                    accountOwner: _model.createRecipientCompModel.dropDownAccountOwnerValue,
                                                                                    userRef: currentUserReference,
                                                                                    createdAt: getCurrentTimestamp,
                                                                                  ));
                                                                              logFirebaseEvent('PrimaryButtonLoading_navigate_to');

                                                                              context.pushNamed(
                                                                                'OrderSuccessful',
                                                                                queryParameters: {
                                                                                  'orderAmount': serializeParam(
                                                                                    _model.textFieldTenderController.text,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            }
                                                                          } finally {
                                                                            await firestoreBatch.commit();
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else if (_model
                                                              .recipientState ==
                                                          true) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      30.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (_model
                                                                          .recipientTypeState ==
                                                                      'New') {
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.titleWithBackButtonModel1,
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          child:
                                                                              TitleWithBackButtonWidget(
                                                                            titleName:
                                                                                'Enter recipient account details',
                                                                            titleSize:
                                                                                15,
                                                                            actionPara:
                                                                                () async {
                                                                              logFirebaseEvent('CREATE_ORDER_Container_23ptv527_CALLBACK');
                                                                              logFirebaseEvent('TitleWithBackButton_update_page_state');
                                                                              setState(() {
                                                                                _model.recipientTypeState = '';
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              visualDensity: VisualDensity.compact,
                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              CheckboxListTile(
                                                                            value: _model.checkboxListTileValue ??=
                                                                                false,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.checkboxListTileValue = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '9whfgq5s' /* Save as new recipient */,
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                  ),
                                                                            ),
                                                                            tileColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            dense:
                                                                                true,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                          ),
                                                                        ),
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.createRecipientCompModel,
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              CreateRecipientCompWidget(
                                                                            submitActionPara:
                                                                                () async {
                                                                              logFirebaseEvent('CREATE_ORDER_Container_37zw8s2t_CALLBACK');
                                                                              logFirebaseEvent('CreateRecipientComp_update_page_state');
                                                                              setState(() {
                                                                                _model.recipientProgressState = true;
                                                                                _model.reviewState = true;
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 10.0)),
                                                                    );
                                                                  } else if (_model
                                                                          .recipientTypeState ==
                                                                      'ListOfRecipients') {
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.titleWithBackButtonModel2,
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          child:
                                                                              TitleWithBackButtonWidget(
                                                                            titleName:
                                                                                'List of Recipients',
                                                                            titleSize:
                                                                                15,
                                                                            actionPara:
                                                                                () async {
                                                                              logFirebaseEvent('CREATE_ORDER_Container_59bj04g6_CALLBACK');
                                                                              logFirebaseEvent('TitleWithBackButton_update_page_state');
                                                                              setState(() {
                                                                                _model.recipientTypeState = '';
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child: PagedListView<
                                                                              DocumentSnapshot<Object?>?,
                                                                              DwRecipientsRecord>(
                                                                            pagingController:
                                                                                _model.setListViewController(
                                                                              DwRecipientsRecord.collection.where(
                                                                                'user_ref',
                                                                                isEqualTo: currentUserReference,
                                                                              ),
                                                                            ),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            reverse:
                                                                                false,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            builderDelegate:
                                                                                PagedChildBuilderDelegate<DwRecipientsRecord>(
                                                                              // Customize what your widget looks like when it's loading the first page.
                                                                              firstPageProgressIndicatorBuilder: (_) => ShimmerListOfListsWidget(),
                                                                              // Customize what your widget looks like when it's loading another page.
                                                                              newPageProgressIndicatorBuilder: (_) => ShimmerListOfListsWidget(),
                                                                              noItemsFoundIndicatorBuilder: (_) => Container(
                                                                                width: double.infinity,
                                                                                child: EmptyTableWidget(
                                                                                  buttonActionPara: () async {},
                                                                                ),
                                                                              ),
                                                                              itemBuilder: (context, _, listViewIndex) {
                                                                                final listViewDwRecipientsRecord = _model.listViewPagingController!.itemList![listViewIndex];
                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CREATE_ORDER_PAGE_Container_ON_TAP');
                                                                                    logFirebaseEvent('Container_update_page_state');
                                                                                    setState(() {
                                                                                      _model.recipientDataRef = listViewDwRecipientsRecord.reference;
                                                                                    });
                                                                                    logFirebaseEvent('Container_update_page_state');
                                                                                    setState(() {
                                                                                      _model.recipientTypeState = 'GetRecipientData';
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      functions.allFirstLetterUpperCase(listViewDwRecipientsRecord.accountName),
                                                                                                      'Fullname',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 1.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    listViewDwRecipientsRecord.accountNumber,
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          letterSpacing: 1.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                        ),
                                                                                                  )),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                                                                                                        child: SelectionArea(
                                                                                                            child: Text(
                                                                                                          listViewDwRecipientsRecord.bankName.maybeHandleOverflow(
                                                                                                            maxChars: 20,
                                                                                                            replacement: '…',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 10.0,
                                                                                                                letterSpacing: 1.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        )),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 5.0)),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                FFIcons.karrowRight3,
                                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                                size: 18.0,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  } else if (_model
                                                                          .recipientTypeState ==
                                                                      'GetRecipientData') {
                                                                    return StreamBuilder<
                                                                        DwRecipientsRecord>(
                                                                      stream: DwRecipientsRecord.getDocument(
                                                                          _model
                                                                              .recipientDataRef!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                LinearProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          );
                                                                        }
                                                                        final columnDwRecipientsRecord =
                                                                            snapshot.data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            wrapWithModel(
                                                                              model: _model.titleWithBackButtonModel3,
                                                                              updateCallback: () => setState(() {}),
                                                                              child: TitleWithBackButtonWidget(
                                                                                titleName: 'Recipient details',
                                                                                titleSize: 15,
                                                                                actionPara: () async {
                                                                                  logFirebaseEvent('CREATE_ORDER_Container_jka7fm0l_CALLBACK');
                                                                                  logFirebaseEvent('TitleWithBackButton_update_page_state');
                                                                                  setState(() {
                                                                                    _model.recipientTypeState = '';
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                            wrapWithModel(
                                                                              model: _model.getRecipientDataModel,
                                                                              updateCallback: () => setState(() {}),
                                                                              updateOnChange: true,
                                                                              child: GetRecipientDataWidget(
                                                                                countryPara: columnDwRecipientsRecord.country,
                                                                                accountOwnerPara: columnDwRecipientsRecord.accountOwner,
                                                                                bankNamePara: columnDwRecipientsRecord.bankName,
                                                                                accountNumberPara: columnDwRecipientsRecord.accountNumber,
                                                                                accountNamePara: columnDwRecipientsRecord.accountName,
                                                                              ),
                                                                            ),
                                                                            wrapWithModel(
                                                                              model: _model.primaryButtonModel1,
                                                                              updateCallback: () => setState(() {}),
                                                                              child: PrimaryButtonWidget(
                                                                                buttonText: 'Continue',
                                                                                buttonWidth: 500,
                                                                                buttonHeight: 50,
                                                                                disableStatusPara: false,
                                                                                buttonAction: () async {
                                                                                  logFirebaseEvent('CREATE_ORDER_Container_5g8lruj7_CALLBACK');
                                                                                  logFirebaseEvent('PrimaryButton_update_page_state');
                                                                                  setState(() {
                                                                                    _model.recipientProgressState = true;
                                                                                    _model.reviewState = true;
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 20.0)),
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('CREATE_ORDER_Container_hyydojtb_ON_TAP');
                                                                            logFirebaseEvent('MenuServiceBox_update_page_state');
                                                                            setState(() {
                                                                              _model.recipientTypeState = 'New';
                                                                            });
                                                                          },
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.menuServiceBoxModel1,
                                                                            updateCallback: () =>
                                                                                setState(() {}),
                                                                            child:
                                                                                MenuServiceBoxWidget(
                                                                              iconPara: Icon(
                                                                                FFIcons.kuser,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                              textPara: 'New Recipient',
                                                                              iconBgColor: FlutterFlowTheme.of(context).lineColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('CREATE_ORDER_Container_fs1zap9a_ON_TAP');
                                                                            logFirebaseEvent('MenuServiceBox_update_page_state');
                                                                            setState(() {
                                                                              _model.recipientTypeState = 'ListOfRecipients';
                                                                            });
                                                                          },
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.menuServiceBoxModel2,
                                                                            updateCallback: () =>
                                                                                setState(() {}),
                                                                            child:
                                                                                MenuServiceBoxWidget(
                                                                              iconPara: Icon(
                                                                                FFIcons.kpeople,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                              textPara: 'Choose from Recipient',
                                                                              iconBgColor: FlutterFlowTheme.of(context).lineColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'columnOnActionTriggerAnimation']!,
                                                              hasBeenTriggered:
                                                                  hasColumnTriggered),
                                                        );
                                                      } else {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Form(
                                                              key: _model
                                                                  .formKey,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .disabled,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'oy1kcbq6' /* You sell exactly */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                TextFormField(
                                                                                  controller: _model.textFieldTenderController,
                                                                                  focusNode: _model.textFieldTenderFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.textFieldTenderController',
                                                                                    Duration(milliseconds: 0),
                                                                                    () async {
                                                                                      logFirebaseEvent('CREATE_ORDER_TextField-Tender_ON_TEXTFIE');
                                                                                      logFirebaseEvent('TextField-Tender_update_page_state');
                                                                                      setState(() {
                                                                                        _model.tender = double.tryParse(_model.textFieldTenderController.text);
                                                                                      });
                                                                                      logFirebaseEvent('TextField-Tender_set_form_field');
                                                                                      setState(() {
                                                                                        _model.textFieldReceivedController?.text = (_model.tender! *
                                                                                                valueOrDefault<double>(
                                                                                                  _model.getRateData?.buyingRate == null ? containerCryptoWalletsRecord?.buyingRate : _model.getRateData?.buyingRate,
                                                                                                  0.0,
                                                                                                ))
                                                                                            .toString();
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                  textCapitalization: TextCapitalization.none,
                                                                                  textInputAction: TextInputAction.go,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    isDense: true,
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).lineColor,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 100.0, 20.0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 22.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                  validator: _model.textFieldTenderControllerValidator.asValidator(context),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.00, 0.00),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 60.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(8.0),
                                                                                        topLeft: Radius.circular(0.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        columnCryptoSettingsRecord!.pluginCurrency,
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              fontSize: 22.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              _model.tender.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 12.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            RichText(
                                                                              textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      _model.getRateData?.walletCode == null || _model.getRateData?.walletCode == ''
                                                                                          ? functions.allLetterUpperCase(containerCryptoWalletsRecord?.walletCode)
                                                                                          : valueOrDefault<String>(
                                                                                              functions.allLetterUpperCase(_model.getRateData?.walletCode),
                                                                                              'BTC',
                                                                                            ),
                                                                                      'COIN',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          decoration: TextDecoration.underline,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    mouseCursor: SystemMouseCursors.click,
                                                                                    recognizer: TapGestureRecognizer()
                                                                                      ..onTap = () async {
                                                                                        logFirebaseEvent('CREATE_ORDER_RichTextSpan_z75uizm1_ON_TA');
                                                                                        logFirebaseEvent('RichTextSpan_bottom_sheet');
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          barrierColor: Colors.transparent,
                                                                                          useSafeArea: true,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return WebViewAware(
                                                                                                child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: ListOfWalletRateWidget(),
                                                                                            ));
                                                                                          },
                                                                                        ).then((value) => safeSetState(() => _model.getRateData = value));

                                                                                        setState(() {});
                                                                                      },
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '3aks9swg' /*  price:  */,
                                                                                    ),
                                                                                    style: TextStyle(
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'j9hfrd06' /* 1.00  */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      _model.getRateData?.exchangeCurrency == null || _model.getRateData?.exchangeCurrency == '' ? containerCryptoWalletsRecord?.exchangeCurrency : _model.getRateData?.exchangeCurrency,
                                                                                      'COIN',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'ola2fthp' /*  /  */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      _model.getRateData?.buyingRate == null
                                                                                          ? containerCryptoWalletsRecord?.buyingRate?.toString()
                                                                                          : formatNumber(
                                                                                              _model.getRateData?.buyingRate,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.automatic,
                                                                                            ),
                                                                                      'COIN',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      _model.getRateData?.receivedCurrency == null || _model.getRateData?.receivedCurrency == '' ? containerCryptoWalletsRecord?.receivedCurrency : _model.getRateData?.receivedCurrency,
                                                                                      'COIN',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'zupii52d' /* Bank transfer fee */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                '${formatNumber(
                                                                                  columnCryptoSettingsRecord?.pluginBankTransferFee,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                )} ${columnCryptoSettingsRecord?.pluginReceivedCurrency}',
                                                                                '0.00 CUR',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'lzf0svsn' /* Transaction fee */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                '${formatNumber(
                                                                                  columnCryptoSettingsRecord?.pluginTransactionFee,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                )} ${columnCryptoSettingsRecord?.pluginReceivedCurrency}',
                                                                                '0.00 CUR',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 10.0)),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'h5hdiwq4' /* Recipient get */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textFieldReceivedController,
                                                                                    focusNode: _model.textFieldReceivedFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.textFieldReceivedController',
                                                                                      Duration(milliseconds: 0),
                                                                                      () async {
                                                                                        logFirebaseEvent('CREATE_ORDER_TextField-Received_ON_TEXTF');
                                                                                        logFirebaseEvent('TextField-Received_update_page_state');
                                                                                        setState(() {
                                                                                          _model.receiver = double.tryParse(_model.textFieldReceivedController.text);
                                                                                        });
                                                                                        logFirebaseEvent('TextField-Received_set_form_field');
                                                                                        setState(() {
                                                                                          _model.textFieldTenderController?.text = (double.parse(_model.textFieldReceivedController.text) /
                                                                                                  valueOrDefault<double>(
                                                                                                    _model.getRateData?.buyingRate == null ? containerCryptoWalletsRecord?.buyingRate : _model.getRateData?.buyingRate,
                                                                                                    0.0,
                                                                                                  ))
                                                                                              .toString();
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    textCapitalization: TextCapitalization.none,
                                                                                    textInputAction: TextInputAction.go,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      hintStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 22.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).lineColor,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 100.0, 20.0),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                    validator: _model.textFieldReceivedControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.00, 0.00),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 60.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(8.0),
                                                                                        topLeft: Radius.circular(0.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                      child: Text(
                                                                                        columnCryptoSettingsRecord!.pluginReceivedCurrency,
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              fontSize: 22.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.primaryButtonModel2,
                                                                            updateCallback: () =>
                                                                                setState(() {}),
                                                                            updateOnChange:
                                                                                true,
                                                                            child:
                                                                                PrimaryButtonWidget(
                                                                              buttonText: 'Continue',
                                                                              buttonHeight: 50,
                                                                              disableStatusPara: _model.textFieldReceivedController.text == null || _model.textFieldReceivedController.text == '',
                                                                              disableColorPara: FlutterFlowTheme.of(context).lineColor,
                                                                              buttonAction: () async {
                                                                                logFirebaseEvent('CREATE_ORDER_Container_9a95mg17_CALLBACK');
                                                                                logFirebaseEvent('PrimaryButton_update_page_state');
                                                                                setState(() {
                                                                                  _model.amountState = true;
                                                                                  _model.amountProgressState = true;
                                                                                });
                                                                                logFirebaseEvent('PrimaryButton_widget_animation');
                                                                                if (animationsMap['columnOnActionTriggerAnimation'] != null) {
                                                                                  setState(() => hasColumnTriggered = true);
                                                                                  SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['columnOnActionTriggerAnimation']!.controller.forward(from: 0.0));
                                                                                }
                                                                                logFirebaseEvent('PrimaryButton_update_page_state');
                                                                                setState(() {
                                                                                  _model.recipientState = true;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          25.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
