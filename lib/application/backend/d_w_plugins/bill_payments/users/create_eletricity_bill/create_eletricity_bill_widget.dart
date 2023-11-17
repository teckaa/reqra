import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/components/confirm_transaction/confirm_transaction_widget.dart';
import '/application/backend/d_w_recipients/users/components/my_recipients/my_recipients_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
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
import 'create_eletricity_bill_model.dart';
export 'create_eletricity_bill_model.dart';

class CreateEletricityBillWidget extends StatefulWidget {
  const CreateEletricityBillWidget({Key? key}) : super(key: key);

  @override
  _CreateEletricityBillWidgetState createState() =>
      _CreateEletricityBillWidgetState();
}

class _CreateEletricityBillWidgetState
    extends State<CreateEletricityBillWidget> {
  late CreateEletricityBillModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEletricityBillModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateEletricityBill'});
    _model.textFieldMeterNumberController ??= TextEditingController();
    _model.textFieldMeterNumberFocusNode ??= FocusNode();

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

    _model.textFieldAmountController ??= TextEditingController();
    _model.textFieldAmountFocusNode ??= FocusNode();

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
        title: 'Pay for your Eletricity Bill',
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
                            'CREATE_ELETRICITY_BILL_arrowLeft2_ICN_ON');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'tzuhs3jz' /* Electricity */,
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
                            pageTitle: 'Electricity',
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
                                        isEqualTo: 'Electricity',
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
                                                                'iqlgknr7' /* Service Provider */,
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
                                                                      'Electricity',
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
                                                                              'CREATE_ELETRICITY_BILL_Card_1mmntvvy_ON_');
                                                                          // Action 1 - Update provider biller code and logo
                                                                          logFirebaseEvent(
                                                                              'Card_Action1-Updateproviderbillercodeand');
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
                                                                          // Action 2 - Item Code
                                                                          logFirebaseEvent(
                                                                              'Card_Action2-ItemCode');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldItemCodeController?.text =
                                                                                rowBillpaymentProvidersRecord.providerItemCode;
                                                                          });
                                                                          // Action 2 - Short Name
                                                                          logFirebaseEvent(
                                                                              'Card_Action2-ShortName');
                                                                          setState(
                                                                              () {
                                                                            _model.textFieldShortNameController?.text =
                                                                                rowBillpaymentProvidersRecord.providerShortName;
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
                                                                                Key('Keyur3_${rowIndex}_of_${rowBillpaymentProvidersRecordList.length}'),
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
                                                                          'Electricity',
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
                                                                                    '0x3cuig5' /* Meter Number */,
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
                                                                                  logFirebaseEvent('CREATE_ELETRICITY_BILL_Row_gg3z55yf_ON_T');
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
                                                                                            titleName: 'Electricity',
                                                                                            typeName: 'Meter Number',
                                                                                          ),
                                                                                        ),
                                                                                      ));
                                                                                    },
                                                                                  ).then((value) => safeSetState(() => _model.getMyRecipient = value));

                                                                                  logFirebaseEvent('Row_set_form_field');
                                                                                  setState(() {
                                                                                    _model.textFieldMeterNumberController?.text = _model.getMyRecipient!.accountNumber;
                                                                                  });

                                                                                  setState(() {});
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '4ka0dbmf' /* Recipient */,
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
                                                                                    controller: _model.textFieldMeterNumberController,
                                                                                    focusNode: _model.textFieldMeterNumberFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.textFieldMeterNumberController',
                                                                                      Duration(milliseconds: 0),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'pf0nlmel' /* 012345678901234 */,
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
                                                                                    validator: _model.textFieldMeterNumberControllerValidator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      _model.textFieldMeterNumberMask
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
                                                                      's9ekyhs6' /* Type of Service */,
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
                                                                      'iwd9lzu4' /* Provider */,
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
                                                                      'oh3xdly9' /* Biller Code */,
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
                                                                      '771r4rlb' /* Item Code */,
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
                                                                      '1whrefpj' /* Short Name */,
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
                                                                      '3721x4gw' /* Provider Fee */,
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
                                                                      'ej8mj8t9' /* Country */,
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
                                                                      '012zb4x9' /* Currency
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
                                                    Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '4wgbg7nr' /* Choose an Amount */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .primaryButtonModel1,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      PrimaryButtonWidget(
                                                                    buttonText:
                                                                        'NGN 1,000.00',
                                                                    buttonBgColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    buttonTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    disableStatusPara:
                                                                        false,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_ELETRICITY_BILL_Container_78axdoo');
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_set_form_field');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldAmountController
                                                                            ?.text = '1000';
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.amount =
                                                                            1000.0;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .primaryButtonModel2,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      PrimaryButtonWidget(
                                                                    buttonText:
                                                                        'NGN 2,000.00',
                                                                    buttonBgColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    buttonTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    disableStatusPara:
                                                                        false,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_ELETRICITY_BILL_Container_wsbbgy0');
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_set_form_field');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldAmountController
                                                                            ?.text = '2000';
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.amount =
                                                                            2000.0;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .primaryButtonModel3,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      PrimaryButtonWidget(
                                                                    buttonText:
                                                                        'NGN 3,000.00',
                                                                    buttonBgColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    buttonTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    disableStatusPara:
                                                                        false,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_ELETRICITY_BILL_Container_mt61axq');
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_set_form_field');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldAmountController
                                                                            ?.text = '3000';
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.amount =
                                                                            3000.0;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 20.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .primaryButtonModel4,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      PrimaryButtonWidget(
                                                                    buttonText:
                                                                        'NGN 5,000.00',
                                                                    buttonBgColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    buttonTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    disableStatusPara:
                                                                        false,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_ELETRICITY_BILL_Container_kuy4qir');
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_set_form_field');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldAmountController
                                                                            ?.text = '5000';
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.amount =
                                                                            5000.0;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .primaryButtonModel5,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      PrimaryButtonWidget(
                                                                    buttonText:
                                                                        'NGN 10,000.00',
                                                                    buttonBgColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    buttonTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    disableStatusPara:
                                                                        false,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_ELETRICITY_BILL_Container_g6h0u2q');
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_set_form_field');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldAmountController
                                                                            ?.text = '10000';
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.amount =
                                                                            10000.0;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .primaryButtonModel6,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      PrimaryButtonWidget(
                                                                    buttonText:
                                                                        'NGN 20,000.00',
                                                                    buttonBgColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    buttonTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    disableStatusPara:
                                                                        false,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_ELETRICITY_BILL_Container_2r7k1td');
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_set_form_field');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldAmountController
                                                                            ?.text = '20000';
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'PrimaryButton_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.amount =
                                                                            20000.0;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 20.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 15.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '1210glts' /* Amount */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Text(
                                                                  'Balance: ${valueOrDefault(currentUserDocument?.currency, '')}${formatNumber(
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accountBalance,
                                                                        0.0),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .automatic,
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textFieldAmountController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldAmountFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textFieldAmountController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              0),
                                                                      () async {
                                                                        logFirebaseEvent(
                                                                            'CREATE_ELETRICITY_BILL_TextField-Amount_');
                                                                        logFirebaseEvent(
                                                                            'TextField-Amount_update_page_state');
                                                                        setState(
                                                                            () {
                                                                          _model.amount = double.tryParse(_model
                                                                              .textFieldAmountController
                                                                              .text);
                                                                        });
                                                                      },
                                                                    ),
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .none,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .go,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'sjuex8p7' /* 1000 -100,000 */,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          Colors
                                                                              .transparent,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          50.0,
                                                                          16.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                    keyboardType: const TextInputType
                                                                        .numberWithOptions(
                                                                        decimal:
                                                                            true),
                                                                    validator: _model
                                                                        .textFieldAmountControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('^\\d*\\.?\\d{0,2}\$'))
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          0.00),
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '29v4m3sw' /* NGN */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (_model.amount! >
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.accountBalance,
                                                                  0.0))
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'qmvjllhm' /* Insufficient funds */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            wrapWithModel(
                                                          model: _model
                                                              .primaryButtonModel7,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              PrimaryButtonWidget(
                                                            buttonText:
                                                                'Buy Airtime',
                                                            buttonBgColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            buttonTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                            buttonWidth: 450,
                                                            buttonHeight: 50,
                                                            disableStatusPara: (_model
                                                                            .textFieldMeterNumberController
                                                                            .text ==
                                                                        null ||
                                                                    _model.textFieldMeterNumberController
                                                                            .text ==
                                                                        '') ||
                                                                (_model.textFieldTypeOfServiceController
                                                                            .text ==
                                                                        null ||
                                                                    _model.textFieldTypeOfServiceController
                                                                            .text ==
                                                                        '') ||
                                                                (_model.textFieldAmountController
                                                                            .text ==
                                                                        null ||
                                                                    _model.textFieldAmountController
                                                                            .text ==
                                                                        '') ||
                                                                (_model.amount! >
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accountBalance,
                                                                        0.0)),
                                                            disableColorPara:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .disableColor,
                                                            buttonAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CREATE_ELETRICITY_BILL_Container_vfr4zkv');
                                                              logFirebaseEvent(
                                                                  'PrimaryButton_validate_form');
                                                              if (_model.formKey
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                              logFirebaseEvent(
                                                                  'PrimaryButton_bottom_sheet');
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
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          ConfirmTransactionWidget(
                                                                        customerNumber: _model
                                                                            .textFieldMeterNumberController
                                                                            .text,
                                                                        billerCode: _model
                                                                            .textFieldBillerCodeController
                                                                            .text,
                                                                        itemCode: _model
                                                                            .textFieldItemCodeController
                                                                            .text,
                                                                        name: _model
                                                                            .textFieldShortNameController
                                                                            .text,
                                                                        serviceProvider: _model
                                                                            .textFieldProviderController
                                                                            .text,
                                                                        serviceType: _model
                                                                            .textFieldTypeOfServiceController
                                                                            .text,
                                                                        amount: double.tryParse(_model
                                                                            .textFieldAmountController
                                                                            .text),
                                                                      ),
                                                                    ),
                                                                  ));
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                          ),
                                                        ),
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
