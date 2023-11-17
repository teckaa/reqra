import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_provider_model.dart';
export 'create_provider_model.dart';

class CreateProviderWidget extends StatefulWidget {
  const CreateProviderWidget({
    Key? key,
    this.serviceTypePara,
  }) : super(key: key);

  final String? serviceTypePara;

  @override
  _CreateProviderWidgetState createState() => _CreateProviderWidgetState();
}

class _CreateProviderWidgetState extends State<CreateProviderWidget>
    with TickerProviderStateMixin {
  late CreateProviderModel _model;

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
    _model = createModel(context, () => CreateProviderModel());

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
                headerTitlePara: 'Create Provider',
                headerActionPara: () async {
                  logFirebaseEvent('CREATE_PROVIDER_Container_80qufjrs_CALLB');
                  logFirebaseEvent('ModalHeader_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Wrap(
                      spacing: 50.0,
                      runSpacing: 50.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 150.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '7wnzie73' /* Provider Logo */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'm4ropw1g' /* Upload square image and should... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          fontSize: 11.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CREATE_PROVIDER_Container_xhyv602a_ON_TA');
                                    logFirebaseEvent('PhotoGrid_alert_dialog');
                                    await showAlignedDialog(
                                      barrierColor:
                                          FlutterFlowTheme.of(context).overlay,
                                      barrierDismissible: false,
                                      context: context,
                                      isGlobal: true,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: WebViewAware(
                                              child: Container(
                                            height: 800.0,
                                            width: 800.0,
                                            child: ListOfMediaCompWidget(),
                                          )),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.getImageData = value));

                                    setState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.photoGridModel,
                                    updateCallback: () => setState(() {}),
                                    child: PhotoGridWidget(
                                      photoWidth: 150,
                                      photoHeight: 150,
                                      photoPath: _model.getImageData,
                                      photoName: 'Provider Image',
                                      bgColor: FlutterFlowTheme.of(context)
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
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 150.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'uxszpwj0' /* Country */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                            ),
                                            FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownCountryValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownCountryValue ??=
                                                    'NG',
                                              ),
                                              options:
                                                  List<String>.from(['NG']),
                                              optionLabels: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  't1giq3wf' /* Nigeria */,
                                                )
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.dropDownCountryValue =
                                                      val),
                                              width: double.infinity,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '4ex4matb' /* Please select... */,
                                              ),
                                              icon: Icon(
                                                FFIcons.karrowDown1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 0.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              borderWidth: 1.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 150.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vmc6wl22' /* Currency */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownCurrencyValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownCurrencyValue ??=
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'bwlgldpi' /* NGN */,
                                                ),
                                              ),
                                              options: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'fak4gk89' /* NGN */,
                                                )
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.dropDownCurrencyValue =
                                                      val),
                                              width: double.infinity,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'c5w46uwe' /* Please select... */,
                                              ),
                                              icon: Icon(
                                                FFIcons.karrowDown1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 0.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              borderWidth: 1.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7a9dv187' /* Service */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    StreamBuilder<
                                        List<BillpaymentsServicesRecord>>(
                                      stream: queryBillpaymentsServicesRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        }
                                        List<BillpaymentsServicesRecord>
                                            dropDownTypeOfServiceBillpaymentsServicesRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownTypeOfServiceValueController ??=
                                              FormFieldController<String>(
                                            _model.dropDownTypeOfServiceValue ??=
                                                valueOrDefault<String>(
                                              widget.serviceTypePara,
                                              'Airtime',
                                            ),
                                          ),
                                          options:
                                              dropDownTypeOfServiceBillpaymentsServicesRecordList
                                                  .map((e) => e.serviceName)
                                                  .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownTypeOfServiceValue =
                                                  val),
                                          width: double.infinity,
                                          height: 40.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'i13d3tmm' /* Please select... */,
                                          ),
                                          icon: Icon(
                                            FFIcons.karrowDown1,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 0.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineColor,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: SwitchListTile.adaptive(
                                    value: _model.switchListTileValue ??= true,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue = newValue!);
                                    },
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'mfbhgkfb' /* Enable or disable this service */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.inputTextFieldProviderNameModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: InputTextFieldWidget(
                                    labelPara: 'Provider Name',
                                    hintPara: 'MTN, GLO, DSTV and more',
                                    readOnlyStatusPara: false,
                                    actionPara: () async {},
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 150.0,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model
                                              .inputTextFieldProviderCommissionModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: InputTextFieldWidget(
                                            labelPara: 'Provider Commission',
                                            hintPara: '0.01',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 150.0,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model
                                              .rightSidedAmountTextFieldModel,
                                          updateCallback: () => setState(() {}),
                                          child:
                                              RightSidedAmountTextFieldWidget(
                                            labelPara: 'Provider Fee',
                                            hintPara: '100',
                                            sidedText: valueOrDefault<String>(
                                              _model.dropDownCurrencyValue,
                                              'NGN',
                                            ),
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model
                                              .inputTextFieldBillerNameModel,
                                          updateCallback: () => setState(() {}),
                                          child: InputTextFieldWidget(
                                            labelPara: 'Biller Name',
                                            hintPara: '2.5 Gb Data',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model
                                              .inputTextFieldBillerCodeModel,
                                          updateCallback: () => setState(() {}),
                                          child: InputTextFieldWidget(
                                            labelPara: 'Biller Code',
                                            hintPara: '1903',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model
                                              .inputTextFieldItemCodeModel,
                                          updateCallback: () => setState(() {}),
                                          child: InputTextFieldWidget(
                                            labelPara: 'Item Code',
                                            hintPara: '123',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                                wrapWithModel(
                                  model: _model
                                      .inputTextFieldProviderShortNameModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: InputTextFieldWidget(
                                    labelPara: 'Provider Short Name',
                                    hintPara: '2.5 Gb Data',
                                    readOnlyStatusPara: false,
                                    actionPara: () async {},
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: wrapWithModel(
                                      model: _model.primaryButtonLoadingModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: PrimaryButtonLoadingWidget(
                                        buttonText: 'Create',
                                        buttonBgColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        buttonTextColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        buttonWidth: 400,
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
                                            FlutterFlowTheme.of(context)
                                                .disableColor,
                                        buttonAction: () async {
                                          logFirebaseEvent(
                                              'CREATE_PROVIDER_Container_7117ze15_CALLB');
                                          logFirebaseEvent(
                                              'PrimaryButtonLoading_backend_call');

                                          await BillpaymentProvidersRecord
                                              .collection
                                              .doc()
                                              .set(
                                                  createBillpaymentProvidersRecordData(
                                                createdAt: getCurrentTimestamp,
                                                uuid: '1',
                                                providerName: _model
                                                    .inputTextFieldProviderNameModel
                                                    .textController
                                                    .text,
                                                providerServiceType: _model
                                                    .dropDownTypeOfServiceValue,
                                                providerStatus:
                                                    _model.switchListTileValue,
                                                providerLogo:
                                                    _model.getImageData,
                                                providerDefaultCommission:
                                                    double.tryParse(_model
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
                                                providerTransferFee:
                                                    int.tryParse(_model
                                                        .rightSidedAmountTextFieldModel
                                                        .textController
                                                        .text),
                                                providerCountry:
                                                    _model.dropDownCountryValue,
                                                providerCurrency: _model
                                                    .dropDownCurrencyValue,
                                              ));
                                          logFirebaseEvent(
                                              'PrimaryButtonLoading_bottom_sheet');
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 15.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
