import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/services/create_service/create_service_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/services/update_service/update_service_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/application/components/shimmers/shimmer_circle_button/shimmer_circle_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'bill_settings_model.dart';
export 'bill_settings_model.dart';

class BillSettingsWidget extends StatefulWidget {
  const BillSettingsWidget({Key? key}) : super(key: key);

  @override
  _BillSettingsWidgetState createState() => _BillSettingsWidgetState();
}

class _BillSettingsWidgetState extends State<BillSettingsWidget>
    with TickerProviderStateMixin {
  late BillSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BillSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BillSettings'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        title: 'Bill Settings',
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
                            'BILL_SETTINGS_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'sgy5l1cp' /* Bill Payments - Settings */,
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
                    child: DWSidebarWidget(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if ((valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Owner') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Admin')) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.dWHeaderModel,
                                      updateCallback: () => setState(() {}),
                                      child: DWHeaderWidget(
                                        pageTitle: 'Bill Payments - Settings',
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 20.0),
                                                  child: StreamBuilder<
                                                      List<
                                                          BillpaymentSettingsRecord>>(
                                                    stream:
                                                        queryBillpaymentSettingsRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Container(
                                                          width: 450.0,
                                                          child:
                                                              ShimmerCardWidget(
                                                            heightPara: 300,
                                                          ),
                                                        );
                                                      }
                                                      List<BillpaymentSettingsRecord>
                                                          containerBillpaymentSettingsRecordList =
                                                          snapshot.data!;
                                                      final containerBillpaymentSettingsRecord =
                                                          containerBillpaymentSettingsRecordList
                                                                  .isNotEmpty
                                                              ? containerBillpaymentSettingsRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: 500.0,
                                                        height: 1500.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment(
                                                                      -1.0, 0),
                                                              child: TabBar(
                                                                labelColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                unselectedLabelColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
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
                                                                unselectedLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelSmallFamily,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                        ),
                                                                indicatorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                indicatorWeight:
                                                                    3.0,
                                                                tabs: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .ksetting5,
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'p4vmwc6n' /* APIs & Currency */,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '4ir8twqh' /* Cash Back */,
                                                                    ),
                                                                  ),
                                                                ],
                                                                controller: _model
                                                                    .tabBarController,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: TabBarView(
                                                                controller: _model
                                                                    .tabBarController,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Form(
                                                                        key: _model
                                                                            .formKey,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.disabled,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              30.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FlutterFlowRadioButton(
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ye7qonsr' /* Public API Key */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'zrzkt6bq' /* Test API Key */,
                                                                                      )
                                                                                    ].toList(),
                                                                                    onChanged: (val) => setState(() {}),
                                                                                    controller: _model.radioButtonKeyModeValueController ??= FormFieldController<String>(FFLocalizations.of(context).getText(
                                                                                      'yzr0lkme' /* Public API Key */,
                                                                                    )),
                                                                                    optionHeight: 40.0,
                                                                                    optionWidth: 150.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                        ),
                                                                                    selectedTextStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                        ),
                                                                                    buttonPosition: RadioButtonPosition.left,
                                                                                    direction: Axis.horizontal,
                                                                                    radioButtonColor: FlutterFlowTheme.of(context).primary,
                                                                                    inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                    toggleable: false,
                                                                                    horizontalAlignment: WrapAlignment.start,
                                                                                    verticalAlignment: WrapCrossAlignment.start,
                                                                                  ),
                                                                                ].divide(SizedBox(width: 30.0)),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '91sv4oju' /* Provider */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                  ),
                                                                                  FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownProviderValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownProviderValue ??= containerBillpaymentSettingsRecord?.pluginProviderApi,
                                                                                    ),
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'myt4mx9h' /* Flutterwave */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        't2gvhtko' /* Paystack */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'p0uoer16' /* Interswitch */,
                                                                                      )
                                                                                    ],
                                                                                    onChanged: (val) => setState(() => _model.dropDownProviderValue = val),
                                                                                    height: 42.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'fku8dpfm' /* Select... */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      FFIcons.karrowDown1,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).lineColor,
                                                                                    borderWidth: 1.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(14.0, 4.0, 14.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                              if (_model.radioButtonKeyModeValue == 'Public API Key')
                                                                                wrapWithModel(
                                                                                  model: _model.inputTextFieldPublicProviderApiModel,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: InputTextFieldWidget(
                                                                                    labelPara: 'Provider Public Api Key',
                                                                                    valuePara: containerBillpaymentSettingsRecord?.pluginProviderApiKey,
                                                                                    readOnlyStatusPara: false,
                                                                                    actionPara: () async {},
                                                                                  ),
                                                                                ),
                                                                              if (_model.radioButtonKeyModeValue == 'Test API Key')
                                                                                wrapWithModel(
                                                                                  model: _model.inputTextFieldTestProviderApiModel,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: InputTextFieldWidget(
                                                                                    labelPara: 'Provider Test Api Key',
                                                                                    valuePara: containerBillpaymentSettingsRecord?.pluginProviderTestApiKey,
                                                                                    readOnlyStatusPara: false,
                                                                                    actionPara: () async {},
                                                                                  ),
                                                                                ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'j7zkkkwp' /* Default Country */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                  ),
                                                                                  FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownCountryValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownCountryValue ??= containerBillpaymentSettingsRecord?.pluginCurrency,
                                                                                    ),
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '9e431ul1' /* NG */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '90vgkulr' /* GH */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'gxdu4c6h' /* USA */,
                                                                                      )
                                                                                    ],
                                                                                    onChanged: (val) => setState(() => _model.dropDownCountryValue = val),
                                                                                    height: 42.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'lhcpwu0c' /* Select... */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      FFIcons.karrowDown1,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).lineColor,
                                                                                    borderWidth: 1.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(14.0, 4.0, 14.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                child: wrapWithModel(
                                                                                  model: _model.primaryButtonLoadingModel,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: PrimaryButtonLoadingWidget(
                                                                                    buttonText: 'Save changes',
                                                                                    buttonWidth: 130,
                                                                                    buttonHeight: 40,
                                                                                    disableStatusPara: false,
                                                                                    buttonAction: () async {
                                                                                      logFirebaseEvent('BILL_SETTINGS_Container_cz53pfkw_CALLBAC');
                                                                                      logFirebaseEvent('PrimaryButtonLoading_validate_form');
                                                                                      if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                        return;
                                                                                      }
                                                                                      logFirebaseEvent('PrimaryButtonLoading_backend_call');

                                                                                      await containerBillpaymentSettingsRecord!.reference.update(createBillpaymentSettingsRecordData(
                                                                                        pluginProviderApi: _model.dropDownProviderValue,
                                                                                        pluginProviderApiKey: _model.inputTextFieldPublicProviderApiModel.textController.text,
                                                                                        pluginCurrency: _model.dropDownCountryValue,
                                                                                      ));
                                                                                      logFirebaseEvent('PrimaryButtonLoading_action_block');
                                                                                      await action_blocks.alertSuccess(
                                                                                        context,
                                                                                        descPara: 'Saved',
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 20.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                          wrapWithModel(
                                                                            model:
                                                                                _model.primaryRoundedButtonModel1,
                                                                            updateCallback: () =>
                                                                                setState(() {}),
                                                                            updateOnChange:
                                                                                true,
                                                                            child:
                                                                                PrimaryRoundedButtonWidget(
                                                                              buttonText: 'Create Service',
                                                                              buttonBgColor: FlutterFlowTheme.of(context).primaryText,
                                                                              buttonTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              buttonWidth: 120,
                                                                              buttonHeight: 30,
                                                                              disableStatusPara: false,
                                                                              buttonAction: () async {
                                                                                logFirebaseEvent('BILL_SETTINGS_Container_92gf70xn_CALLBAC');
                                                                                logFirebaseEvent('PrimaryRoundedButton_firestore_query');
                                                                                _model.getBillSettingsData = await queryBillpaymentSettingsRecordOnce(
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);
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
                                                                                        child: CreateServiceWidget(),
                                                                                      ),
                                                                                    ));
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));

                                                                                setState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        StreamBuilder<
                                                                            List<BillpaymentsServicesRecord>>(
                                                                          stream:
                                                                              queryBillpaymentsServicesRecord(
                                                                            queryBuilder: (billpaymentsServicesRecord) =>
                                                                                billpaymentsServicesRecord.orderBy('uuid'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                                                                                child: ShimmerCard2Widget(
                                                                                  itemNo: 4,
                                                                                  itemSpacing: 20,
                                                                                  itemHeight: 182,
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<BillpaymentsServicesRecord>
                                                                                listViewBillpaymentsServicesRecordList =
                                                                                snapshot.data!;
                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewBillpaymentsServicesRecordList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 20.0),
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewBillpaymentsServicesRecord = listViewBillpaymentsServicesRecordList[listViewIndex];
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Text(
                                                                                                        listViewBillpaymentsServicesRecord.serviceName,
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                listViewBillpaymentsServicesRecord.serviceStatus == true ? 'This service Enabled' : 'This service Disabled',
                                                                                                                'Status',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontSize: 11.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                            PrimaryRoundedButtonWidget(
                                                                                                              key: Key('Key1f5_${listViewIndex}_of_${listViewBillpaymentsServicesRecordList.length}'),
                                                                                                              buttonText: 'Update',
                                                                                                              buttonBgColor: listViewBillpaymentsServicesRecord.serviceStatus == true ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).disableColor,
                                                                                                              buttonTextColor: FlutterFlowTheme.of(context).white,
                                                                                                              buttonWidth: 60,
                                                                                                              buttonHeight: 25,
                                                                                                              disableStatusPara: false,
                                                                                                              buttonTextSize: 11,
                                                                                                              buttonAction: () async {
                                                                                                                logFirebaseEvent('BILL_SETTINGS_Container_1f5tzhvj_CALLBAC');
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
                                                                                                                        child: UpdateServiceWidget(
                                                                                                                          recordRef: listViewBillpaymentsServicesRecord.reference,
                                                                                                                          serviceParaForComp: listViewBillpaymentsServicesRecord.serviceName,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ));
                                                                                                                  },
                                                                                                                ).then((value) => safeSetState(() {}));
                                                                                                              },
                                                                                                            ),
                                                                                                          ].divide(SizedBox(width: 15.0)),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                                ),
                                                                                                Text(
                                                                                                  listViewBillpaymentsServicesRecord.serviceDesc,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 15.0)),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                StreamBuilder<List<BillpaymentProvidersRecord>>(
                                                                                                  stream: queryBillpaymentProvidersRecord(
                                                                                                    queryBuilder: (billpaymentProvidersRecord) => billpaymentProvidersRecord.where(
                                                                                                      'provider_service_type',
                                                                                                      isEqualTo: listViewBillpaymentsServicesRecord.serviceName,
                                                                                                    ),
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return ShimmerCircleButtonWidget(
                                                                                                        buttonWidth: 100,
                                                                                                        buttonHeight: 28,
                                                                                                        numberOfButton: 4,
                                                                                                      );
                                                                                                    }
                                                                                                    List<BillpaymentProvidersRecord> rowBillpaymentProvidersRecordList = snapshot.data!;
                                                                                                    return SingleChildScrollView(
                                                                                                      scrollDirection: Axis.horizontal,
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: List.generate(rowBillpaymentProvidersRecordList.length, (rowIndex) {
                                                                                                          final rowBillpaymentProvidersRecord = rowBillpaymentProvidersRecordList[rowIndex];
                                                                                                          return Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                              child: Text(
                                                                                                                rowBillpaymentProvidersRecord.providerName,
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).white,
                                                                                                                      fontSize: 11.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        }).divide(SizedBox(width: 10.0)),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 15.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.noAccessErrorModel,
                                        updateCallback: () => setState(() {}),
                                        child: NoAccessErrorWidget(),
                                      ),
                                    ),
                                  ],
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
