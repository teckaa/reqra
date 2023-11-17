import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'update_provider_model.dart';
export 'update_provider_model.dart';

class UpdateProviderWidget extends StatefulWidget {
  const UpdateProviderWidget({
    Key? key,
    this.recordRef,
    this.amountPickerPara,
  }) : super(key: key);

  final DocumentReference? recordRef;
  final List<int>? amountPickerPara;

  @override
  _UpdateProviderWidgetState createState() => _UpdateProviderWidgetState();
}

class _UpdateProviderWidgetState extends State<UpdateProviderWidget>
    with TickerProviderStateMixin {
  late UpdateProviderModel _model;

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
    _model = createModel(context, () => UpdateProviderModel());

    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));

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
      child: Container(
        width: 700.0,
        height: MediaQuery.sizeOf(context).height * 0.9,
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
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            wrapWithModel(
              model: _model.modalHeaderModel,
              updateCallback: () => setState(() {}),
              child: ModalHeaderWidget(
                headerTitlePara: 'Update Provider',
                headerActionPara: () async {
                  logFirebaseEvent('UPDATE_PROVIDER_Container_kybmkbxw_CALLB');
                  logFirebaseEvent('ModalHeader_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'nfzfnq6y' /* Update */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.00, 0.00),
                            child: wrapWithModel(
                              model: _model.primaryButtonLoadingModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: PrimaryButtonLoadingWidget(
                                buttonText: 'Save Changes',
                                buttonBgColor:
                                    FlutterFlowTheme.of(context).primary,
                                buttonTextColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                buttonWidth: 120,
                                buttonHeight: 45,
                                disableStatusPara: (_model
                                                .inputTextFieldProviderNameModel
                                                .textController
                                                .text ==
                                            null ||
                                        _model.inputTextFieldProviderNameModel
                                                .textController.text ==
                                            '') ||
                                    (_model.inputTextFieldProviderCommissionModel
                                                .textController.text ==
                                            null ||
                                        _model.inputTextFieldProviderCommissionModel
                                                .textController.text ==
                                            ''),
                                disableColorPara:
                                    FlutterFlowTheme.of(context).disableColor,
                                buttonAction: () async {
                                  logFirebaseEvent(
                                      'UPDATE_PROVIDER_Container_wiwlon6q_CALLB');
                                  logFirebaseEvent(
                                      'PrimaryButtonLoading_backend_call');

                                  await widget.recordRef!.update(
                                      createBillpaymentProvidersRecordData(
                                    providerName: _model
                                        .inputTextFieldProviderNameModel
                                        .textController
                                        .text,
                                    providerServiceType:
                                        _model.dropDownTypeOfServiceValue,
                                    providerStatus: _model.switchProviderValue,
                                    providerLogo: _model.getImageData,
                                    providerDefaultCommission: double.tryParse(
                                        _model
                                            .inputTextFieldProviderCommissionModel
                                            .textController
                                            .text),
                                    providerBillerCode: _model
                                        .inputTextFieldBillerCodeModel
                                        .textController
                                        .text,
                                    providerBillerName: _model
                                        .inputTextFieldBillerNameModel
                                        .textController
                                        .text,
                                    providerItemCode: _model
                                        .inputTextFieldItemCodeModel
                                        .textController
                                        .text,
                                    providerShortName: _model
                                        .inputTextFieldProviderShortNameModel
                                        .textController
                                        .text,
                                    providerTransferFee: int.tryParse(_model
                                        .rightSidedAmountTextFieldTransferFeeModel
                                        .textController
                                        .text),
                                    providerCountry:
                                        _model.dropDownCountryValue,
                                    providerCurrency:
                                        _model.dropDownCurrencyValue,
                                    cashbackStatus: _model.switchCashBackValue,
                                    cashbackPercent: double.tryParse(
                                        _model.textController.text),
                                  ));
                                  logFirebaseEvent(
                                      'PrimaryButtonLoading_bottom_sheet');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<BillpaymentProvidersRecord>(
                              stream: BillpaymentProvidersRecord.getDocument(
                                  widget.recordRef!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return ShimmerCardWidget(
                                    heightPara: 400,
                                  );
                                }
                                final wrapBillpaymentProvidersRecord =
                                    snapshot.data!;
                                return Wrap(
                                  spacing: 50.0,
                                  runSpacing: 50.0,
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.spaceBetween,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 150.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wm1zppoo' /* Provider Logo */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmallFamily,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily),
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1afp2nie' /* Upload square image and should... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 11.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 3.0)),
                                          ),
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'UPDATE_PROVIDER_Container_qs6yssp7_ON_TA');
                                                logFirebaseEvent(
                                                    'PhotoGrid_alert_dialog');
                                                await showAlignedDialog(
                                                  barrierColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .overlay,
                                                  barrierDismissible: false,
                                                  context: context,
                                                  isGlobal: true,
                                                  avoidOverflow: false,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child: WebViewAware(
                                                          child: Container(
                                                        height: 800.0,
                                                        width: 800.0,
                                                        child:
                                                            ListOfMediaCompWidget(),
                                                      )),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model.getImageData =
                                                        value));

                                                setState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.photoGridModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: PhotoGridWidget(
                                                  photoWidth: 150,
                                                  photoHeight: 150,
                                                  photoPath: _model
                                                                  .getImageData !=
                                                              null &&
                                                          _model.getImageData !=
                                                              ''
                                                      ? _model.getImageData
                                                      : wrapBillpaymentProvidersRecord
                                                          .providerLogo,
                                                  photoName: 'Provider Image',
                                                  bgColor: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Container(
                                      width: 400.0,
                                      decoration: BoxDecoration(),
                                      child: Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'e6kk8mr1' /* Services */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'dvhexr8i' /* Enable or Disable Provider */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Switch.adaptive(
                                                          value: _model
                                                                  .switchProviderValue ??=
                                                              wrapBillpaymentProvidersRecord
                                                                  .providerStatus,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                    .switchProviderValue =
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 150.0,
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
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'oopkryvd' /* Country */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                ),
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                                  controller: _model
                                                                          .dropDownCountryValueController ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model.dropDownCountryValue ??=
                                                                        wrapBillpaymentProvidersRecord
                                                                            .providerCountry,
                                                                  ),
                                                                  options: List<
                                                                      String>.from([
                                                                    'NG'
                                                                  ]),
                                                                  optionLabels: [
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'whudosbt' /* Nigeria */,
                                                                    )
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          _model.dropDownCountryValue =
                                                                              val),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '2ua2h1tx' /* Please select... */,
                                                                  ),
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .karrowDown1,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      0.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 150.0,
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
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'pssfgcj4' /* Currency */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                ),
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                                  controller: _model
                                                                          .dropDownCurrencyValueController ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model.dropDownCurrencyValue ??=
                                                                        wrapBillpaymentProvidersRecord
                                                                            .providerCurrency,
                                                                  ),
                                                                  options: [
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1xj7xrzp' /* NGN */,
                                                                    )
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          _model.dropDownCurrencyValue =
                                                                              val),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '12hjk1e9' /* Please select... */,
                                                                  ),
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .karrowDown1,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      0.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 15.0)),
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
                                                            '05al54tv' /* Service */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                        FutureBuilder<
                                                            List<
                                                                BillpaymentsServicesRecord>>(
                                                          future:
                                                              queryBillpaymentsServicesRecordOnce(),
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
                                                            List<BillpaymentsServicesRecord>
                                                                dropDownTypeOfServiceBillpaymentsServicesRecordList =
                                                                snapshot.data!;
                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownTypeOfServiceValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownTypeOfServiceValue ??=
                                                                    wrapBillpaymentProvidersRecord
                                                                        .providerServiceType,
                                                              ),
                                                              options: dropDownTypeOfServiceBillpaymentsServicesRecordList
                                                                  .map((e) => e
                                                                      .serviceName)
                                                                  .toList(),
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.dropDownTypeOfServiceValue =
                                                                          val),
                                                              width: double
                                                                  .infinity,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '35aewoc0' /* Please select... */,
                                                              ),
                                                              icon: Icon(
                                                                FFIcons
                                                                    .karrowDown1,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 0.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                              borderWidth: 1.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 15.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1marf09n' /* Provider */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .inputTextFieldProviderNameModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          InputTextFieldWidget(
                                                        labelPara:
                                                            'Provider Name',
                                                        hintPara:
                                                            'MTN, GLO, DSTV and more',
                                                        valuePara:
                                                            wrapBillpaymentProvidersRecord
                                                                .providerName,
                                                        readOnlyStatusPara:
                                                            false,
                                                        actionPara: () async {},
                                                      ),
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
                                                                  .inputTextFieldProviderCommissionModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  InputTextFieldWidget(
                                                                labelPara:
                                                                    'Provider Commission',
                                                                hintPara:
                                                                    '0.01',
                                                                valuePara: wrapBillpaymentProvidersRecord
                                                                    .providerDefaultCommission
                                                                    .toString(),
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
                                                                  .rightSidedAmountTextFieldTransferFeeModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  RightSidedAmountTextFieldWidget(
                                                                labelPara:
                                                                    'Provider Fee',
                                                                hintPara: '100',
                                                                valuePara: wrapBillpaymentProvidersRecord
                                                                    .providerTransferFee
                                                                    .toString(),
                                                                sidedText: _model
                                                                    .dropDownCurrencyValue,
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .inputTextFieldBillerNameModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  InputTextFieldWidget(
                                                                labelPara:
                                                                    'Biller Name',
                                                                hintPara:
                                                                    '2.5 Gb Data',
                                                                valuePara:
                                                                    wrapBillpaymentProvidersRecord
                                                                        .providerBillerName,
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
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .inputTextFieldBillerCodeModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  InputTextFieldWidget(
                                                                labelPara:
                                                                    'Biller Code',
                                                                hintPara:
                                                                    '1903',
                                                                valuePara:
                                                                    wrapBillpaymentProvidersRecord
                                                                        .providerBillerCode,
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
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .inputTextFieldItemCodeModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  InputTextFieldWidget(
                                                                labelPara:
                                                                    'Item Code',
                                                                hintPara: '123',
                                                                valuePara:
                                                                    wrapBillpaymentProvidersRecord
                                                                        .providerItemCode,
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .inputTextFieldProviderShortNameModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          InputTextFieldWidget(
                                                        labelPara:
                                                            'Provider Short Name',
                                                        hintPara: '2.5 Gb Data',
                                                        valuePara:
                                                            wrapBillpaymentProvidersRecord
                                                                .providerShortName,
                                                        readOnlyStatusPara:
                                                            false,
                                                        actionPara: () async {},
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 15.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fean7odp' /* Provider Cash Back */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'qpqa0p3d' /* Enable or Disable Cash Back */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Switch.adaptive(
                                                          value: _model
                                                                  .switchCashBackValue ??=
                                                              wrapBillpaymentProvidersRecord
                                                                  .cashbackStatus,
                                                          onChanged:
                                                              (newValue) async {
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
                                                                'ad5fz3b6' /* Cash Bank (Min-0.1=10%) / (Max... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            Container(
                                                              width: 360.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .textController ??=
                                                                      TextEditingController(
                                                                    text: wrapBillpaymentProvidersRecord
                                                                        .cashbackPercent
                                                                        .toString(),
                                                                  ),
                                                                  focusNode: _model
                                                                      .textFieldFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.textController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            0),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'xt7e0mls' /* 0.1 */,
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
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  keyboardType: const TextInputType
                                                                      .numberWithOptions(
                                                                      decimal:
                                                                          true),
                                                                  validator: _model
                                                                      .textControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 15.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 15.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
