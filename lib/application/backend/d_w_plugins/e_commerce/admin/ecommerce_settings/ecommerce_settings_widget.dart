import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/dropdown_searchable/dropdown_searchable_widget.dart';
import '/application/components/forms/left_sided_amount_text_field/left_sided_amount_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/application/components/shimmers/shimmer_one_line/shimmer_one_line_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ecommerce_settings_model.dart';
export 'ecommerce_settings_model.dart';

class EcommerceSettingsWidget extends StatefulWidget {
  const EcommerceSettingsWidget({Key? key}) : super(key: key);

  @override
  _EcommerceSettingsWidgetState createState() =>
      _EcommerceSettingsWidgetState();
}

class _EcommerceSettingsWidgetState extends State<EcommerceSettingsWidget> {
  late EcommerceSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcommerceSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EcommerceSettings'});
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
        title: 'Settings',
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
                            'ECOMMERCE_SETTINGS_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '8jrn3qf5' /* Ecommerce - Settings */,
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
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              if (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'User') {
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
                                          pageTitle: 'Ecommerce - Settings',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        child: StreamBuilder<
                                            List<EcommerceSettingsRecord>>(
                                          stream: queryEcommerceSettingsRecord(
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return ShimmerOneDetailWidget();
                                            }
                                            List<EcommerceSettingsRecord>
                                                containerEcommerceSettingsRecordList =
                                                snapshot.data!;
                                            final containerEcommerceSettingsRecord =
                                                containerEcommerceSettingsRecordList
                                                        .isNotEmpty
                                                    ? containerEcommerceSettingsRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: 400.0,
                                              decoration: BoxDecoration(),
                                              child: Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        StreamBuilder<
                                                            List<DwAppRecord>>(
                                                          stream:
                                                              queryDwAppRecord(
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return ShimmerOneLineWidget();
                                                            }
                                                            List<DwAppRecord>
                                                                dropdownSearchablePlatformCurrencyDwAppRecordList =
                                                                snapshot.data!;
                                                            final dropdownSearchablePlatformCurrencyDwAppRecord =
                                                                dropdownSearchablePlatformCurrencyDwAppRecordList
                                                                        .isNotEmpty
                                                                    ? dropdownSearchablePlatformCurrencyDwAppRecordList
                                                                        .first
                                                                    : null;
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .dropdownSearchablePlatformCurrencyModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  DropdownSearchableWidget(
                                                                labelPara:
                                                                    'Platform Currency',
                                                                hintPara:
                                                                    'Search ...',
                                                                optionValuePara:
                                                                    containerEcommerceSettingsRecord
                                                                        ?.pluginCurrency,
                                                                dropdownIcon:
                                                                    Icon(
                                                                  FFIcons
                                                                      .karrowDown1,
                                                                ),
                                                                searchablePara:
                                                                    'Search network...',
                                                                listLabelPara:
                                                                    functions
                                                                        .listOfCurrencies(),
                                                                listValuePara:
                                                                    functions
                                                                        .listOfCurrencies(),
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 15.0)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                'h7uetmd4' /* Transactions or Bank Fees */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'oph3bofm' /* Do you charge for transactions... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              13.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 400.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .leftSidedAmountTextFieldTransactionFeeModel,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        LeftSidedAmountTextFieldWidget(
                                                                      labelPara:
                                                                          'If you do not charge for transactions, leave this field blank or set to 0. (This is based on the platform currency)',
                                                                      hintPara:
                                                                          '100',
                                                                      valuePara: containerEcommerceSettingsRecord
                                                                          ?.pluginTransactionFee
                                                                          ?.toString(),
                                                                      sidedText:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model.dropdownSearchablePlatformCurrencyModel.dropDownValue == null ||
                                                                                _model.dropdownSearchablePlatformCurrencyModel.dropDownValue == ''
                                                                            ? containerEcommerceSettingsRecord?.pluginReceivedCurrency
                                                                            : _model.dropdownSearchablePlatformCurrencyModel.dropDownValue,
                                                                        'NGN',
                                                                      ),
                                                                      actionPara:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jykvbcep' /* Do you charge for Bank Transfe... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              13.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 400.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .leftSidedAmountTextFieldBankTransferFeeModel,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        LeftSidedAmountTextFieldWidget(
                                                                      labelPara:
                                                                          'If you do not charge for bank transfers, leave this field blank or set to 0. (This is based on the currency you are using to transfer to your customers)',
                                                                      hintPara:
                                                                          '100',
                                                                      valuePara: containerEcommerceSettingsRecord
                                                                          ?.pluginBankTransferFee
                                                                          ?.toString(),
                                                                      sidedText:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model.dropdownSearchablePlatformCurrencyModel.dropDownValue == null ||
                                                                                _model.dropdownSearchablePlatformCurrencyModel.dropDownValue == ''
                                                                            ? containerEcommerceSettingsRecord?.pluginReceivedCurrency
                                                                            : _model.dropdownSearchablePlatformCurrencyModel.dropDownValue,
                                                                        'NGN',
                                                                      ),
                                                                      actionPara:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 20.0)),
                                                        ),
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
                                                                'h7pes0zv' /* Tax */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pbzgc50j' /* Tax/VAT */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              13.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 400.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .rightSidedAmountTextFieldTaxFeeModel,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        RightSidedAmountTextFieldWidget(
                                                                      labelPara:
                                                                          'Put in the percentage of the Tax/VAT in percentage (%)',
                                                                      valuePara: containerEcommerceSettingsRecord
                                                                          ?.pluginTax
                                                                          ?.toString(),
                                                                      sidedText:
                                                                          '%',
                                                                      actionPara:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 15.0)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 30.0)),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .primaryButtonLoadingModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          PrimaryButtonLoadingWidget(
                                                        buttonText:
                                                            'Save changes',
                                                        buttonWidth: 130,
                                                        buttonHeight: 50,
                                                        buttonAction: () async {
                                                          logFirebaseEvent(
                                                              'ECOMMERCE_SETTINGS_Container_uazjbd86_CA');
                                                          logFirebaseEvent(
                                                              'PrimaryButtonLoading_validate_form');
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          logFirebaseEvent(
                                                              'PrimaryButtonLoading_backend_call');

                                                          await containerEcommerceSettingsRecord!
                                                              .reference
                                                              .update(
                                                                  createEcommerceSettingsRecordData(
                                                            pluginCurrency: _model
                                                                .dropdownSearchablePlatformCurrencyModel
                                                                .dropDownValue,
                                                            pluginTax: double
                                                                .tryParse(_model
                                                                    .rightSidedAmountTextFieldTaxFeeModel
                                                                    .textController
                                                                    .text),
                                                            pluginTransactionFee:
                                                                double.tryParse(_model
                                                                    .leftSidedAmountTextFieldTransactionFeeModel
                                                                    .textController
                                                                    .text),
                                                            pluginBankTransferFee:
                                                                double.tryParse(_model
                                                                    .leftSidedAmountTextFieldBankTransferFeeModel
                                                                    .textController
                                                                    .text),
                                                          ));
                                                          logFirebaseEvent(
                                                              'PrimaryButtonLoading_action_block');
                                                          await action_blocks
                                                              .alertSuccess(
                                                            context,
                                                            descPara: 'Saved',
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 30.0)),
                                                ),
                                              ),
                                            );
                                          },
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
