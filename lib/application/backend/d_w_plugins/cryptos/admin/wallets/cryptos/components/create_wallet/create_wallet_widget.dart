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
import 'create_wallet_model.dart';
export 'create_wallet_model.dart';

class CreateWalletWidget extends StatefulWidget {
  const CreateWalletWidget({Key? key}) : super(key: key);

  @override
  _CreateWalletWidgetState createState() => _CreateWalletWidgetState();
}

class _CreateWalletWidgetState extends State<CreateWalletWidget> {
  late CreateWalletModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateWalletModel());

    _model.textFieldCoinnameController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
                _model.getCoinData,
                r'''$.name''',
              ) !=
              null
          ? valueOrDefault<String>(
              getJsonField(
                _model.getCoinData,
                r'''$.name''',
              ).toString().toString(),
              'Bitcoin',
            )
          : 'Bitcoin',
      'Bitcoin',
    ));
    _model.textFieldCoinnameFocusNode ??= FocusNode();

    _model.textFieldCoincodeController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
                _model.getCoinData,
                r'''$.symbol''',
              ) !=
              null
          ? valueOrDefault<String>(
              getJsonField(
                _model.getCoinData,
                r'''$.symbol''',
              ).toString().toString(),
              'btc',
            )
          : 'btc',
      'btc',
    ));
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
                      headerTitlePara: 'Create Wallet',
                      headerTitleTextColorPara:
                          FlutterFlowTheme.of(context).primaryText,
                      headerActionPara: () async {
                        logFirebaseEvent(
                            'CREATE_WALLET_Container_g1bghm4y_CALLBAC');
                        logFirebaseEvent('ModalHeader_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: StreamBuilder<List<CryptoSettingsRecord>>(
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
                              columnCryptoSettingsRecordList = snapshot.data!;
                          final columnCryptoSettingsRecord =
                              columnCryptoSettingsRecordList.isNotEmpty
                                  ? columnCryptoSettingsRecordList.first
                                  : null;
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
                                        'abaf5jtr' /* Choose Coin */,
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
                                              'CREATE_WALLET_COMP_Stack_ta8exe7d_ON_TAP');
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
                                              'Stack_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .overlay,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                  child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    ListOfCoinsFromApiWidget(),
                                              ));
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          logFirebaseEvent(
                                              'Stack_set_form_field');
                                          setState(() {
                                            _model.textFieldCoinnameController
                                                ?.text = valueOrDefault<String>(
                                              getJsonField(
                                                _model.getCoinData,
                                                r'''$.name''',
                                              ).toString(),
                                              'Bitcoin',
                                            );
                                          });
                                          logFirebaseEvent(
                                              'Stack_set_form_field');
                                          setState(() {
                                            _model.textFieldCoincodeController
                                                ?.text = valueOrDefault<String>(
                                              getJsonField(
                                                _model.getCoinData,
                                                r'''$.symbol''',
                                              ).toString(),
                                              'btc',
                                            );
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
                                                                : 'btc',
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
                                                      .textFieldCoinnameController,
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
                                                      'qpj1dz0p' /* Hint here */,
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
                                          'c89390xd' /* Coin code */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.textFieldCoincodeController,
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
                                updateOnChange: true,
                                child: DropdownSearchableWidget(
                                  labelPara: 'Network',
                                  hintPara: 'Search...',
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
                                  hintPara: 'Enter your wallet address ',
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
                                          .leftSidedAmountTextFieldSellingModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: LeftSidedAmountTextFieldWidget(
                                        labelPara: 'What rate are you Buying?',
                                        hintPara: '100',
                                        sidedText: valueOrDefault<String>(
                                          columnCryptoSettingsRecord
                                              ?.pluginReceivedCurrency,
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
                                          .leftSidedAmountTextFieldBuyingModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: LeftSidedAmountTextFieldWidget(
                                        labelPara: 'What rate are you Selling?',
                                        hintPara: '120',
                                        sidedText: valueOrDefault<String>(
                                          columnCryptoSettingsRecord
                                              ?.pluginReceivedCurrency,
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
                                updateOnChange: true,
                                child: PrimaryButtonLoadingWidget(
                                  buttonText: 'Save',
                                  buttonWidth: 400,
                                  buttonHeight: 40,
                                  disableStatusPara: (_model.textFieldCoinnameController.text == null || _model.textFieldCoinnameController.text == '') ||
                                      (_model.textFieldCoincodeController.text == null ||
                                          _model.textFieldCoincodeController.text ==
                                              '') ||
                                      (_model.dropdownSearchableWalletNetworkModel.dropDownValue == null ||
                                          _model.dropdownSearchableWalletNetworkModel.dropDownValue ==
                                              '') ||
                                      ((_model.leftSidedAmountTextFieldSellingModel.textController.text == null ||
                                              _model.leftSidedAmountTextFieldSellingModel
                                                      .textController.text ==
                                                  '') ||
                                          (_model.leftSidedAmountTextFieldSellingModel
                                                  .textController.text ==
                                              '0') ||
                                          (_model.leftSidedAmountTextFieldSellingModel
                                                  .textController.text ==
                                              '00')) ||
                                      ((_model.leftSidedAmountTextFieldBuyingModel.textController.text == null ||
                                              _model.leftSidedAmountTextFieldBuyingModel.textController.text == '') ||
                                          (_model.leftSidedAmountTextFieldBuyingModel.textController.text == '0') ||
                                          (_model.leftSidedAmountTextFieldBuyingModel.textController.text == '00')),
                                  disableColorPara:
                                      FlutterFlowTheme.of(context).lineColor,
                                  buttonAction: () async {
                                    logFirebaseEvent(
                                        'CREATE_WALLET_PrimaryButtonLoading-Save_');
                                    logFirebaseEvent(
                                        'PrimaryButtonLoading-Save_validate_form');
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    logFirebaseEvent(
                                        'PrimaryButtonLoading-Save_firestore_quer');
                                    _model.checkDocumentExist =
                                        await queryCryptoWalletsRecordOnce(
                                      queryBuilder: (cryptoWalletsRecord) =>
                                          cryptoWalletsRecord.where(
                                        'wallet_code',
                                        isEqualTo: _model
                                            .textFieldCoincodeController.text,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model
                                            .textFieldCoincodeController.text ==
                                        _model.checkDocumentExist?.walletCode) {
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading-Save_action_block');
                                      await action_blocks.alertError(
                                        context,
                                        descPara:
                                            '${_model.checkDocumentExist?.walletName} already exist.',
                                      );
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading-Save_close_dialog,_');
                                      Navigator.pop(context);
                                    } else {
                                      // Action 5 - Create wallet record
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading-Save_Action5-Create');

                                      await CryptoWalletsRecord.collection
                                          .doc()
                                          .set(createCryptoWalletsRecordData(
                                            createdAt: getCurrentTimestamp,
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
                                            exchangeCurrency:
                                                columnCryptoSettingsRecord
                                                    ?.pluginCurrency,
                                            receivedCurrency:
                                                columnCryptoSettingsRecord
                                                    ?.pluginReceivedCurrency,
                                            sellingRate: double.tryParse(_model
                                                .leftSidedAmountTextFieldSellingModel
                                                .textController
                                                .text),
                                            buyingRate: double.tryParse(_model
                                                .leftSidedAmountTextFieldBuyingModel
                                                .textController
                                                .text),
                                          ));
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading-Save_action_block');
                                      await action_blocks.alertSuccess(
                                        context,
                                        descPara:
                                            'You have successfully a new wallet & rate',
                                      );
                                      setState(() {});
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading-Save_close_dialog,_');
                                      Navigator.pop(context);
                                    }

                                    setState(() {});
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 20.0)),
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
