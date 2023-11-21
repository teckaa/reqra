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
import 'create_airtime_model.dart';
export 'create_airtime_model.dart';

class CreateAirtimeWidget extends StatefulWidget {
  const CreateAirtimeWidget({Key? key}) : super(key: key);

  @override
  _CreateAirtimeWidgetState createState() => _CreateAirtimeWidgetState();
}

class _CreateAirtimeWidgetState extends State<CreateAirtimeWidget> {
  late CreateAirtimeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAirtimeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateAirtime'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_AIRTIME_CreateAirtime_ON_INIT_STA');
      // Action 1 - Get Provider Data
      logFirebaseEvent('CreateAirtime_Action1-GetProviderData');
      _model.getFirstProvider = await queryBillpaymentProvidersRecordOnce(
        queryBuilder: (billpaymentProvidersRecord) => billpaymentProvidersRecord
            .where(
              'provider_service_type',
              isEqualTo: 'Airtime',
            )
            .where(
              'provider_name',
              isEqualTo: 'MTN Nigeria',
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('CreateAirtime_update_page_state');
      setState(() {
        _model.providerRef = _model.getFirstProvider?.reference;
      });
      // Action 3 - Get Ads Data
      logFirebaseEvent('CreateAirtime_Action3-GetAdsData');
      _model.getAdsData = await queryDwAppAdsRecordCount(
        queryBuilder: (dwAppAdsRecord) => dwAppAdsRecord.where(
          'ads_status',
          isEqualTo: true,
        ),
      );
    });

    _model.textFieldPhoneNumberController ??=
        TextEditingController(text: '0${currentPhoneNumber}');
    _model.textFieldPhoneNumberFocusNode ??= FocusNode();

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
        title: 'Buy Airtime',
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
                            'CREATE_AIRTIME_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'ov3v642l' /* Airtime / Top Up */,
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
                            pageTitle: 'Airtime / Top Up',
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
                                    stream: _model.billPaymentSettings(
                                      requestFn: () =>
                                          queryBillpaymentsServicesRecord(
                                        queryBuilder:
                                            (billpaymentsServicesRecord) =>
                                                billpaymentsServicesRecord
                                                    .where(
                                          'service_name',
                                          isEqualTo: 'Airtime',
                                        ),
                                        singleRecord: true,
                                      ),
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
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  wrapWithModel(
                                                    model:
                                                        _model.listOfAdsModel1,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: ListOfAdsWidget(
                                                      adsStatus: true,
                                                      adsPosition: 'Top',
                                                      adsPages:
                                                          containerBillpaymentsServicesRecord
                                                              ?.serviceName,
                                                    ),
                                                  ),
                                                  Form(
                                                    key: _model.formKey,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Column(
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '68z90eap' /* Network Provider */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelSmallFamily,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                      ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        BillpaymentProvidersRecord>>(
                                                                  stream: _model
                                                                      .listOfProviderQuery(
                                                                    requestFn: () =>
                                                                        queryBillpaymentProvidersRecord(
                                                                      queryBuilder:
                                                                          (billpaymentProvidersRecord) =>
                                                                              billpaymentProvidersRecord.where(
                                                                        'provider_service_type',
                                                                        isEqualTo:
                                                                            'Airtime',
                                                                      ),
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
                                                                        itemNo:
                                                                            4,
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: List.generate(
                                                                            rowBillpaymentProvidersRecordList.length,
                                                                            (rowIndex) {
                                                                          final rowBillpaymentProvidersRecord =
                                                                              rowBillpaymentProvidersRecordList[rowIndex];
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
                                                                              logFirebaseEvent('CREATE_AIRTIME_PAGE_Card_2mkbqmha_ON_TAP');
                                                                              logFirebaseEvent('Card_update_page_state');
                                                                              setState(() {
                                                                                _model.providerRef = rowBillpaymentProvidersRecord.reference;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Card(
                                                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                              elevation: 0.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                              ),
                                                                              child: PhotoGridCoverWidget(
                                                                                key: Key('Key3k3_${rowIndex}_of_${rowBillpaymentProvidersRecordList.length}'),
                                                                                photoWidth: 50,
                                                                                photoHeight: 50,
                                                                                photoPath: rowBillpaymentProvidersRecord.providerLogo,
                                                                                photoName: functions.getFirstLetterOfString(rowBillpaymentProvidersRecord.providerName),
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
                                                          ].divide(SizedBox(
                                                              height: 20.0)),
                                                        ),
                                                        StreamBuilder<
                                                            BillpaymentProvidersRecord>(
                                                          stream: BillpaymentProvidersRecord
                                                              .getDocument(_model
                                                                  .providerRef!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child:
                                                                    LinearProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              );
                                                            }
                                                            final columnBillpaymentProvidersRecord =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    if (columnBillpaymentProvidersRecord.providerBillerCode !=
                                                                            null &&
                                                                        columnBillpaymentProvidersRecord.providerBillerCode !=
                                                                            '')
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
                                                                        child: StreamBuilder<
                                                                            BillpaymentProvidersRecord>(
                                                                          stream:
                                                                              BillpaymentProvidersRecord.getDocument(columnBillpaymentProvidersRecord.reference),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return ShimmerPhotoGridWidget(
                                                                                heightPara: 50,
                                                                                widthPara: 50,
                                                                                itemNo: 1,
                                                                              );
                                                                            }
                                                                            final photoGridCoverBillpaymentProvidersRecord =
                                                                                snapshot.data!;
                                                                            return wrapWithModel(
                                                                              model: _model.photoGridCoverModel2,
                                                                              updateCallback: () => setState(() {}),
                                                                              updateOnChange: true,
                                                                              child: PhotoGridCoverWidget(
                                                                                photoWidth: 50,
                                                                                photoHeight: 50,
                                                                                photoPath: _model.providerLogo != null && _model.providerLogo != '' ? _model.providerLogo : photoGridCoverBillpaymentProvidersRecord.providerLogo,
                                                                                photoName: functions.getFirstLetterOfString(photoGridCoverBillpaymentProvidersRecord.providerName),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 300.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'lndxisxz' /* Phone Number */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall,
                                                                                        ),
                                                                                      ),
                                                                                      StreamBuilder<List<DwRecipientsSettingsRecord>>(
                                                                                        stream: queryDwRecipientsSettingsRecord(
                                                                                          queryBuilder: (dwRecipientsSettingsRecord) => dwRecipientsSettingsRecord
                                                                                              .where(
                                                                                                'type_name',
                                                                                                isEqualTo: 'Phone Number',
                                                                                              )
                                                                                              .where(
                                                                                                'type_status',
                                                                                                isEqualTo: true,
                                                                                              ),
                                                                                          singleRecord: true,
                                                                                        ),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return ShimmerOneLineWidget(
                                                                                              itemWidth: 80,
                                                                                              itemHeight: 13,
                                                                                            );
                                                                                          }
                                                                                          List<DwRecipientsSettingsRecord> rowDwRecipientsSettingsRecordList = snapshot.data!;
                                                                                          // Return an empty Container when the item does not exist.
                                                                                          if (snapshot.data!.isEmpty) {
                                                                                            return Container();
                                                                                          }
                                                                                          final rowDwRecipientsSettingsRecord = rowDwRecipientsSettingsRecordList.isNotEmpty ? rowDwRecipientsSettingsRecordList.first : null;
                                                                                          return InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('CREATE_AIRTIME_PAGE_Row_ql7vo1dm_ON_TAP');
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
                                                                                                        titleName: 'Data Bundle',
                                                                                                        typeName: 'Phone Number',
                                                                                                      ),
                                                                                                    ),
                                                                                                  ));
                                                                                                },
                                                                                              ).then((value) => safeSetState(() => _model.getMyRecipient = value));

                                                                                              logFirebaseEvent('Row_set_form_field');
                                                                                              setState(() {
                                                                                                _model.textFieldPhoneNumberController?.text = _model.getMyRecipient!.accountNumber;
                                                                                              });

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'qoma264x' /* Recipient */,
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
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        AuthUserStreamWidget(
                                                                                          builder: (context) => Container(
                                                                                            width: double.infinity,
                                                                                            child: TextFormField(
                                                                                              controller: _model.textFieldPhoneNumberController,
                                                                                              focusNode: _model.textFieldPhoneNumberFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.textFieldPhoneNumberController',
                                                                                                Duration(milliseconds: 0),
                                                                                                () => setState(() {}),
                                                                                              ),
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: true,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'a4osk2w3' /* 08123456789 */,
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
                                                                                              validator: _model.textFieldPhoneNumberControllerValidator.asValidator(context),
                                                                                              inputFormatters: [
                                                                                                _model.textFieldPhoneNumberMask
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (isAndroid || isiOS)
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(1.00, -1.00),
                                                                                            child: FlutterFlowIconButton(
                                                                                              borderColor: Colors.transparent,
                                                                                              borderRadius: 0.0,
                                                                                              buttonSize: 40.0,
                                                                                              icon: Icon(
                                                                                                FFIcons.kcall,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                logFirebaseEvent('CREATE_AIRTIME_PAGE_call_ICN_ON_TAP');
                                                                                                logFirebaseEvent('IconButton_request_permissions');
                                                                                                await requestPermission(contactsPermission);
                                                                                              },
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
                                                                      width:
                                                                          15.0)),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (containerBillpaymentsServicesRecord
                                                                            ?.serviceAmountPickerStatus ==
                                                                        true)
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0xito67f' /* Choose an Amount */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final listOfAmount = containerBillpaymentsServicesRecord?.serviceAmountPicker?.toList() ?? [];
                                                                              return SingleChildScrollView(
                                                                                scrollDirection: Axis.horizontal,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(listOfAmount.length, (listOfAmountIndex) {
                                                                                    final listOfAmountItem = listOfAmount[listOfAmountIndex];
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('CREATE_AIRTIME_Container_z5qljd4b_ON_TAP');
                                                                                        logFirebaseEvent('Container_set_form_field');
                                                                                        setState(() {
                                                                                          _model.textFieldAmountController?.text = listOfAmountItem.toString();
                                                                                        });
                                                                                        logFirebaseEvent('Container_update_page_state');
                                                                                        setState(() {
                                                                                          _model.amount = listOfAmountItem.toDouble();
                                                                                        });
                                                                                      },
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'NGN ${listOfAmountItem.toString()}.00',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              if (containerBillpaymentsServicesRecord?.serviceCashBackStatus == true)
                                                                                                Text(
                                                                                                  ' NGN ${(columnBillpaymentProvidersRecord.providerDefaultCommission * listOfAmountItem * containerBillpaymentsServicesRecord!.servicerCashBackPercent).toString()}.00',
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 11.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                            ].divide(SizedBox(height: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }).divide(SizedBox(width: 15.0)),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(height: 10.0)),
                                                                      ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          15.0)),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'au32m14a' /* Amount */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                          AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Text(
                                                                              'Balance: ${valueOrDefault(currentUserDocument?.currency, '')} ${formatNumber(
                                                                                valueOrDefault(currentUserDocument?.accountBalance, 0.0),
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                              )}',
                                                                              style: FlutterFlowTheme.of(context).bodySmall,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              child: TextFormField(
                                                                                controller: _model.textFieldAmountController,
                                                                                focusNode: _model.textFieldAmountFocusNode,
                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                  '_model.textFieldAmountController',
                                                                                  Duration(milliseconds: 0),
                                                                                  () async {
                                                                                    logFirebaseEvent('CREATE_AIRTIME_TextField-Amount_ON_TEXTF');
                                                                                    logFirebaseEvent('TextField-Amount_update_page_state');
                                                                                    setState(() {
                                                                                      _model.amount = double.tryParse(_model.textFieldAmountController.text);
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                textCapitalization: TextCapitalization.none,
                                                                                textInputAction: TextInputAction.go,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  hintText: '${formatNumber(
                                                                                    containerBillpaymentsServicesRecord?.serviceMinAmount,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.automatic,
                                                                                  )} - ${formatNumber(
                                                                                    containerBillpaymentsServicesRecord?.serviceMaxAmount,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.automatic,
                                                                                  )}',
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
                                                                                  filled: true,
                                                                                  fillColor: Colors.transparent,
                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 50.0, 16.0),
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                validator: _model.textFieldAmountControllerValidator.asValidator(context),
                                                                                inputFormatters: [
                                                                                  FilteringTextInputFormatter.allow(RegExp('^\\d*\\.?\\d{0,2}\$'))
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 40.0,
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
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'v99uwn3l' /* NGN */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
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
                                                                      if (valueOrDefault<
                                                                              double>(
                                                                            _model.amount,
                                                                            0.0,
                                                                          ) >
                                                                          valueOrDefault(
                                                                              currentUserDocument?.accountBalance,
                                                                              0.0))
                                                                        AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'soxlajpq' /* Insufficient funds */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          30.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            wrapWithModel(
                                                                      model: _model
                                                                          .primaryButtonModel,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          PrimaryButtonWidget(
                                                                        buttonText:
                                                                            'Buy Airtime',
                                                                        buttonBgColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        buttonTextColor:
                                                                            FlutterFlowTheme.of(context).white,
                                                                        buttonWidth:
                                                                            450,
                                                                        buttonHeight:
                                                                            50,
                                                                        disableStatusPara: (_model.textFieldPhoneNumberController.text == null || _model.textFieldPhoneNumberController.text == '') ||
                                                                            (columnBillpaymentProvidersRecord.providerServiceType == null ||
                                                                                columnBillpaymentProvidersRecord.providerServiceType == '') ||
                                                                            ((_model.textFieldAmountController.text == null || _model.textFieldAmountController.text == '') || (_model.textFieldAmountController.text == '0')) ||
                                                                            (_model.amount! > valueOrDefault(currentUserDocument?.accountBalance, 0.0)) ||
                                                                            (_model.amount! > containerBillpaymentsServicesRecord!.serviceMaxAmount),
                                                                        disableColorPara:
                                                                            FlutterFlowTheme.of(context).disableColor,
                                                                        buttonAction:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'CREATE_AIRTIME_Container_nvpfivp4_CALLBA');
                                                                          var _shouldSetState =
                                                                              false;
                                                                          // Action 1 - Get Plugins/BillPayment Status
                                                                          logFirebaseEvent(
                                                                              'PrimaryButton_Action1-GetPlugins/BillPay');
                                                                          _model.getBillPaymentSettings =
                                                                              await queryDwPluginsRecordOnce(
                                                                            queryBuilder: (dwPluginsRecord) =>
                                                                                dwPluginsRecord.where(
                                                                              'plugin_name',
                                                                              isEqualTo: 'Bill Payment',
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          _shouldSetState =
                                                                              true;
                                                                          if (_model.getBillPaymentSettings?.pluginSecurityTransactionStatus ==
                                                                              true) {
                                                                            logFirebaseEvent('PrimaryButton_bottom_sheet');
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
                                                                                      customerNumber: _model.textFieldPhoneNumberController.text,
                                                                                      billerCode: columnBillpaymentProvidersRecord.providerBillerCode,
                                                                                      itemCode: columnBillpaymentProvidersRecord.providerItemCode,
                                                                                      name: columnBillpaymentProvidersRecord.providerShortName,
                                                                                      serviceProvider: columnBillpaymentProvidersRecord.providerName,
                                                                                      serviceType: columnBillpaymentProvidersRecord.providerServiceType,
                                                                                      amount: double.tryParse(_model.textFieldAmountController.text),
                                                                                      shortName: columnBillpaymentProvidersRecord.providerShortName,
                                                                                      providerFee: columnBillpaymentProvidersRecord.providerTransferFee,
                                                                                      country: columnBillpaymentProvidersRecord.providerCountry,
                                                                                      currency: columnBillpaymentProvidersRecord.providerCurrency,
                                                                                    ),
                                                                                  ),
                                                                                ));
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          } else {
                                                                            logFirebaseEvent('PrimaryButton_bottom_sheet');
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
                                                                                    child: SecurityAlertWidget(
                                                                                      pluginName: 'Bill Payment',
                                                                                    ),
                                                                                  ),
                                                                                ));
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          }

                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      20.0)),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 20.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 50.0,
                                                                0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .listOfAdsModel2,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child: ListOfAdsWidget(
                                                        adsStatus: true,
                                                        adsPosition: 'Bottom',
                                                        adsPages:
                                                            containerBillpaymentsServicesRecord
                                                                ?.serviceName,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
