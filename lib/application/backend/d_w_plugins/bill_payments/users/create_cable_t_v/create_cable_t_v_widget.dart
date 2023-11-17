import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/components/confirm_transaction/confirm_transaction_widget.dart';
import '/application/backend/d_w_recipients/users/components/my_recipients/my_recipients_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_cable_t_v_model.dart';
export 'create_cable_t_v_model.dart';

class CreateCableTVWidget extends StatefulWidget {
  const CreateCableTVWidget({Key? key}) : super(key: key);

  @override
  _CreateCableTVWidgetState createState() => _CreateCableTVWidgetState();
}

class _CreateCableTVWidgetState extends State<CreateCableTVWidget> {
  late CreateCableTVModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCableTVModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateCableTV'});
    _model.textFieldSmartNumberController ??= TextEditingController();
    _model.textFieldSmartNumberFocusNode ??= FocusNode();

    _model.textFieldTypeOfServiceController ??= TextEditingController();
    _model.textFieldTypeOfServiceFocusNode ??= FocusNode();

    _model.textFieldProviderController ??= TextEditingController();
    _model.textFieldProviderFocusNode ??= FocusNode();

    _model.textFieldBillerCodeController ??= TextEditingController();
    _model.textFieldBillerCodeFocusNode ??= FocusNode();

    _model.textFieldItemCodeController ??= TextEditingController();
    _model.textFieldItemCodeFocusNode ??= FocusNode();

    _model.textFieldShortNameController ??= TextEditingController();
    _model.textFieldShortNameFocusNode ??= FocusNode();

    _model.textFieldProviderFeeController ??= TextEditingController();
    _model.textFieldProviderFeeFocusNode ??= FocusNode();

    _model.textFieldCountryController ??= TextEditingController();
    _model.textFieldCountryFocusNode ??= FocusNode();

