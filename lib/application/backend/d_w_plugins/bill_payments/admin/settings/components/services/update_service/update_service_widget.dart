import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/providers/list_of_providers_comp/list_of_providers_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/number_text_field/number_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_service_model.dart';
export 'update_service_model.dart';

class UpdateServiceWidget extends StatefulWidget {
  const UpdateServiceWidget({
    Key? key,
    this.recordRef,
    String? serviceParaForComp,
  })  : this.serviceParaForComp = serviceParaForComp ?? 'Airtime',
        super(key: key);

  final DocumentReference? recordRef;
  final String serviceParaForComp;

  @override
  _UpdateServiceWidgetState createState() => _UpdateServiceWidgetState();
}

class _UpdateServiceWidgetState extends State<UpdateServiceWidget>
    with TickerProviderStateMixin {
  late UpdateServiceModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(0.0, 45.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateServiceModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

    _model.textFieldCashBackPercentFocusNode ??= FocusNode();
    _model.textFieldCashBackPercentFocusNode!
        .addListener(() => setState(() {}));

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
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
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Update',
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'UPDATE_SERVICE_Container_uqh89c9q_CALLBA');
                    logFirebaseEvent('ModalHeader_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Container(
                  width: 500.0,
                  height: 500.0,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<BillpaymentsServicesRecord>(
                    stream: BillpaymentsServicesRecord.getDocument(
                        widget.recordRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: ShimmerCardWidget(
                            heightPara: 350,
                          ),
                        );
                      }
                      final columnBillpaymentsServicesRecord = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            columnBillpaymentsServicesRecord.serviceName,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(-1.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor:
                                        FlutterFlowTheme.of(context).primary,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                    unselectedLabelStyle: FlutterFlowTheme.of(
                                            context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    indicatorWeight: 3.0,
                                    tabs: [
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '0h0kti5m' /* Action */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'wbyc6sq8' /* Providers */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '4i1zlwtz' /* Cash Back */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '278p9rfo' /* Amount Picker */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'wcyr0hl4' /* Message */,
                                        ),
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Form(
                                        key: _model.formKey1,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnBillpaymentsServicesRecord
                                                                        .serviceStatus ==
                                                                    true
                                                                ? 'Enabled'
                                                                : 'Disabled',
                                                            'Status',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Switch.adaptive(
                                                          value: _model
                                                                  .switchStatusValue ??=
                                                              columnBillpaymentsServicesRecord
                                                                  .serviceStatus,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                    .switchStatusValue =
                                                                newValue!);
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .lineColor,
                                                          inactiveThumbColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      columnBillpaymentsServicesRecord
                                                                  .serviceStatus ==
                                                              true
                                                          ? 'Deactivate or suspend this service if you do not wish users to have access for purchases.'
                                                          : 'Enable and unsuspend this service to grant users access for purchases.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 150.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .rightSidedAmountTextFieldMinModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  RightSidedAmountTextFieldWidget(
                                                                labelPara:
                                                                    'Minimum ${valueOrDefault<String>(
                                                                  columnBillpaymentsServicesRecord
                                                                      .serviceName,
                                                                  '0',
                                                                )} Amount',
                                                                hintPara: '50',
                                                                valuePara: columnBillpaymentsServicesRecord
                                                                    .serviceMinAmount
                                                                    .toString(),
                                                                sidedText:
                                                                    'NGN',
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 150.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .rightSidedAmountTextFieldMaxModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  RightSidedAmountTextFieldWidget(
                                                                labelPara:
                                                                    'Maximum ${valueOrDefault<String>(
                                                                  columnBillpaymentsServicesRecord
                                                                      .serviceName,
                                                                  '0',
                                                                )} Amount',
                                                                hintPara: '100',
                                                                valuePara: columnBillpaymentsServicesRecord
                                                                    .serviceMaxAmount
                                                                    .toString(),
                                                                sidedText:
                                                                    'NGN',
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 20.0)),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .primaryButtonLoadingModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              PrimaryButtonLoadingWidget(
                                                            buttonText:
                                                                'Save changes',
                                                            buttonBgColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            buttonWidth:
                                                                valueOrDefault<
                                                                    int>(
                                                              () {
                                                                if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointSmall) {
                                                                  return 450;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointMedium) {
                                                                  return 150;
                                                                } else if (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    kBreakpointLarge) {
                                                                  return 150;
                                                                } else {
                                                                  return 150;
                                                                }
                                                              }(),
                                                              150,
                                                            ),
                                                            buttonHeight: 45,
                                                            disableStatusPara:
                                                                false,
                                                            buttonAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'UPDATE_SERVICE_Container_lmoqlhwi_CALLBA');
                                                              // Action 1 - Validate form
                                                              logFirebaseEvent(
                                                                  'PrimaryButtonLoading_Action1-Validatefor');
                                                              if (_model.formKey1
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey1
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                              // Action 3 - Create service
                                                              logFirebaseEvent(
                                                                  'PrimaryButtonLoading_Action3-Createservi');

                                                              await columnBillpaymentsServicesRecord
                                                                  .reference
                                                                  .update(
                                                                      createBillpaymentsServicesRecordData(
                                                                serviceStatus:
                                                                    _model
                                                                        .switchStatusValue,
                                                                serviceMinAmount:
                                                                    int.tryParse(_model
                                                                        .rightSidedAmountTextFieldMinModel
                                                                        .textController
                                                                        .text),
                                                                serviceMaxAmount:
                                                                    int.tryParse(_model
                                                                        .rightSidedAmountTextFieldMaxModel
                                                                        .textController
                                                                        .text),
                                                              ));
                                                              logFirebaseEvent(
                                                                  'PrimaryButtonLoading_action_block');
                                                              await action_blocks
                                                                  .alertSuccess(
                                                                context,
                                                                descPara:
                                                                    'Saved',
                                                              );
                                                              logFirebaseEvent(
                                                                  'PrimaryButtonLoading_close_dialog,_drawe');
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 40.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 700.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .listOfProvidersCompModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      ListOfProvidersCompWidget(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xe7rq8zw' /* Service Cash Back */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'lwqdvhbf' /* Enable or Disable Cash Back */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                Switch.adaptive(
                                                  value: _model
                                                          .switchCashBackValue ??=
                                                      columnBillpaymentsServicesRecord
                                                          .serviceCashBackStatus,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .switchCashBackValue =
                                                        newValue!);
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  activeTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
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
                                                          'xn3dulaa' /* Cash Bank (Min-0.1=10%) / (Max... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Container(
                                                        width: 500.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .textFieldCashBackPercentController ??=
                                                                TextEditingController(
                                                              text: columnBillpaymentsServicesRecord
                                                                  .servicerCashBackPercent
                                                                  .toString(),
                                                            ),
                                                            focusNode: _model
                                                                .textFieldCashBackPercentFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textFieldCashBackPercentController',
                                                              Duration(
                                                                  milliseconds:
                                                                      0),
                                                              () => setState(
                                                                  () {}),
                                                            ),
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'sd6cla6k' /* 0.1 */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldHint,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            keyboardType:
                                                                const TextInputType
                                                                    .numberWithOptions(
                                                                    decimal:
                                                                        true),
                                                            validator: _model
                                                                .textFieldCashBackPercentControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .primaryButtonLoadingModel2,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child:
                                                    PrimaryButtonLoadingWidget(
                                                  buttonText: 'Save Changes',
                                                  buttonBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  buttonWidth:
                                                      valueOrDefault<int>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 450;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 150;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 150;
                                                      } else {
                                                        return 150;
                                                      }
                                                    }(),
                                                    150,
                                                  ),
                                                  disableStatusPara: false,
                                                  buttonAction: () async {
                                                    logFirebaseEvent(
                                                        'UPDATE_SERVICE_Container_3kwsjheb_CALLBA');
                                                    logFirebaseEvent(
                                                        'PrimaryButtonLoading_backend_call');

                                                    await widget.recordRef!.update(
                                                        createBillpaymentsServicesRecordData(
                                                      serviceCashBackStatus: _model
                                                          .switchCashBackValue,
                                                      servicerCashBackPercent:
                                                          double.tryParse(_model
                                                              .textFieldCashBackPercentController
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
                                            ),
                                          ].divide(SizedBox(height: 15.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '29sbzl15' /* Service Amount Picker */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'cco0suem' /* Enable or Disable Amount Picke... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                                Switch.adaptive(
                                                  value: _model
                                                          .switchAmountPickerValue ??=
                                                      columnBillpaymentsServicesRecord
                                                          .serviceAmountPickerStatus,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .switchAmountPickerValue =
                                                        newValue!);
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  activeTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ],
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final listOfAmount =
                                                    columnBillpaymentsServicesRecord
                                                        .serviceAmountPicker
                                                        .toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        listOfAmount.length,
                                                        (listOfAmountIndex) {
                                                      final listOfAmountItem =
                                                          listOfAmount[
                                                              listOfAmountIndex];
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      6.0,
                                                                      6.0,
                                                                      6.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'NGN ${listOfAmountItem.toString()}.00',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    48.0,
                                                                buttonSize:
                                                                    30.0,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 15.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'UPDATE_SERVICE_close_outlined_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');

                                                                  await widget
                                                                      .recordRef!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'service_amount_picker':
                                                                            FieldValue.arrayRemove([
                                                                          listOfAmountItem
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 15.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .numberTextFieldAmountPickerModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          NumberTextFieldWidget(
                                                        labelPara:
                                                            'Amount (100):',
                                                        hintPara: '100',
                                                        readOnlyStatusPara:
                                                            false,
                                                        actionPara: () async {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .primaryButtonLoadingModel3,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      PrimaryButtonLoadingWidget(
                                                    buttonText: 'Add',
                                                    buttonBgColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    buttonWidth: 80,
                                                    buttonHeight: 40,
                                                    disableStatusPara: _model
                                                                .numberTextFieldAmountPickerModel
                                                                .textController
                                                                .text ==
                                                            null ||
                                                        _model
                                                                .numberTextFieldAmountPickerModel
                                                                .textController
                                                                .text ==
                                                            '',
                                                    disableColorPara:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .disableColor,
                                                    buttonAction: () async {
                                                      logFirebaseEvent(
                                                          'UPDATE_SERVICE_Container_dm6wz0i0_CALLBA');
                                                      logFirebaseEvent(
                                                          'PrimaryButtonLoading_backend_call');

                                                      await widget.recordRef!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'service_amount_picker':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              int.tryParse(_model
                                                                  .numberTextFieldAmountPickerModel
                                                                  .textController
                                                                  .text)
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 20.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .primaryButtonLoadingModel4,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child:
                                                    PrimaryButtonLoadingWidget(
                                                  buttonText: 'Save Changes',
                                                  buttonBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  buttonWidth:
                                                      valueOrDefault<int>(
                                                    () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 450;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 150;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 150;
                                                      } else {
                                                        return 150;
                                                      }
                                                    }(),
                                                    150,
                                                  ),
                                                  disableStatusPara: false,
                                                  buttonAction: () async {
                                                    logFirebaseEvent(
                                                        'UPDATE_SERVICE_Container_povqtcqu_CALLBA');
                                                    logFirebaseEvent(
                                                        'PrimaryButtonLoading_backend_call');

                                                    await widget.recordRef!.update(
                                                        createBillpaymentsServicesRecordData(
                                                      serviceAmountPickerStatus:
                                                          _model
                                                              .switchAmountPickerValue,
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
                                            ),
                                          ].divide(SizedBox(height: 15.0)),
                                        ),
                                      ),
                                      Form(
                                        key: _model.formKey2,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '62kbf0k5' /* Notify your users about the re... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .inputTextFieldSuspensionTitleModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child: InputTextFieldWidget(
                                                  labelPara: 'Suspension Title',
                                                  valuePara:
                                                      columnBillpaymentsServicesRecord
                                                          .suspensionTitle,
                                                  readOnlyStatusPara: false,
                                                  actionPara: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .inputTextAreaSuspensionDescModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child: InputTextAreaWidget(
                                                  labelPara:
                                                      'Suspension Description',
                                                  valuePara:
                                                      columnBillpaymentsServicesRecord
                                                          .suspensionDesc,
                                                  readOnlyStatusPara: false,
                                                  actionPara: () async {},
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .primaryButtonLoadingModel5,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child:
                                                        PrimaryButtonLoadingWidget(
                                                      buttonText:
                                                          'Save changes',
                                                      buttonBgColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      buttonWidth:
                                                          valueOrDefault<int>(
                                                        () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 450;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 150;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 150;
                                                          } else {
                                                            return 150;
                                                          }
                                                        }(),
                                                        150,
                                                      ),
                                                      buttonHeight: 45,
                                                      disableStatusPara: false,
                                                      buttonAction: () async {
                                                        logFirebaseEvent(
                                                            'UPDATE_SERVICE_Container_lsiq1eer_CALLBA');
                                                        // Action 1 - Validate form
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_Action1-Validatefor');
                                                        if (_model.formKey2
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey2
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        // Action 3 - Create service
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_Action3-Createservi');

                                                        await columnBillpaymentsServicesRecord
                                                            .reference
                                                            .update(
                                                                createBillpaymentsServicesRecordData(
                                                          suspensionTitle: _model
                                                              .inputTextFieldSuspensionTitleModel
                                                              .textController
                                                              .text,
                                                          suspensionDesc: _model
                                                              .inputTextAreaSuspensionDescModel
                                                              .textController
                                                              .text,
                                                        ));
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_action_block');
                                                        await action_blocks
                                                            .alertSuccess(
                                                          context,
                                                          descPara: 'Saved',
                                                        );
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_close_dialog,_drawe');
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 20.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
