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
import 'update_wallet_model.dart';
export 'update_wallet_model.dart';

class UpdateWalletWidget extends StatefulWidget {
  const UpdateWalletWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _UpdateWalletWidgetState createState() => _UpdateWalletWidgetState();
}

class _UpdateWalletWidgetState extends State<UpdateWalletWidget> {
  late UpdateWalletModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateWalletModel());

    _model.textFieldCoinnameFocusNode ??= FocusNode();

    _model.textFieldCoincodeFocusNode ??= FocusNode();

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.modalHeaderModel,
                    updateCallback: () => setState(() {}),
                    child: ModalHeaderWidget(
                      headerTitlePara: 'Update Wallet',
                      headerTitleTextColorPara:
                          FlutterFlowTheme.of(context).primaryText,
                      headerActionPara: () async {
                        logFirebaseEvent(
                            'UPDATE_WALLET_Container_r0j766yv_CALLBAC');
                        logFirebaseEvent('ModalHeader_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: StreamBuilder<CryptoWalletsRecord>(
                        stream:
                            CryptoWalletsRecord.getDocument(widget.recordRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: LinearProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            );
                          }
                          final columnCryptoWalletsRecord = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'lupjsow9' /* Choose Coin */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'UPDATE_WALLET_COMP_Stack_6tqopyoi_ON_TAP');
                                          logFirebaseEvent(
                                              'Stack_alert_dialog');
                                          await showAlignedDialog(
                                            barrierColor: Colors.transparent,
                                            context: context,
                                            isGlobal: false,
                                            avoidOverflow: false,
                                            targetAnchor: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                AlignmentDirectional(0.0, -1.15)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: WebViewAware(
                                                    child: Container(
                                                  width: 360.0,
                                                  child:
                                                      ListOfCoinsFromApiWidget(),
                                                )),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.getCoinData = value));

                                          logFirebaseEvent(
                                              'Stack_set_form_field');
                                          setState(() {
                                            _model.textFieldCoinnameController
                                                ?.text = getJsonField(
                                              _model.getCoinData,
                                              r'''$.name''',
                                            ).toString();
                                          });
                                          logFirebaseEvent(
                                              'Stack_set_form_field');
                                          setState(() {
                                            _model.textFieldCoincodeController
                                                ?.text = getJsonField(
                                              _model.getCoinData,
                                              r'''$.symbol''',
                                            ).toString();
                                          });

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 7.0, 10.0, 7.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: getCORSProxyUrl(
                                                        valueOrDefault<String>(
                                                          'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/${valueOrDefault<String>(
                                                            getJsonField(
                                                                      _model
                                                                          .getCoinData,
                                                                      r'''$.symbol''',
                                                                    ) !=
                                                                    null
                                                                ? getJsonField(
                                                                    _model
                                                                        .getCoinData,
                                                                    r'''$.symbol''',
                                                                  ).toString()
                                                                : columnCryptoWalletsRecord
                                                                    .walletCode,
                                                            'btc',
                                                          )}.svg',
                                                          'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/btc.svg',
                                                        ),
                                                      ),
                                                      width: 25.0,
                                                      height: 25.0,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 25.0,
                                                        height: 25.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                          .textFieldCoinnameController ??=
                                                      TextEditingController(
                                                    text:
                                                        valueOrDefault<String>(
                                                      getJsonField(
                                                                _model
                                                                    .getCoinData,
                                                                r'''$.name''',
                                                              ) !=
                                                              null
                                                          ? getJsonField(
                                                              _model
                                                                  .getCoinData,
                                                              r'''$.name''',
                                                            ).toString()
                                                          : columnCryptoWalletsRecord
                                                              .walletName,
                                                      'Bitcoin',
                                                    ),
                                                  ),
                                                  focusNode: _model
                                                      .textFieldCoinnameFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textFieldCoinnameController',
                                                    Duration(milliseconds: 0),
                                                    () => setState(() {}),
                                                  ),
                                                  textCapitalization:
                                                      TextCapitalization.none,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'gijlopqk' /* Hint here */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.transparent,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                50.0,
                                                                16.0,
                                                                16.0,
                                                                16.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  keyboardType:
                                                      const TextInputType
                                                          .numberWithOptions(
                                                          decimal: true),
                                                  validator: _model
                                                      .textFieldCoinnameControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp('[0-9]'))
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 10.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.karrowDown1,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent2,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qwisap0i' /* Coin code */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      TextFormField(
                                        controller: _model
                                                .textFieldCoincodeController ??=
                                            TextEditingController(
                                          text: valueOrDefault<String>(
                                            getJsonField(
                                                      _model.getCoinData,
                                                      r'''$.symbol''',
                                                    ) !=
                                                    null
                                                ? getJsonField(
                                                    _model.getCoinData,
                                                    r'''$.symbol''',
                                                  ).toString()
                                                : columnCryptoWalletsRecord
                                                    .walletCode,
                                            'btc',
                                          ),
                                        ),
                                        focusNode:
                                            _model.textFieldCoincodeFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldCoincodeController',
                                          Duration(milliseconds: 0),
                                          () => setState(() {}),
                                        ),
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 16.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .textFieldCoincodeControllerValidator
                                            .asValidator(context),
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                              wrapWithModel(
                                model:
                                    _model.dropdownSearchableWalletNetworkModel,
                                updateCallback: () => setState(() {}),
                                child: DropdownSearchableWidget(
                                  labelPara: 'Network',
                                  hintPara: 'Search ...',
                                  optionValuePara:
                                      columnCryptoWalletsRecord.walletNetwork,
                                  dropdownIcon: Icon(
                                    FFIcons.karrowDown1,
                                  ),
                                  searchablePara: 'Search network...',
                                  listLabelPara:
                                      functions.listAllCryptoNetwork(),
                                  listValuePara:
                                      functions.listAllCryptoNetwork(),
                                  actionPara: () async {},
                                ),
                              ),
                              wrapWithModel(
                                model: _model.inputTextFieldWalletAddressModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: InputTextFieldWidget(
                                  labelPara: 'Wallet Address',
                                  hintPara: 'Enter your Wallet Address ',
                                  valuePara:
                                      columnCryptoWalletsRecord.walletAddress,
                                  readOnlyStatusPara: false,
                                  actionPara: () async {},
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model
                                          .sidedAmountTextFieldSellingModel,
                                      updateCallback: () => setState(() {}),
                                      child: LeftSidedAmountTextFieldWidget(
                                        labelPara: 'Selling Rate',
                                        hintPara: '100',
                                        valuePara: columnCryptoWalletsRecord
                                            .sellingRate
                                            .toString(),
                                        sidedText: valueOrDefault<String>(
                                          columnCryptoWalletsRecord
                                              .receivedCurrency,
                                          'NGN',
                                        ),
                                        readOnlyStatusPara: false,
                                        actionPara: () async {},
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model
                                          .sidedAmountTextFieldBuyingModel,
                                      updateCallback: () => setState(() {}),
                                      child: LeftSidedAmountTextFieldWidget(
                                        labelPara: 'Buying Rate',
                                        hintPara: '120',
                                        valuePara: columnCryptoWalletsRecord
                                            .buyingRate
                                            .toString(),
                                        sidedText: valueOrDefault<String>(
                                          columnCryptoWalletsRecord
                                              .receivedCurrency,
                                          'NGN',
                                        ),
                                        readOnlyStatusPara: false,
                                        actionPara: () async {},
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              wrapWithModel(
                                model: _model.primaryButtonLoadingSaveModel,
                                updateCallback: () => setState(() {}),
                                child: PrimaryButtonLoadingWidget(
                                  buttonText: 'Save',
                                  buttonWidth: 400,
                                  buttonHeight: 40,
                                  disableStatusPara: (_model
                                                  .textFieldCoinnameController
                                                  .text ==
                                              null ||
                                          _model.textFieldCoinnameController.text ==
                                              '') ||
                                      (_model.textFieldCoincodeController.text == null ||
                                          _model.textFieldCoincodeController.text ==
                                              '') ||
                                      (_model.dropdownSearchableWalletNetworkModel.dropDownValue == null ||
                                          _model.dropdownSearchableWalletNetworkModel.dropDownValue ==
                                              '') ||
                                      (_model.inputTextFieldWalletAddressModel.textController.text == null ||
                                          _model.inputTextFieldWalletAddressModel
                                                  .textController.text ==
                                              '') ||
                                      ((_model.sidedAmountTextFieldSellingModel.textController.text == null ||
                                              _model.sidedAmountTextFieldSellingModel
                                                      .textController.text ==
                                                  '') ||
                                          (_model.sidedAmountTextFieldSellingModel.textController.text == '0') ||
                                          (_model.sidedAmountTextFieldSellingModel.textController.text == '00')),
                                  buttonAction: () async {
                                    logFirebaseEvent(
                                        'UPDATE_WALLET_PrimaryButtonLoading-Save_');
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading-Save_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading-Save_firestore_quer');
                                      _model.getExistOutput =
                                          await queryCryptoWalletsRecordOnce(
                                        queryBuilder: (cryptoWalletsRecord) =>
                                            cryptoWalletsRecord.where(
                                          'wallet_code',
                                          isEqualTo: _model
                                              .textFieldCoincodeController.text,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.textFieldCoincodeController
                                              .text ==
                                          _model.getExistOutput?.walletCode) {
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading-Save_backend_call');

                                        firestoreBatch.update(
                                            columnCryptoWalletsRecord.reference,
                                            createCryptoWalletsRecordData(
                                              walletName: _model
                                                  .textFieldCoinnameController
                                                  .text,
                                              walletCode: _model
                                                  .textFieldCoincodeController
                                                  .text,
                                              walletNetwork: _model
                                                  .dropdownSearchableWalletNetworkModel
                                                  .dropDownValue,
                                              walletAddress: _model
                                                  .inputTextFieldWalletAddressModel
                                                  .textController
                                                  .text,
                                              sellingRate: double.tryParse(_model
                                                  .sidedAmountTextFieldSellingModel
                                                  .textController
                                                  .text),
                                              buyingRate: double.tryParse(_model
                                                  .sidedAmountTextFieldBuyingModel
                                                  .textController
                                                  .text),
                                            ));
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading-Save_close_dialog,_');
                                        Navigator.pop(context);
                                      } else if (_model
                                              .textFieldCoinnameController
                                              .text ==
                                          columnCryptoWalletsRecord
                                              .walletName) {
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading-Save_backend_call');

                                        firestoreBatch.update(
                                            columnCryptoWalletsRecord.reference,
                                            createCryptoWalletsRecordData(
                                              walletName: _model
                                                  .textFieldCoinnameController
                                                  .text,
                                              walletCode: _model
                                                  .textFieldCoincodeController
                                                  .text,
                                              walletNetwork: _model
                                                  .dropdownSearchableWalletNetworkModel
                                                  .dropDownValue,
                                              walletAddress: _model
                                                  .inputTextFieldWalletAddressModel
                                                  .textController
                                                  .text,
                                              sellingRate: double.tryParse(_model
                                                  .sidedAmountTextFieldSellingModel
                                                  .textController
                                                  .text),
                                              buyingRate: double.tryParse(_model
                                                  .sidedAmountTextFieldBuyingModel
                                                  .textController
                                                  .text),
                                            ));
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading-Save_close_dialog,_');
                                        Navigator.pop(context);
                                      } else {
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading-Save_close_dialog,_');
                                        Navigator.pop(context);
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading-Save_action_block');
                                        await action_blocks.alertError(
                                          context,
                                          descPara:
                                              '${_model.textFieldCoinnameController.text} already exist.',
                                        );
                                      }
                                    } finally {
                                      await firestoreBatch.commit();
                                    }

                                    setState(() {});
                                  },
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 20.0))
                                .around(SizedBox(height: 20.0)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