    _model.textFieldCurrencyController ??= TextEditingController();
    _model.textFieldCurrencyFocusNode ??= FocusNode();

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
        title: 'Buy Cable TV',
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
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'CREATE_CABLE_T_V_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'n1jsiu8g' /* Cable TV */,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.dWSidebarModel,
                    updateCallback: () => setState(() {}),
                    child: DWSidebarWidget(
                      selectedSidebarNav: 'Pay Bills',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.dWHeaderModel,
                          updateCallback: () => setState(() {}),
                          child: DWHeaderWidget(
                            pageTitle: 'Cable TV',
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: StreamBuilder<
                                      List<BillpaymentsServicesRecord>>(
                                    stream: queryBillpaymentsServicesRecord(
                                      queryBuilder:
                                          (billpaymentsServicesRecord) =>
                                              billpaymentsServicesRecord.where(
                                        'service_name',
                                        isEqualTo: 'Cable TV',
                                      ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Container(
                                          width: 450.0,
                                          child: ShimmerCardWidget(
                                            heightPara: 400,
                                          ),
                                        );
                                      }
                                      List<BillpaymentsServicesRecord>
                                          containerBillpaymentsServicesRecordList =
                                          snapshot.data!;
                                      final containerBillpaymentsServicesRecord =
                                          containerBillpaymentsServicesRecordList
                                                  .isNotEmpty
                                              ? containerBillpaymentsServicesRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        width: 450.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            if (containerBillpaymentsServicesRecord
                                                    ?.serviceStatus ==
                                                true) {
                                              return Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'pk3n05fl' /* Service Provider */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    BillpaymentProvidersRecord>>(
                                                              stream:
                                                                  queryBillpaymentProvidersRecord(
                                                                queryBuilder:
                                                                    (billpaymentProvidersRecord) =>
                                                                        billpaymentProvidersRecord
                                                                            .where(
                                                                  'provider_service_type',
                                                                  isEqualTo:
                                                                      'Cable TV',
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return ShimmerPhotoGridWidget(
                                                                    widthPara:
                                                                        50,
                                                                    heightPara:
                                                                        50,
                                                                    itemNo: 4,
                                                                    itemSpacing:
                                                                        20,
                                                                  );
                                                                }
                                                                List<BillpaymentProvidersRecord>
                                                                    rowBillpaymentProvidersRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: List.generate(
                                                                        rowBillpaymentProvidersRecordList
                                                                            .length,
                                                                        (rowIndex) {
                                                                      final rowBillpaymentProvidersRecord =
                                                                          rowBillpaymentProvidersRecordList[
                                                                              rowIndex];
                                                                      return InkWell(
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
                                                                          logFirebaseEvent(
                                                                              'CREATE_CABLE_T_V_Card_p67mznlu_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Card_update_page_state');
                                                                          setState(
                                                                              () {
                                                                            _model.providerLogo =
                                                                                rowBillpaymentProvidersRecord.providerLogo;
                                                                          });
                                                                          // Action 2 - Type Of Service
                                                                          logFirebaseEvent(
                                                                              'Card_Action2-TypeOfService');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldTypeOfServiceController?.text =
                                                                                rowBillpaymentProvidersRecord.providerServiceType;
                                                                          });
                                                                          // Action 2 - Provider
                                                                          logFirebaseEvent(
                                                                              'Card_Action2-Provider');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldProviderController?.text =
                                                                                rowBillpaymentProvidersRecord.providerName;
                                                                          });
                                                                          // Action 2 - Biller Code
                                                                          logFirebaseEvent(
                                                                              'Card_Action2-BillerCode');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldBillerCodeController?.text =
                                                                                rowBillpaymentProvidersRecord.providerBillerCode;
                                                                          });
                                                                          // Action 5 - Provider Fee
                                                                          logFirebaseEvent(
                                                                              'Card_Action5-ProviderFee');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldProviderFeeController?.text =
                                                                                rowBillpaymentProvidersRecord.providerTransferFee.toString();
                                                                          });
                                                                          // Action 6 - Provider Country
                                                                          logFirebaseEvent(
                                                                              'Card_Action6-ProviderCountry');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldCountryController?.text =
                                                                                rowBillpaymentProvidersRecord.providerCountry;
                                                                          });
                                                                          // Action 7 - Provider Currency
                                                                          logFirebaseEvent(
                                                                              'Card_Action7-ProviderCurrency');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldCurrencyController?.text =
                                                                                rowBillpaymentProvidersRecord.providerCurrency;
                                                                          });
                                                                        },
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          elevation:
                                                                              0.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          child:
                                                                              PhotoGridCoverWidget(
                                                                            key:
                                                                                Key('Key6yk_${rowIndex}_of_${rowBillpaymentProvidersRecordList.length}'),
                                                                            photoWidth:
                                                                                50,
                                                                            photoHeight:
                                                                                50,
                                                                            photoPath:
                                                                                rowBillpaymentProvidersRecord.providerLogo,
                                                                            photoName:
                                                                                functions.getFirstLetterOfString(rowBillpaymentProvidersRecord.providerName),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            20.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (_model.textFieldBillerCodeController
                                                                        .text !=
                                                                    null &&
                                                                _model.textFieldBillerCodeController
                                                                        .text !=
                                                                    '')
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                elevation: 0.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                ),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        BillpaymentProvidersRecord>>(
                                                                  stream:
                                                                      queryBillpaymentProvidersRecord(
                                                                    queryBuilder:
                                                                        (billpaymentProvidersRecord) =>
                                                                            billpaymentProvidersRecord.where(
                                                                      'provider_service_type',
                                                                      isEqualTo:
                                                                          'Cable TV',
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return ShimmerPhotoGridWidget(
                                                                        heightPara:
                                                                            50,
                                                                        widthPara:
                                                                            50,
                                                                        itemNo:
                                                                            1,
                                                                      );
                                                                    }
                                                                    List<BillpaymentProvidersRecord>
                                                                        photoGridCoverBillpaymentProvidersRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final photoGridCoverBillpaymentProvidersRecord = photoGridCoverBillpaymentProvidersRecordList
                                                                            .isNotEmpty
                                                                        ? photoGridCoverBillpaymentProvidersRecordList
                                                                            .first
                                                                        : null;
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .photoGridCoverModel2,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          PhotoGridCoverWidget(
                                                                        photoWidth:
                                                                            50,
                                                                        photoHeight:
                                                                            50,
                                                                        photoPath: _model.providerLogo != null &&
                                                                                _model.providerLogo != ''
                                                                            ? _model.providerLogo
                                                                            : photoGridCoverBillpaymentProvidersRecord?.providerLogo,
                                                                        photoName:
                                                                            functions.getFirstLetterOfString(photoGridCoverBillpaymentProvidersRecord?.providerName),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          300.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'rcj7hwu2' /* Smart Card Number */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelSmall,
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CREATE_CABLE_T_V_Row_38ek4tb2_ON_TAP');
                                                                                  logFirebaseEvent('Row_bottom_sheet');
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
                                                                                          child: MyRecipientsWidget(
                                                                                            titleName: 'Cable TV',
                                                                                            typeName: 'Smart Number',
                                                                                          ),
                                                                                        ),
                                                                                      ));
                                                                                    },
                                                                                  ).then((value) => safeSetState(() => _model.getMyRecipient = value));

                                                                                  logFirebaseEvent('Row_set_form_field');
                                                                                  setState(() {
                                                                                    _model.textFieldSmartNumberController?.text = _model.getMyRecipient!.accountNumber;
                                                                                  });

                                                                                  setState(() {});
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'vhk1y6hv' /* Recipient */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            decoration: TextDecoration.underline,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      FFIcons.karrowRight3,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 14.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
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
                                                                                    controller: _model.textFieldSmartNumberController,
                                                                                    focusNode: _model.textFieldSmartNumberFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.textFieldSmartNumberController',
                                                                                      Duration(milliseconds: 0),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        '55kswji0' /* 0123456789 */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).textfieldHint,
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
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    keyboardType: TextInputType.phone,
                                                                                    validator: _model.textFieldSmartNumberControllerValidator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      _model.textFieldSmartNumberMask
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 15.0)),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                        ))
                                                          Column(
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
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldTypeOfServiceController,
                                                                  focusNode: _model
                                                                      .textFieldTypeOfServiceFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldTypeOfServiceController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ogar7s2o' /* Type of Service */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldTypeOfServiceControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldProviderController,
                                                                  focusNode: _model
                                                                      .textFieldProviderFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldProviderController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'zow2afxb' /* Provider */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldProviderControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldBillerCodeController,
                                                                  focusNode: _model
                                                                      .textFieldBillerCodeFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldBillerCodeController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qlmtraut' /* Biller Code */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldBillerCodeControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldItemCodeController,
                                                                  focusNode: _model
                                                                      .textFieldItemCodeFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldItemCodeController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ilsst63d' /* Item Code */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldItemCodeControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldShortNameController,
                                                                  focusNode: _model
                                                                      .textFieldShortNameFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldShortNameController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'yi62abf5' /* Short Name */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldShortNameControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldProviderFeeController,
                                                                  focusNode: _model
                                                                      .textFieldProviderFeeFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldProviderFeeController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cwu2wu44' /* Provider Fee */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldProviderFeeControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldCountryController,
                                                                  focusNode: _model
                                                                      .textFieldCountryFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldCountryController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'n33ij9as' /* Country */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldCountryControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textFieldCurrencyController,
                                                                  focusNode: _model
                                                                      .textFieldCurrencyFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textFieldCurrencyController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'yz8u8s61' /* Currency
 */
                                                                      ,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldHint,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            16.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  validator: _model
                                                                      .textFieldCurrencyControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 10.0)),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: 20.0)),
                                                    ),
                                                    if (_model.textFieldBillerCodeController
                                                                .text !=
                                                            null &&
                                                        _model.textFieldBillerCodeController
                                                                .text !=
                                                            '')
                                                      Container(
                                                        width: double.infinity,
                                                        height: 500.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                BillpaymentSettingsRecord>>(
                                                          stream:
                                                              queryBillpaymentSettingsRecord(
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return ShimmerCard2Widget(
                                                                itemNo: 4,
                                                                itemSpacing:
                                                                    300,
                                                              );
                                                            }
                                                            List<BillpaymentSettingsRecord>
                                                                columnBillpaymentSettingsRecordList =
                                                                snapshot.data!;
                                                            final columnBillpaymentSettingsRecord =
                                                                columnBillpaymentSettingsRecordList
                                                                        .isNotEmpty
                                                                    ? columnBillpaymentSettingsRecordList
                                                                        .first
                                                                    : null;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future: FluttewaveApiGroup
                                                                      .listOfBillsCall
                                                                      .call(
                                                                    type:
                                                                        'cable',
                                                                    billerCode: _model
                                                                        .textFieldBillerCodeController
                                                                        .text,
                                                                    apiKey: columnBillpaymentSettingsRecord
                                                                        ?.pluginProviderApiKey,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return ShimmerCard2Widget(
                                                                        itemNo:
                                                                            4,
                                                                        itemSpacing:
                                                                            300,
                                                                      );
                                                                    }
                                                                    final listViewListOfBillsResponse =
                                                                        snapshot
                                                                            .data!;
                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listOfPackage =
                                                                            getJsonField(
                                                                          listViewListOfBillsResponse
                                                                              .jsonBody,
                                                                          r'''$.data[:]''',
                                                                        ).toList();
                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listOfPackage.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(height: 25.0),
                                                                          itemBuilder:
                                                                              (context, listOfPackageIndex) {
                                                                            final listOfPackageItem =
                                                                                listOfPackage[listOfPackageIndex];
                                                                            return Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    offset: Offset(0.0, 2.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            listOfPackageItem,
                                                                                            r'''$.name''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            listOfPackageItem,
                                                                                            r'''$.short_name''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 8.0)),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  FFIcons.kcard,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 14.0,
                                                                                                ),
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'g9wqgxh8' /* Price */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                            Text(
                                                                                              '${_model.textFieldCurrencyController.text} ${getJsonField(
                                                                                                listOfPackageItem,
                                                                                                r'''$.amount''',
                                                                                              ).toString()}',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 8.0)),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(1.00, 0.00),
                                                                                            child: PrimaryRoundedButtonWidget(
                                                                                              key: Key('Keyqxv_${listOfPackageIndex}_of_${listOfPackage.length}'),
                                                                                              buttonText: 'Buy Now',
                                                                                              buttonBgColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              buttonTextColor: FlutterFlowTheme.of(context).primary,
                                                                                              buttonBorderColor: FlutterFlowTheme.of(context).primary,
                                                                                              disableStatusPara: false,
                                                                                              buttonHoverBGColor: FlutterFlowTheme.of(context).primary,
                                                                                              buttonHoverColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              buttonAction: () async {
                                                                                                logFirebaseEvent('CREATE_CABLE_T_V_Container_qxv3lp70_CALL');
                                                                                                logFirebaseEvent('PrimaryRoundedButton_bottom_sheet');
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
                                                                                                        child: ConfirmTransactionWidget(
                                                                                                          packageDetails: listOfPackageItem,
                                                                                                          customerNumber: _model.textFieldSmartNumberController.text,
                                                                                                          billerCode: _model.textFieldBillerCodeController.text,
                                                                                                          itemCode: getJsonField(
                                                                                                            listOfPackageItem,
                                                                                                            r'''$.item_code''',
                                                                                                          ).toString(),
                                                                                                          serviceProvider: _model.textFieldProviderController.text,
                                                                                                          serviceType: _model.textFieldTypeOfServiceController.text,
                                                                                                          amount: getJsonField(
                                                                                                            listOfPackageItem,
                                                                                                            r'''$.amount''',
                                                                                                          ),
                                                                                                          shortName: getJsonField(
                                                                                                            listOfPackageItem,
                                                                                                            r'''$.short_name''',
                                                                                                          ).toString(),
                                                                                                          providerFee: 0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ));
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 25.0)),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              );
                                            } else {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .noAccessErrorModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: NoAccessErrorWidget(
                                                      titlePara:
                                                          containerBillpaymentsServicesRecord
                                                              ?.suspensionTitle,
                                                      descPara:
                                                          containerBillpaymentsServicesRecord
                                                              ?.suspensionDesc,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
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
