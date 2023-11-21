import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/url_text_field/url_text_field_widget.dart';
import '/application/components/icons/icon/icon_widget.dart';
import '/application/components/layouts/icon_grid_with_details/icon_grid_with_details_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_ads_model.dart';
export 'create_ads_model.dart';

class CreateAdsWidget extends StatefulWidget {
  const CreateAdsWidget({Key? key}) : super(key: key);

  @override
  _CreateAdsWidgetState createState() => _CreateAdsWidgetState();
}

class _CreateAdsWidgetState extends State<CreateAdsWidget>
    with TickerProviderStateMixin {
  late CreateAdsModel _model;

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
    _model = createModel(context, () => CreateAdsModel());

    _model.textFieldAdsTextController ??= TextEditingController();
    _model.textFieldAdsTextFocusNode ??= FocusNode();

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
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Container(
          width: 600.0,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Create Ads',
                  headerActionPara: () async {
                    logFirebaseEvent('CREATE_ADS_Container_coj1awww_CALLBACK');
                    logFirebaseEvent('ModalHeader_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '5428zu4c' /* Ads */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelLargeFamily,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelLargeFamily),
                          ),
                    ),
                    wrapWithModel(
                      model: _model.primaryButtonLoadingCreateTextAdsModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: PrimaryButtonLoadingWidget(
                        buttonText: 'Save',
                        buttonBgColor: FlutterFlowTheme.of(context).primary,
                        buttonTextColor: FlutterFlowTheme.of(context).white,
                        buttonWidth: 100,
                        buttonHeight: 35,
                        disableStatusPara: (_model.inputTextFieldAdsNameModel
                                        .textController.text ==
                                    null ||
                                _model.inputTextFieldAdsNameModel.textController
                                        .text ==
                                    '') ||
                            (_model.listInAds.length < 1) ||
                            (_model.typeOfAds == null ||
                                _model.typeOfAds == ''),
                        disableColorPara:
                            FlutterFlowTheme.of(context).disableColor,
                        buttonAction: () async {
                          logFirebaseEvent(
                              'CREATE_ADS_PrimaryButtonLoading-CreateTe');
                          logFirebaseEvent(
                              'PrimaryButtonLoading-CreateTextAds_backe');

                          await DwAppAdsRecord.collection.doc().set({
                            ...createDwAppAdsRecordData(
                              createdAt: getCurrentTimestamp,
                              userRef: currentUserReference,
                              adsName: _model.inputTextFieldAdsNameModel
                                  .textController.text,
                              adsStatus: _model.switchAdsStatusValue,
                              adsType: _model.typeOfAds,
                              adsAutoplayStatus: _model.checkboxAutoplayValue,
                              adsAnimationDelay: int.tryParse(_model
                                  .inputTextFieldDelayModel
                                  .textController
                                  .text),
                              adsIsClosable: _model.checkboxClosableValue,
                              adsPosition: _model.radioButtonPositionValue,
                            ),
                            ...mapToFirestore(
                              {
                                'ads_banner': getAdsFieldsListFirestoreData(
                                  _model.listInAds,
                                ),
                                'ads_page': _model.checkboxGroupPagesValues,
                                'ads_responsive':
                                    _model.choiceChipsResponsiveValues,
                              },
                            ),
                          });
                          logFirebaseEvent(
                              'PrimaryButtonLoading-CreateTextAds_close');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.inputTextFieldAdsNameModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: InputTextFieldWidget(
                                labelPara: 'Ads Name',
                                hintPara: 'Promo Ads',
                                readOnlyStatusPara: false,
                                actionPara: () async {},
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'qkpf93u9' /* Enable and Disable Ads */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Switch.adaptive(
                                  value: _model.switchAdsStatusValue ??= true,
                                  onChanged: (newValue) async {
                                    setState(() => _model.switchAdsStatusValue =
                                        newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ],
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '5dkm2ldm' /* You have the flexibility to ad... */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                        Builder(
                          builder: (context) {
                            if (_model.typeOfAds == 'TextBase') {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_model.textFieldAdsTextController.text !=
                                          null &&
                                      _model.textFieldAdsTextController.text !=
                                          '')
                                    wrapWithModel(
                                      model: _model
                                          .primaryButtonAddMoreTextBaseModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: PrimaryButtonWidget(
                                        buttonText: 'Add More',
                                        buttonWidth: 120,
                                        disableStatusPara: false,
                                        buttonAction: () async {
                                          logFirebaseEvent(
                                              'CREATE_ADS_PrimaryButton-AddMoreTextBase');
                                          logFirebaseEvent(
                                              'PrimaryButton-AddMoreTextBase_update_com');
                                          setState(() {
                                            _model
                                                .addToListInAds(AdsFieldsStruct(
                                              adsText: _model
                                                  .textFieldAdsTextController
                                                  .text,
                                              adsTextColor: _model.colorPicked1,
                                              adsBgColor: _model.colorPicked2,
                                              adsTextSize: _model
                                                  .countControllerTextSizeValue,
                                            ));
                                          });
                                          logFirebaseEvent(
                                              'PrimaryButton-AddMoreTextBase_clear_text');
                                          setState(() {
                                            _model.textFieldAdsTextController
                                                ?.clear();
                                          });
                                        },
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'a5npogl3' /* Text Base Ads */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      wrapWithModel(
                                        model: _model.iconModel1,
                                        updateCallback: () => setState(() {}),
                                        child: IconWidget(
                                          iconPara: Icon(
                                            FFIcons.kundo,
                                          ),
                                          iconTooltipPara: 'Back to Option',
                                          iconActionPara: () async {
                                            logFirebaseEvent(
                                                'CREATE_ADS_Container_iqmaw1sf_CALLBACK');
                                            logFirebaseEvent(
                                                'Icon_clear_text_fields_pin_codes');
                                            setState(() {
                                              _model
                                                  .urlTextFieldExternalLinkModel
                                                  .textController
                                                  ?.clear();
                                              _model.textFieldAdsTextController
                                                  ?.clear();
                                            });
                                            logFirebaseEvent(
                                                'Icon_update_component_state');
                                            setState(() {
                                              _model.listInAds = [];
                                              _model.typeOfAds = '';
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '8izqzzht' /* Text Properties */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              AlignedTooltip(
                                                content: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xcc19tvb' /* Text color */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    )),
                                                offset: 4.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                tailBaseWidth: 24.0,
                                                tailLength: 12.0,
                                                waitDuration:
                                                    Duration(milliseconds: 100),
                                                showDuration: Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CREATE_ADS_Container-TextColor_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Container-TextColor_color_picker');
                                                    final _colorPicked1Color =
                                                        await showFFColorPicker(
                                                      context,
                                                      currentColor: _model
                                                              .colorPicked1 ??=
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      showRecentColors: true,
                                                      allowOpacity: true,
                                                      textColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      secondaryTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      primaryButtonBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      primaryButtonTextColor:
                                                          Colors.white,
                                                      primaryButtonBorderColor:
                                                          Colors.transparent,
                                                      displayAsBottomSheet:
                                                          isMobileWidth(
                                                              context),
                                                    );

                                                    if (_colorPicked1Color !=
                                                        null) {
                                                      safeSetState(() => _model
                                                              .colorPicked1 =
                                                          _colorPicked1Color);
                                                    }
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 4.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: 37.0,
                                                      height: 37.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.colorPicked1,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AlignedTooltip(
                                                content: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '36300njz' /* Text size */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    )),
                                                offset: 4.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                tailBaseWidth: 24.0,
                                                tailLength: 12.0,
                                                waitDuration:
                                                    Duration(milliseconds: 100),
                                                showDuration: Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child:
                                                      FlutterFlowCountController(
                                                    decrementIconBuilder:
                                                        (enabled) => FaIcon(
                                                      FontAwesomeIcons.minus,
                                                      color: enabled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 15.0,
                                                    ),
                                                    incrementIconBuilder:
                                                        (enabled) => FaIcon(
                                                      FontAwesomeIcons.plus,
                                                      color: enabled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 15.0,
                                                    ),
                                                    countBuilder: (count) =>
                                                        Text(
                                                      count.toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                    ),
                                                    count: _model
                                                        .countControllerTextSizeValue ??= 14,
                                                    updateCount: (count) =>
                                                        setState(() => _model
                                                                .countControllerTextSizeValue =
                                                            count),
                                                    stepSize: 1,
                                                    minimum: 10,
                                                    maximum: 100,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                10.0, 5.0),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'mynhav4o' /* Background Properties */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              AlignedTooltip(
                                                content: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '13dlad7t' /* Background color */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    )),
                                                offset: 4.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                tailBaseWidth: 24.0,
                                                tailLength: 12.0,
                                                waitDuration:
                                                    Duration(milliseconds: 100),
                                                showDuration: Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CREATE_ADS_COMP_Container-BgColor_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Container-BgColor_color_picker');
                                                    final _colorPicked2Color =
                                                        await showFFColorPicker(
                                                      context,
                                                      currentColor: _model
                                                              .colorPicked2 ??=
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      showRecentColors: true,
                                                      allowOpacity: true,
                                                      textColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      secondaryTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      primaryButtonBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      primaryButtonTextColor:
                                                          Colors.white,
                                                      primaryButtonBorderColor:
                                                          Colors.transparent,
                                                      displayAsBottomSheet:
                                                          isMobileWidth(
                                                              context),
                                                    );

                                                    if (_colorPicked2Color !=
                                                        null) {
                                                      safeSetState(() => _model
                                                              .colorPicked2 =
                                                          _colorPicked2Color);
                                                    }
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 4.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: 37.0,
                                                      height: 37.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.colorPicked2,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AlignedTooltip(
                                                content: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9zj4j8vh' /* Backgroud height size */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    )),
                                                offset: 4.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                tailBaseWidth: 24.0,
                                                tailLength: 12.0,
                                                waitDuration:
                                                    Duration(milliseconds: 100),
                                                showDuration: Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child:
                                                      FlutterFlowCountController(
                                                    decrementIconBuilder:
                                                        (enabled) => FaIcon(
                                                      FontAwesomeIcons.minus,
                                                      color: enabled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 15.0,
                                                    ),
                                                    incrementIconBuilder:
                                                        (enabled) => FaIcon(
                                                      FontAwesomeIcons.plus,
                                                      color: enabled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 15.0,
                                                    ),
                                                    countBuilder: (count) =>
                                                        Text(
                                                      count.toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                    ),
                                                    count: _model
                                                            .countControllerHeightSizeValue ??=
                                                        100,
                                                    updateCount: (count) =>
                                                        setState(() => _model
                                                                .countControllerHeightSizeValue =
                                                            count),
                                                    stepSize: 1,
                                                    minimum: 100,
                                                    maximum: 120,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                10.0, 5.0),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ].divide(SizedBox(width: 15.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '7g493stj' /* Ads/Banner Design */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: _model
                                            .countControllerHeightSizeValue
                                            ?.toDouble(),
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.colorPicked2,
                                            FlutterFlowTheme.of(context).black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 20.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .textFieldAdsTextController,
                                              focusNode: _model
                                                  .textFieldAdsTextFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'u3uyh5ag' /* Type your ads here */,
                                                ),
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.colorPicked1,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .white,
                                                      ),
                                                      fontSize: _model
                                                          .countControllerTextSizeValue
                                                          ?.toDouble(),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.colorPicked1,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                    ),
                                                    fontSize: _model
                                                        .countControllerTextSizeValue
                                                        ?.toDouble(),
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                              textAlign: TextAlign.center,
                                              validator: _model
                                                  .textFieldAdsTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              );
                            } else if (_model.typeOfAds == 'ImageBase') {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_model.getImagePath != null &&
                                      _model.getImagePath != '')
                                    wrapWithModel(
                                      model: _model
                                          .primaryButtonAddMoreImageBaseModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: PrimaryButtonWidget(
                                        buttonText: 'Add More',
                                        buttonWidth: 120,
                                        disableStatusPara: false,
                                        buttonAction: () async {
                                          logFirebaseEvent(
                                              'CREATE_ADS_PrimaryButton-AddMoreImageBas');
                                          logFirebaseEvent(
                                              'PrimaryButton-AddMoreImageBase_update_co');
                                          setState(() {
                                            _model
                                                .addToListInAds(AdsFieldsStruct(
                                              adsImage: _model.getImagePath,
                                            ));
                                          });
                                        },
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'f02xvwm0' /* Text Base Ads */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      wrapWithModel(
                                        model: _model.iconModel2,
                                        updateCallback: () => setState(() {}),
                                        child: IconWidget(
                                          iconPara: Icon(
                                            FFIcons.kundo,
                                          ),
                                          iconTooltipPara: 'Back to Option',
                                          iconActionPara: () async {
                                            logFirebaseEvent(
                                                'CREATE_ADS_Container_xmvsejea_CALLBACK');
                                            logFirebaseEvent(
                                                'Icon_clear_text_fields_pin_codes');
                                            setState(() {
                                              _model
                                                  .urlTextFieldExternalLinkModel
                                                  .textController
                                                  ?.clear();
                                              _model.textFieldAdsTextController
                                                  ?.clear();
                                            });
                                            logFirebaseEvent(
                                                'Icon_update_component_state');
                                            setState(() {
                                              _model.listInAds = [];
                                              _model.typeOfAds = '';
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CREATE_ADS_Container_xjwhhrnq_ON_TAP');
                                              logFirebaseEvent(
                                                  'PhotoGridCover_alert_dialog');
                                              await showAlignedDialog(
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
                                                        .overlay,
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
                                                      height: 600.0,
                                                      width: 800.0,
                                                      child:
                                                          ListOfMediaCompWidget(),
                                                    )),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () => _model.getImagePath =
                                                      value));

                                              setState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.photoGridCoverModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: PhotoGridCoverWidget(
                                                photoWidth: 500,
                                                photoHeight: 100,
                                                photoPath: _model.getImagePath,
                                                photoName: 'Upload image here',
                                                bgColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '22fcev9r' /* Type of Ads */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CREATE_ADS_Container_9roj8ci7_ON_TAP');
                                          logFirebaseEvent(
                                              'IconGridWithDetails_update_component_sta');
                                          setState(() {
                                            _model.typeOfAds = 'TextBase';
                                          });
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.iconGridWithDetailsModel1,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: IconGridWithDetailsWidget(
                                            iconPara: Icon(
                                              FFIcons.ktext,
                                            ),
                                            titlePara: 'Text Base Banner',
                                            descPara:
                                                'Craft concise and impactful text ads for your app.',
                                            iconBgColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CREATE_ADS_Container_zwjq0nht_ON_TAP');
                                          logFirebaseEvent(
                                              'IconGridWithDetails_update_component_sta');
                                          setState(() {
                                            _model.typeOfAds = 'ImageBase';
                                          });
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.iconGridWithDetailsModel2,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: IconGridWithDetailsWidget(
                                            iconPara: Icon(
                                              FFIcons.kimage,
                                            ),
                                            titlePara: 'Image Base Banner',
                                            descPara:
                                                'Create eye-catching image ads to captivate your audience.',
                                            iconBgColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 20.0))
                                        .around(SizedBox(height: 20.0)),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              );
                            }
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.listInAds.length > 0)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ny7u15fd' /* Preview */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Builder(
                                        builder: (context) {
                                          final listOfDesign =
                                              _model.listInAds.toList();
                                          return Container(
                                            width: double.infinity,
                                            height: 140.0,
                                            child: CarouselSlider.builder(
                                              itemCount: listOfDesign.length,
                                              itemBuilder: (context,
                                                  listOfDesignIndex, _) {
                                                final listOfDesignItem =
                                                    listOfDesign[
                                                        listOfDesignIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '1 / ${(listOfDesignIndex + 1).toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          IconWidget(
                                                            key: Key(
                                                                'Key55j_${listOfDesignIndex}_of_${listOfDesign.length}'),
                                                            iconPara: Icon(
                                                              FFIcons.ktrash,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                            ),
                                                            iconActionPara:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CREATE_ADS_Container_55j2060f_CALLBACK');
                                                              logFirebaseEvent(
                                                                  'Icon_update_component_state');
                                                              setState(() {
                                                                _model.removeFromListInAds(
                                                                    listOfDesignItem);
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (_model.typeOfAds ==
                                                        'ImageBase')
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          getCORSProxyUrl(
                                                            listOfDesignItem
                                                                .adsImage,
                                                          ),
                                                          width:
                                                              double.infinity,
                                                          height: 100.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    if (_model.typeOfAds ==
                                                        'TextBase')
                                                      Container(
                                                        width: double.infinity,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            listOfDesignItem
                                                                .adsBgColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
                                                            listOfDesignItem
                                                                .adsText,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    listOfDesignItem
                                                                        .adsTextColor,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .white,
                                                                  ),
                                                                  fontSize: listOfDesignItem
                                                                      .adsTextSize
                                                                      .toDouble(),
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
                                                        ),
                                                      ),
                                                  ],
                                                );
                                              },
                                              carouselController:
                                                  _model.carouselController ??=
                                                      CarouselController(),
                                              options: CarouselOptions(
                                                initialPage: min(
                                                    1, listOfDesign.length - 1),
                                                viewportFraction: 1.0,
                                                disableCenter: false,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: valueOrDefault<bool>(
                                                  _model.checkboxAutoplayValue,
                                                  false,
                                                ),
                                                autoPlayAnimationDuration:
                                                    Duration(milliseconds: 800),
                                                autoPlayInterval: Duration(
                                                    milliseconds: (800 +
                                                        valueOrDefault<int>(
                                                          int.tryParse(_model
                                                              .inputTextFieldDelayModel
                                                              .textController
                                                              .text),
                                                          4000,
                                                        ))),
                                                autoPlayCurve: Curves.linear,
                                                pauseAutoPlayInFiniteScroll:
                                                    true,
                                                onPageChanged: (index, _) =>
                                                    _model.carouselCurrentIndex =
                                                        index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  '3moij59y' /* Enable auto play */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxAutoplayValue ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkboxAutoplayValue =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '0ba1hcp6' /* Enable auto play */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          if (_model.checkboxAutoplayValue ==
                                              true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 150.0,
                                                  decoration: BoxDecoration(),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .inputTextFieldDelayModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: InputTextFieldWidget(
                                                      labelPara:
                                                          'Delay(1000=1sec)',
                                                      hintPara: '4000',
                                                      valuePara: '4000',
                                                      readOnlyStatusPara: false,
                                                      actionPara: () async {},
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  'hesuqv82' /* Closing of Ads */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxClosableValue ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .checkboxClosableValue =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'b5vgfwpt' /* Enable closure */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          if (_model.checkboxClosableValue ==
                                              true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 150.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                        ],
                                      ),
                                    ]
                                        .divide(SizedBox(height: 10.0))
                                        .around(SizedBox(height: 10.0)),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            if ((_model.textFieldAdsTextController.text !=
                                        null &&
                                    _model.textFieldAdsTextController.text !=
                                        '') ||
                                (_model.getImagePath != null &&
                                    _model.getImagePath != ''))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'tlc69v3t' /* Where to redirect to? */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller: _model
                                            .dropDownLocationValueController ??=
                                        FormFieldController<String>(null),
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        'pbtni14k' /* External Link/Page */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'c46kv8ze' /* Internal Page */,
                                      )
                                    ],
                                    onChanged: (val) => setState(() =>
                                        _model.dropDownLocationValue = val),
                                    width: double.infinity,
                                    height: 40.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'zj4p1o6b' /* Please select... */,
                                    ),
                                    icon: Icon(
                                      FFIcons.karrowDown1,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 1.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            if (_model.dropDownLocationValue == 'Internal Page')
                              wrapWithModel(
                                model: _model.inputTextFieldInternalModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: InputTextFieldWidget(
                                  labelPara: 'Internal Page',
                                  readOnlyStatusPara: false,
                                  actionPara: () async {},
                                ),
                              ),
                            if (_model.dropDownLocationValue ==
                                'External Link/Page')
                              wrapWithModel(
                                model: _model.urlTextFieldExternalLinkModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: UrlTextFieldWidget(
                                  labelPara: 'External Link/Page',
                                  hintPara: 'https://example.com',
                                  readOnlyStatusPara: false,
                                  actionPara: () async {},
                                ),
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'gpsdwyvp' /* Position */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'tnvdmsuz' /* Where would you prefer to plac... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'g6ac5kgv' /* Choose the optimal placement f... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                    FlutterFlowRadioButton(
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'fukg133x' /* Top */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '2ziqwil0' /* Bottom */,
                                        )
                                      ].toList(),
                                      onChanged: (val) => setState(() {}),
                                      controller: _model
                                              .radioButtonPositionValueController ??=
                                          FormFieldController<String>(
                                              FFLocalizations.of(context)
                                                  .getText(
                                        'r37vcjx4' /* Bottom */,
                                      )),
                                      optionHeight: 32.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      selectedTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                      buttonPosition: RadioButtonPosition.left,
                                      direction: Axis.vertical,
                                      radioButtonColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveRadioButtonColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      toggleable: false,
                                      horizontalAlignment: WrapAlignment.start,
                                      verticalAlignment:
                                          WrapCrossAlignment.start,
                                    ),
                                  ].divide(SizedBox(height: 15.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'a95pkh6u' /* On which product pages would y... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '4az87jge' /* Rest assured that your created... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                    StreamBuilder<
                                        List<BillpaymentsServicesRecord>>(
                                      stream: queryBillpaymentsServicesRecord(
                                        queryBuilder:
                                            (billpaymentsServicesRecord) =>
                                                billpaymentsServicesRecord
                                                    .orderBy('uuid'),
                                      ),
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
                                            checkboxGroupPagesBillpaymentsServicesRecordList =
                                            snapshot.data!;
                                        return FlutterFlowCheckboxGroup(
                                          options:
                                              checkboxGroupPagesBillpaymentsServicesRecordList
                                                  .map((e) => e.serviceName)
                                                  .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.checkboxGroupPagesValues =
                                                  val),
                                          controller: _model
                                                  .checkboxGroupPagesValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          checkboxBorderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          checkboxBorderRadius:
                                              BorderRadius.circular(4.0),
                                          initialized:
                                              _model.checkboxGroupPagesValues !=
                                                  null,
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 15.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'w6a5l3c5' /* Responsive */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ty28ap0l' /* Click the Mobile, Desktop, or ... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                        FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'e4pagw61' /* Mobile */,
                                                ),
                                                FFIcons.kmobile),
                                            ChipData(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '28omgxai' /* Desktop */,
                                                ),
                                                FFIcons.kmonitor),
                                            ChipData(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '8h3ca7us' /* Web */,
                                                ),
                                                FFIcons.kglobal)
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.choiceChipsResponsiveValues =
                                                  val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily),
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            textStyle:
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
                                                              .black,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .black,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          chipSpacing: 12.0,
                                          rowSpacing: 12.0,
                                          multiselect: true,
                                          initialized: _model
                                                  .choiceChipsResponsiveValues !=
                                              null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .choiceChipsResponsiveValueController ??=
                                              FormFieldController<List<String>>(
                                            [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nu0oizmr' /* Mobile */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'k5clvbln' /* Desktop */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dmqgz5ke' /* Web */,
                                              )
                                            ],
                                          ),
                                          wrapped: true,
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ].divide(SizedBox(height: 15.0)),
                                ),
                              ].divide(SizedBox(height: 25.0)),
                            ),
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ].divide(SizedBox(height: 25.0)),
                    ),
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
