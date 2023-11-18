import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_p_i_integration_model.dart';
export 'a_p_i_integration_model.dart';

class APIIntegrationWidget extends StatefulWidget {
  const APIIntegrationWidget({Key? key}) : super(key: key);

  @override
  _APIIntegrationWidgetState createState() => _APIIntegrationWidgetState();
}

class _APIIntegrationWidgetState extends State<APIIntegrationWidget>
    with TickerProviderStateMixin {
  late APIIntegrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => APIIntegrationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'APIIntegration'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
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
        title: 'API Integration',
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
                            'A_P_I_INTEGRATION_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'wfccbom2' /* API Integration */,
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
                    updateOnChange: true,
                    child: DWSidebarWidget(
                      selectedSidebarNav: 'API Integration',
                    ),
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
                                      'Admin') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'IT Support')) {
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      wrapWithModel(
                                        model: _model.dWHeaderModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: DWHeaderWidget(
                                          pageTitle: 'API Integration',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .titleWithBackButtonModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: TitleWithBackButtonWidget(
                                                titleName: 'API Integration',
                                                actionPara: () async {
                                                  logFirebaseEvent(
                                                      'A_P_I_INTEGRATION_Container_o6n3v4yx_CAL');
                                                  logFirebaseEvent(
                                                      'TitleWithBackButton_navigate_back');
                                                  context.safePop();
                                                },
                                              ),
                                            ),
                                            StreamBuilder<List<DwAppRecord>>(
                                              stream: queryDwAppRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Container(
                                                    width: 450.0,
                                                    child: ShimmerCardWidget(
                                                      heightPara: 300,
                                                    ),
                                                  );
                                                }
                                                List<DwAppRecord>
                                                    containerDwAppRecordList =
                                                    snapshot.data!;
                                                final containerDwAppRecord =
                                                    containerDwAppRecordList
                                                            .isNotEmpty
                                                        ? containerDwAppRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  width: 900.0,
                                                  height: 800.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment(-1.0, 0),
                                                        child: TabBar(
                                                          isScrollable: true,
                                                          labelColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          unselectedLabelColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                          indicatorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          indicatorWeight: 3.0,
                                                          tabs: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .ksms,
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                                Tab(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'xgju2frs' /* Email */,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kmessageText,
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                                Tab(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'aowa4z25' /* Sms */,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kmessages1,
                                                                  ),
                                                                ),
                                                                Tab(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'tu1jmaqx' /* Live chat */,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Tab(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '4bhefe8n' /* Pexels */,
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
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 450.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'atxkenp2' /* Email */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'pk6isizn' /* You can choose from the follow... */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              DwAppEmailApiRecord>>(
                                                                        stream:
                                                                            queryDwAppEmailApiRecord(
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return ShimmerCardWidget(
                                                                              heightPara: 110,
                                                                            );
                                                                          }
                                                                          List<DwAppEmailApiRecord>
                                                                              columnDwAppEmailApiRecordList =
                                                                              snapshot.data!;
                                                                          final columnDwAppEmailApiRecord = columnDwAppEmailApiRecordList.isNotEmpty
                                                                              ? columnDwAppEmailApiRecordList.first
                                                                              : null;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'yiah00eh' /* Provider name */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                  ),
                                                                                  FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownEmailNameValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownEmailNameValue ??= columnDwAppEmailApiRecord?.emailProviderName,
                                                                                    ),
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'lx2zijsj' /* Brevo */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'hccs7tud' /* Mailgun */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'z1a5ed90' /* Mailchimp */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '0iuyyu0y' /* Amazon SES */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '4zxpt8xp' /* Mailjet */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'cggysjbi' /* Mandrill */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '1f31osqu' /* Elastic Email */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '5s8rbt2m' /* SMTP.com */,
                                                                                      )
                                                                                    ],
                                                                                    onChanged: (val) => setState(() => _model.dropDownEmailNameValue = val),
                                                                                    width: double.infinity,
                                                                                    height: 40.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'lb6xa8zj' /* Please select... */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      FFIcons.karrowDown1,
                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 0.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).lineColor,
                                                                                    borderWidth: 1.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.inputTextFieldEmailApiModel,
                                                                                updateCallback: () => setState(() {}),
                                                                                updateOnChange: true,
                                                                                child: InputTextFieldWidget(
                                                                                  labelPara: valueOrDefault<String>(
                                                                                    '${valueOrDefault<String>(
                                                                                      _model.dropDownEmailNameValue,
                                                                                      'Provider Api',
                                                                                    )} Provider Api',
                                                                                    'Provider Api',
                                                                                  ),
                                                                                  hintPara: 'Your api key here',
                                                                                  valuePara: columnDwAppEmailApiRecord?.emailProviderApi,
                                                                                  readOnlyStatusPara: false,
                                                                                  actionPara: () async {},
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.primaryButtonLoadingSaveModel1,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: PrimaryButtonLoadingWidget(
                                                                                  buttonText: 'Save',
                                                                                  buttonWidth: 450,
                                                                                  buttonHeight: 45,
                                                                                  disableStatusPara: false,
                                                                                  buttonAction: () async {
                                                                                    logFirebaseEvent('A_P_I_INTEGRATION_PrimaryButtonLoading-S');
                                                                                    logFirebaseEvent('PrimaryButtonLoading-Save_backend_call');

                                                                                    await columnDwAppEmailApiRecord!.reference.update(createDwAppEmailApiRecordData(
                                                                                      emailProviderName: _model.dropDownEmailNameValue,
                                                                                      emailProviderApi: _model.inputTextFieldEmailApiModel.textController.text,
                                                                                    ));
                                                                                    logFirebaseEvent('PrimaryButtonLoading-Save_action_block');
                                                                                    await action_blocks.alertSuccess(
                                                                                      context,
                                                                                      descPara: 'Saved',
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 15.0)),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            30.0)),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          20.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          20.0)),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 450.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'cxadofhg' /* SMS */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'l6v6dpw3' /* You can choose from the follow... */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              DwAppSmsApiRecord>>(
                                                                        stream:
                                                                            queryDwAppSmsApiRecord(
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return ShimmerCardWidget(
                                                                              heightPara: 110,
                                                                            );
                                                                          }
                                                                          List<DwAppSmsApiRecord>
                                                                              columnDwAppSmsApiRecordList =
                                                                              snapshot.data!;
                                                                          final columnDwAppSmsApiRecord = columnDwAppSmsApiRecordList.isNotEmpty
                                                                              ? columnDwAppSmsApiRecordList.first
                                                                              : null;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'flq93n8v' /* Provider name */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall,
                                                                                  ),
                                                                                  FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownSmsNameValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownSmsNameValue ??= columnDwAppSmsApiRecord?.smsName,
                                                                                    ),
                                                                                    options: [
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'cprf38mh' /* Brevo */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'szi7r05o' /* Twilio */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'efhlqq7y' /* Nexmo */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'wb5elz58' /* Plivo */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '0medoq45' /* Msg91 */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        't5vu4jdd' /* Clickatell */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '7ekome91' /* TextMagic */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'bi71d42p' /* Africa's Talking */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'blqczzet' /* Clickatell */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'vxqaqr4v' /* Infobip */,
                                                                                      ),
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'teiafngf' /* BulkSMS */,
                                                                                      )
                                                                                    ],
                                                                                    onChanged: (val) => setState(() => _model.dropDownSmsNameValue = val),
                                                                                    width: double.infinity,
                                                                                    height: 40.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'l4fer7ha' /* Please select... */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      FFIcons.karrowDown1,
                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 0.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).lineColor,
                                                                                    borderWidth: 1.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.inputTextFieldSmsApiModel,
                                                                                updateCallback: () => setState(() {}),
                                                                                updateOnChange: true,
                                                                                child: InputTextFieldWidget(
                                                                                  labelPara: valueOrDefault<String>(
                                                                                    '${valueOrDefault<String>(
                                                                                      _model.dropDownSmsNameValue,
                                                                                      ' Provider Api',
                                                                                    )}  Provider Api',
                                                                                    ' Provider Api',
                                                                                  ),
                                                                                  hintPara: 'Your api key here',
                                                                                  valuePara: columnDwAppSmsApiRecord?.smsApi,
                                                                                  readOnlyStatusPara: false,
                                                                                  actionPara: () async {},
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.primaryButtonLoadingSaveModel2,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: PrimaryButtonLoadingWidget(
                                                                                  buttonText: 'Save',
                                                                                  buttonWidth: 450,
                                                                                  buttonHeight: 45,
                                                                                  disableStatusPara: false,
                                                                                  buttonAction: () async {
                                                                                    logFirebaseEvent('A_P_I_INTEGRATION_PrimaryButtonLoading-S');
                                                                                    logFirebaseEvent('PrimaryButtonLoading-Save_backend_call');

                                                                                    await columnDwAppSmsApiRecord!.reference.update(createDwAppSmsApiRecordData(
                                                                                      smsName: _model.dropDownSmsNameValue,
                                                                                      smsApi: _model.inputTextFieldSmsApiModel.textController.text,
                                                                                    ));
                                                                                    logFirebaseEvent('PrimaryButtonLoading-Save_action_block');
                                                                                    await action_blocks.alertSuccess(
                                                                                      context,
                                                                                      descPara: 'Saved',
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 15.0)),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            30.0)),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          20.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          20.0)),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    DwAppLiveChatApiRecord>>(
                                                              stream:
                                                                  queryDwAppLiveChatApiRecord(
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return ShimmerCardWidget(
                                                                    heightPara:
                                                                        300,
                                                                  );
                                                                }
                                                                List<DwAppLiveChatApiRecord>
                                                                    columnLiveChatApiDwAppLiveChatApiRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final columnLiveChatApiDwAppLiveChatApiRecord =
                                                                    columnLiveChatApiDwAppLiveChatApiRecordList
                                                                            .isNotEmpty
                                                                        ? columnLiveChatApiDwAppLiveChatApiRecordList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Wrap(
                                                                      spacing:
                                                                          50.0,
                                                                      runSpacing:
                                                                          50.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              400.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'qrzmqvi9' /* Live chat  */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'cw92psra' /* Live chat enables real-time in... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'qnd7kt7u' /* Provider name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                      ),
                                                                                      FlutterFlowDropDown<String>(
                                                                                        controller: _model.dropDownLiveChatNameValueController ??= FormFieldController<String>(
                                                                                          _model.dropDownLiveChatNameValue ??= columnLiveChatApiDwAppLiveChatApiRecord?.liveChatName,
                                                                                        ),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '5pc5e1ke' /* LiveChat */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '6dqd0lxg' /* Zendesk Chat */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '3qrl4fuz' /* Intercom */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'hvb66izd' /* Freshchat */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'q95rvrbv' /* Tawk.to */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'gae3e33i' /* Drift */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '3yau97ga' /* Crisp */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'jt9dyw6d' /* Olark */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'mc13hen7' /* HelpCrunch */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'gcggdpvw' /* Chatra */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'rqxns8gq' /* Brevo */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) => setState(() => _model.dropDownLiveChatNameValue = val),
                                                                                        width: double.infinity,
                                                                                        height: 40.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        hintText: FFLocalizations.of(context).getText(
                                                                                          'fdxekjob' /* Please select... */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          FFIcons.karrowDown1,
                                                                                          color: FlutterFlowTheme.of(context).lineColor,
                                                                                          size: 18.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 0.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).lineColor,
                                                                                        borderWidth: 1.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 5.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 10.0)),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.inputTextFieldLiveChatApiModel,
                                                                                updateCallback: () => setState(() {}),
                                                                                updateOnChange: true,
                                                                                child: InputTextFieldWidget(
                                                                                  labelPara: valueOrDefault<String>(
                                                                                    '${valueOrDefault<String>(
                                                                                      _model.dropDownLiveChatNameValue,
                                                                                      ' Provider Api',
                                                                                    )} Provider Api',
                                                                                    ' Provider Api',
                                                                                  ),
                                                                                  hintPara: 'Your api key here',
                                                                                  valuePara: columnLiveChatApiDwAppLiveChatApiRecord?.liveChatApi,
                                                                                  readOnlyStatusPara: false,
                                                                                  actionPara: () async {},
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 20.0)),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              400.0,
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
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '5zkud4t4' /* Chat visibility */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'ht3tgjmv' /* Where would you like the live ... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                ].divide(SizedBox(height: 6.0)),
                                                                              ),
                                                                              SwitchListTile.adaptive(
                                                                                value: _model.switchListTileFrontendValue ??= columnLiveChatApiDwAppLiveChatApiRecord!.frontendStatus,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.switchListTileFrontendValue = newValue!);
                                                                                },
                                                                                title: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'pw24lcss' /* Frontend */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                ),
                                                                                subtitle: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'luyqhr8e' /* Enable live chat on Frontend o... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).accent1,
                                                                                dense: true,
                                                                                controlAffinity: ListTileControlAffinity.trailing,
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              ),
                                                                              SwitchListTile.adaptive(
                                                                                value: _model.switchListTileWebAppValue ??= columnLiveChatApiDwAppLiveChatApiRecord!.webAppStatus,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.switchListTileWebAppValue = newValue!);
                                                                                },
                                                                                title: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'ek8jcurx' /* Web app */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                ),
                                                                                subtitle: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'xfuba9i9' /* Enable live chat on your web a... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).accent1,
                                                                                dense: true,
                                                                                controlAffinity: ListTileControlAffinity.trailing,
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              ),
                                                                              SwitchListTile.adaptive(
                                                                                value: _model.switchListTileMobileAppValue ??= columnLiveChatApiDwAppLiveChatApiRecord!.mobileAppStatus,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.switchListTileMobileAppValue = newValue!);
                                                                                },
                                                                                title: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'i582m1jn' /* Mobile app */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                ),
                                                                                subtitle: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '1dxrmog1' /* Enable live chat on your mobil... */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                ),
                                                                                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).accent1,
                                                                                dense: true,
                                                                                controlAffinity: ListTileControlAffinity.trailing,
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 20.0)).around(SizedBox(height: 20.0)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    wrapWithModel(
                                                                      model: _model
                                                                          .primaryButtonLoadingSaveModel3,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          PrimaryButtonLoadingWidget(
                                                                        buttonText:
                                                                            'Save',
                                                                        buttonWidth:
                                                                            valueOrDefault<int>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 450;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 200;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 200;
                                                                            } else {
                                                                              return 200;
                                                                            }
                                                                          }(),
                                                                          200,
                                                                        ),
                                                                        buttonHeight:
                                                                            45,
                                                                        disableStatusPara:
                                                                            false,
                                                                        buttonAction:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'A_P_I_INTEGRATION_PrimaryButtonLoading-S');
                                                                          logFirebaseEvent(
                                                                              'PrimaryButtonLoading-Save_backend_call');

                                                                          await columnLiveChatApiDwAppLiveChatApiRecord!
                                                                              .reference
                                                                              .update(createDwAppLiveChatApiRecordData(
                                                                            liveChatName:
                                                                                _model.dropDownLiveChatNameValue,
                                                                            liveChatApi:
                                                                                _model.inputTextFieldLiveChatApiModel.textController.text,
                                                                            frontendStatus:
                                                                                _model.switchListTileFrontendValue,
                                                                            webAppStatus:
                                                                                _model.switchListTileWebAppValue,
                                                                            mobileAppStatus:
                                                                                _model.switchListTileMobileAppValue,
                                                                          ));
                                                                          logFirebaseEvent(
                                                                              'PrimaryButtonLoading-Save_action_block');
                                                                          await action_blocks
                                                                              .alertSuccess(
                                                                            context,
                                                                            descPara:
                                                                                'Saved',
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          height:
                                                                              20.0))
                                                                      .around(SizedBox(
                                                                          height:
                                                                              20.0)),
                                                                );
                                                              },
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                StreamBuilder<
                                                                    List<
                                                                        AppPhotosApiRecord>>(
                                                                  stream:
                                                                      queryAppPhotosApiRecord(
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return ShimmerCardWidget(
                                                                        heightPara:
                                                                            250,
                                                                      );
                                                                    }
                                                                    List<AppPhotosApiRecord>
                                                                        wrapAppPhotosApiRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final wrapAppPhotosApiRecord = wrapAppPhotosApiRecordList
                                                                            .isNotEmpty
                                                                        ? wrapAppPhotosApiRecordList
                                                                            .first
                                                                        : null;
                                                                    return Wrap(
                                                                      spacing:
                                                                          50.0,
                                                                      runSpacing:
                                                                          50.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .end,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              400.0,
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
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'lpkx12jw' /* Pexels */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '8dtmy4sk' /* To enable the Pexels API and o... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        wrapAppPhotosApiRecord?.pexelsStatus == true ? 'Enabled' : 'Disabled',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                      Switch.adaptive(
                                                                                        value: _model.switchPexelsStatusValue ??= wrapAppPhotosApiRecord!.pexelsStatus,
                                                                                        onChanged: (newValue) async {
                                                                                          setState(() => _model.switchPexelsStatusValue = newValue!);
                                                                                        },
                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                                                                                        inactiveTrackColor: FlutterFlowTheme.of(context).lineColor,
                                                                                        inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 20.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 15.0)),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  wrapWithModel(
                                                                                    model: _model.inputTextFieldPexelsApiModel,
                                                                                    updateCallback: () => setState(() {}),
                                                                                    updateOnChange: true,
                                                                                    child: InputTextFieldWidget(
                                                                                      labelPara: 'Pexels Api',
                                                                                      hintPara: 'Your api key here',
                                                                                      valuePara: wrapAppPhotosApiRecord?.pexelsApi,
                                                                                      readOnlyStatusPara: false,
                                                                                      actionPara: () async {},
                                                                                    ),
                                                                                  ),
                                                                                  wrapWithModel(
                                                                                    model: _model.primaryButtonLoadingSaveModel4,
                                                                                    updateCallback: () => setState(() {}),
                                                                                    updateOnChange: true,
                                                                                    child: PrimaryButtonLoadingWidget(
                                                                                      buttonText: 'Save',
                                                                                      buttonWidth: 450,
                                                                                      buttonHeight: 45,
                                                                                      disableStatusPara: false,
                                                                                      buttonAction: () async {
                                                                                        logFirebaseEvent('A_P_I_INTEGRATION_PrimaryButtonLoading-S');
                                                                                        logFirebaseEvent('PrimaryButtonLoading-Save_backend_call');

                                                                                        await wrapAppPhotosApiRecord!.reference.update(createAppPhotosApiRecordData(
                                                                                          pexelsApi: _model.inputTextFieldPexelsApiModel.textController.text,
                                                                                          pexelsStatus: _model.switchPexelsStatusValue,
                                                                                        ));
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 15.0)),
                                                                              ),
                                                                            ].divide(SizedBox(height: 30.0)),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              400.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                20.0,
                                                                                20.0,
                                                                                20.0),
                                                                            child:
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: PexelsAPICall.call(
                                                                                query: 'tech',
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return ShimmerCardWidget(
                                                                                    heightPara: 40,
                                                                                  );
                                                                                }
                                                                                final columnRequestStatisticsPexelsAPIResponse = snapshot.data!;
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'x4jl3uml' /* Pexels Monthly Statistics */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'rvs10wz3' /* Total request limit */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            columnRequestStatisticsPexelsAPIResponse.getHeader('x-ratelimit-limit'),
                                                                                            'Limit',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                            '620kgrj6' /* Remaining requests */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            columnRequestStatisticsPexelsAPIResponse.getHeader('x-ratelimit-remaining'),
                                                                                            'Remaining',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                            'v73blxd4' /* Monthly period roll over */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            functions.readableUnixTimestamp(valueOrDefault<String>(
                                                                                              columnRequestStatisticsPexelsAPIResponse.getHeader('x-ratelimit-reset'),
                                                                                              'Reset',
                                                                                            )),
                                                                                            'DateTime',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 15.0)),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          30.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          30.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
