import '/application/backend/d_w_plugins/cryptos/admin/wallets/cryptos/components/update_wallet/update_wallet_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'read_wallet_model.dart';
export 'read_wallet_model.dart';

class ReadWalletWidget extends StatefulWidget {
  const ReadWalletWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _ReadWalletWidgetState createState() => _ReadWalletWidgetState();
}

class _ReadWalletWidgetState extends State<ReadWalletWidget> {
  late ReadWalletModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadWalletModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Container(
              width: 400.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                    spreadRadius: 1.0,
                  )
                ],
                border: Border.all(
                  color: FlutterFlowTheme.of(context).accent4,
                  width: 1.0,
                ),
              ),
              child: StreamBuilder<CryptoWalletsRecord>(
                stream: CryptoWalletsRecord.getDocument(widget.recordRef!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return ShimmerCardWidget();
                  }
                  final columnCryptoWalletsRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.modalHeaderModel,
                        updateCallback: () => setState(() {}),
                        child: ModalHeaderWidget(
                          headerTitlePara:
                              '${functions.firstLetterUpperCase(columnCryptoWalletsRecord.walletName)} Information',
                          headerTitleTextColorPara:
                              FlutterFlowTheme.of(context).primaryText,
                          headerActionPara: () async {
                            logFirebaseEvent(
                                'READ_WALLET_Container_1yl2nhtu_CALLBACK');
                            logFirebaseEvent('ModalHeader_bottom_sheet');
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'dne8j609' /* Coin name: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    columnCryptoWalletsRecord.walletName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 110.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '28exdsv8' /* Coin shortname: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      functions.allLetterUpperCase(
                                          columnCryptoWalletsRecord.walletCode),
                                      'COIN',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'k65756g7' /* Network: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    columnCryptoWalletsRecord.walletNetwork,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 120.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'zquanzo5' /* Wallet: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(1.00, 0.00),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'READ_WALLET_COMP_Icon_3fen96wv_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_action_block');
                                                await action_blocks
                                                    .copiedAction(
                                                  context,
                                                  message:
                                                      columnCryptoWalletsRecord
                                                          .walletAddress,
                                                );
                                              },
                                              child: Icon(
                                                FFIcons.kcopy,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                            ),
                                            Text(
                                              columnCryptoWalletsRecord
                                                  .walletAddress,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily),
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'd1hlacj2' /* Currency: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    '${columnCryptoWalletsRecord.exchangeCurrency}/${columnCryptoWalletsRecord.receivedCurrency}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        's0l033tk' /* Buying rate: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    '${columnCryptoWalletsRecord.receivedCurrency} ${formatNumber(
                                      columnCryptoWalletsRecord.buyingRate,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.automatic,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'c6hxayvq' /* Selling rate: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    '${columnCryptoWalletsRecord.receivedCurrency} ${columnCryptoWalletsRecord.sellingRate.toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                              wrapWithModel(
                                model: _model.primaryButtonModel1,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: PrimaryButtonWidget(
                                  buttonText: 'Edit',
                                  buttonBgColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  buttonTextColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  buttonWidth: 400,
                                  buttonHeight: 40,
                                  disableStatusPara: false,
                                  buttonAction: () async {
                                    logFirebaseEvent(
                                        'READ_WALLET_Container_bg08psln_CALLBACK');
                                    logFirebaseEvent(
                                        'PrimaryButton_close_dialog,_drawer,_etc');
                                    Navigator.pop(context);
                                    logFirebaseEvent(
                                        'PrimaryButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).overlay,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                            child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: UpdateWalletWidget(
                                            recordRef: columnCryptoWalletsRecord
                                                .reference,
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.primaryButtonModel2,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: PrimaryButtonWidget(
                                  buttonText: 'Delete',
                                  buttonBgColor:
                                      FlutterFlowTheme.of(context).lineColor,
                                  buttonTextColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  buttonWidth: 400,
                                  buttonHeight: 40,
                                  disableStatusPara: false,
                                  buttonAction: () async {
                                    logFirebaseEvent(
                                        'READ_WALLET_Container_jhlyrtvi_CALLBACK');
                                    logFirebaseEvent(
                                        'PrimaryButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).overlay,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                            child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ModalConfirmWidget(
                                            modalTitle: 'Delete record',
                                            modalDesc:
                                                'Are you sure you want to delete ${functions.firstLetterUpperCase(columnCryptoWalletsRecord.walletName)} record?',
                                            modalAction: () async {
                                              logFirebaseEvent('_backend_call');
                                              await columnCryptoWalletsRecord
                                                  .reference
                                                  .delete();
                                              logFirebaseEvent(
                                                  '_close_dialog,_drawer,_etc');
                                              Navigator.pop(context);
                                              logFirebaseEvent('_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 20.0))
                                .around(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
