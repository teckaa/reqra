import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/color_text_field/color_text_field_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_email_templates_model.dart';
export 'create_email_templates_model.dart';

class CreateEmailTemplatesWidget extends StatefulWidget {
  const CreateEmailTemplatesWidget({
    Key? key,
    this.recordRef,
    this.editMode,
    this.editModeLayout,
  }) : super(key: key);

  final DocumentReference? recordRef;
  final String? editMode;
  final String? editModeLayout;

  @override
  _CreateEmailTemplatesWidgetState createState() =>
      _CreateEmailTemplatesWidgetState();
}

class _CreateEmailTemplatesWidgetState extends State<CreateEmailTemplatesWidget>
    with TickerProviderStateMixin {
  late CreateEmailTemplatesModel _model;

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
    _model = createModel(context, () => CreateEmailTemplatesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_EMAIL_TEMPLATES_CreateEmailTempla');
      logFirebaseEvent('CreateEmailTemplates_update_component_st');
      setState(() {
        _model.layoutType = widget.editModeLayout;
      });
    });

    _model.textFieldContentFocusNode ??= FocusNode();

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
        child: StreamBuilder<List<DwAppRecord>>(
          stream: queryDwAppRecord(
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return ShimmerCardWidget(
                heightPara: 620,
              );
            }
            List<DwAppRecord> containerDwAppRecordList = snapshot.data!;
            final containerDwAppRecord = containerDwAppRecordList.isNotEmpty
                ? containerDwAppRecordList.first
                : null;
            return Container(
              width: 1200.0,
              height: MediaQuery.sizeOf(context).height * 0.95,
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
              child: StreamBuilder<List<DwEmailTemplatesRecord>>(
                stream: queryDwEmailTemplatesRecord(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: ShimmerCardWidget(
                        heightPara: 620,
                      ),
                    );
                  }
                  List<DwEmailTemplatesRecord>
                      columnDwEmailTemplatesRecordList = snapshot.data!;
                  final columnDwEmailTemplatesRecord =
                      columnDwEmailTemplatesRecordList.isNotEmpty
                          ? columnDwEmailTemplatesRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StreamBuilder<DwEmailCustomTemplatesRecord>(
                          stream: DwEmailCustomTemplatesRecord.getDocument(
                              widget.recordRef!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 25.0, 25.0, 25.0),
                                child: ShimmerCardWidget(
                                  heightPara: 620,
                                ),
                              );
                            }
                            final columnDwEmailCustomTemplatesRecord =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.modalHeaderModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: ModalHeaderWidget(
                                    headerTitlePara:
                                        '${widget.editMode} template',
                                    headerTitleTextColorPara:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    headerActionPara: () async {
                                      logFirebaseEvent(
                                          'CREATE_EMAIL_TEMPLATES_Container_aq3btb2');
                                      logFirebaseEvent(
                                          'ModalHeader_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                              child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ModalConfirmWidget(
                                              modalTitle: 'Warning:',
                                              modalDesc:
                                                  'Any unsaved changes will be lost if you close this modal box without saving. Are you sure you want to proceed?',
                                              modalAction: () async {
                                                logFirebaseEvent(
                                                    '_bottom_sheet');
                                                Navigator.pop(context);
                                                logFirebaseEvent(
                                                    '_close_dialog,_drawer,_etc');
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ));
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (_model.layoutType == 'Design') {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        Container(
                                                          width: 198.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                              child:
                                                                  FlutterFlowChoiceChips(
                                                                options: [
                                                                  ChipData(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '5r7hvsh9' /* Desktop */,
                                                                      ),
                                                                      FFIcons
                                                                          .kmonitor),
                                                                  ChipData(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '05np48si' /* Mobile */,
                                                                      ),
                                                                      FFIcons
                                                                          .kmobile)
                                                                ],
                                                                onChanged: (val) =>
                                                                    setState(() =>
                                                                        _model.choiceChipsValue =
                                                                            val?.first),
                                                                selectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        fontSize:
                                                                            11.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                  iconColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  iconSize:
                                                                      14.0,
                                                                  elevation:
                                                                      4.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                unselectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        fontSize:
                                                                            11.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                  iconColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  iconSize:
                                                                      14.0,
                                                                  elevation:
                                                                      0.0,
                                                                ),
                                                                chipSpacing:
                                                                    5.0,
                                                                rowSpacing: 5.0,
                                                                multiselect:
                                                                    false,
                                                                initialized:
                                                                    _model.choiceChipsValue !=
                                                                        null,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                controller: _model
                                                                        .choiceChipsValueController ??=
                                                                    FormFieldController<
                                                                        List<
                                                                            String>>(
                                                                  [
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'apr4bax2' /* Desktop */,
                                                                    )
                                                                  ],
                                                                ),
                                                                wrapped: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (widget.editMode ==
                                                            'Manage')
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderRadius:
                                                                    40.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    48.0,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                icon: Icon(
                                                                  FFIcons
                                                                      .kbackSquare,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 16.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CREATE_EMAIL_TEMPLATES_backSquare_ICN_ON');
                                                                  logFirebaseEvent(
                                                                      'IconButton_update_component_state');
                                                                  setState(() {
                                                                    _model.layoutType =
                                                                        '';
                                                                  });
                                                                },
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .primaryRoundedButtonLoadingModel1,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    PrimaryRoundedButtonLoadingWidget(
                                                                  buttonText:
                                                                      'Save',
                                                                  buttonBgColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  buttonTextColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  buttonWidth:
                                                                      80,
                                                                  buttonHeight:
                                                                      40,
                                                                  disableStatusPara:
                                                                      false,
                                                                  buttonAction:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'CREATE_EMAIL_TEMPLATES_Container_wgi2na7');
                                                                    logFirebaseEvent(
                                                                        'PrimaryRoundedButtonLoading_backend_call');

                                                                    await columnDwEmailCustomTemplatesRecord
                                                                        .reference
                                                                        .update(
                                                                            createDwEmailCustomTemplatesRecordData(
                                                                      subject: _model
                                                                          .inputTextFieldSubjectLineModel
                                                                          .textController
                                                                          .text,
                                                                      heading: _model
                                                                          .inputTextFieldPreviewTextModel
                                                                          .textController
                                                                          .text,
                                                                      type: _model
                                                                          .dropDownTypeValue,
                                                                      recipient:
                                                                          _model
                                                                              .dropDownRecipientsValue,
                                                                      content: _model
                                                                          .textFieldContentController
                                                                          .text,
                                                                    ));
                                                                    logFirebaseEvent(
                                                                        'PrimaryRoundedButtonLoading_action_block');
                                                                    await action_blocks
                                                                        .alertSuccess(
                                                                      context,
                                                                      descPara:
                                                                          'Email tem',
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'PrimaryRoundedButtonLoading_bottom_sheet');
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                              ))
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .primaryRoundedButtonLoadingModel2,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      PrimaryRoundedButtonLoadingWidget(
                                                                    buttonText:
                                                                        'Create',
                                                                    buttonBgColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    buttonTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    buttonWidth:
                                                                        80,
                                                                    buttonHeight:
                                                                        40,
                                                                    disableStatusPara:
                                                                        false,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_EMAIL_TEMPLATES_Container_r2urzo1');
                                                                      logFirebaseEvent(
                                                                          'PrimaryRoundedButtonLoading_backend_call');

                                                                      await DwEmailCustomTemplatesRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createDwEmailCustomTemplatesRecordData(
                                                                            createdAt:
                                                                                getCurrentTimestamp,
                                                                            name:
                                                                                _model.inputTextFieldTemplateNameModel.textController.text,
                                                                            status:
                                                                                true,
                                                                            subject:
                                                                                _model.inputTextFieldSubjectLineModel.textController.text,
                                                                            heading:
                                                                                _model.inputTextFieldPreviewTextModel.textController.text,
                                                                            content:
                                                                                _model.textFieldContentController.text,
                                                                            type:
                                                                                _model.dropDownTypeValue,
                                                                            recipient:
                                                                                _model.dropDownRecipientsValue,
                                                                          ));
                                                                      logFirebaseEvent(
                                                                          'PrimaryRoundedButtonLoading_bottom_sheet');
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: valueOrDefault<
                                                                          double>(
                                                                        () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return 450.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return 350.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return 350.0;
                                                                          } else {
                                                                            return 350.0;
                                                                          }
                                                                        }(),
                                                                        350.0,
                                                                      ),
                                                                      height:
                                                                          600.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Form(
                                                                        key: _model
                                                                            .formKey2,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.disabled,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '8ibzbir6' /* Email Templates Settings */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                      ),
                                                                                ),
                                                                                wrapWithModel(
                                                                                  model: _model.primaryRoundedButtonLoadingModel3,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: PrimaryRoundedButtonLoadingWidget(
                                                                                    buttonText: 'Save',
                                                                                    buttonBgColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    buttonTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    buttonWidth: 70,
                                                                                    buttonHeight: 35,
                                                                                    disableStatusPara: (_model.inputTextFieldFromNameModel.textController.text == null || _model.inputTextFieldFromNameModel.textController.text == '') || (_model.inputTextFieldFromEmailModel.textController.text == null || _model.inputTextFieldFromEmailModel.textController.text == ''),
                                                                                    disableColorPara: FlutterFlowTheme.of(context).disableColor,
                                                                                    buttonAction: () async {
                                                                                      logFirebaseEvent('CREATE_EMAIL_TEMPLATES_Container_oaixg74');
                                                                                      logFirebaseEvent('PrimaryRoundedButtonLoading_validate_for');
                                                                                      if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                        return;
                                                                                      }
                                                                                      logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                      await columnDwEmailTemplatesRecord!.reference.update(createDwEmailTemplatesRecordData(
                                                                                        brandName: _model.inputTextFieldFromNameModel.textController.text,
                                                                                        fromEmail: _model.inputTextFieldFromEmailModel.textController.text,
                                                                                        additionalText: _model.inputTextFieldAdditionalTextModel.textController.text,
                                                                                        footerText: _model.inputTextAreaFooterTextModel.textController.text,
                                                                                        brandLogo: _model.getLogoPath != null && _model.getLogoPath != '' ? _model.getLogoPath : columnDwEmailTemplatesRecord?.brandLogo,
                                                                                        brandColor: _model.colorTextFieldBrandColorModel.textController.text,
                                                                                        backgroundColor: _model.colorTextFieldBgColorModel.textController.text,
                                                                                        contentBackgroundColor: _model.colorTextFieldContentBgColorModel.textController.text,
                                                                                        contentTextColor: _model.colorTextFieldContentTextColorModel.textController.text,
                                                                                      ));
                                                                                      logFirebaseEvent('PrimaryRoundedButtonLoading_action_block');
                                                                                      await action_blocks.alertSuccess(
                                                                                        context,
                                                                                        descPara: 'Saved',
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '6mcbt4t1' /* Sender Options */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium,
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '2l5jmvd9' /* Email logo (120 by 40) */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                    fontSize: 12.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) => InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('CREATE_EMAIL_TEMPLATES_Container_ee45ksp');
                                                                                                  logFirebaseEvent('PhotoGrid_alert_dialog');
                                                                                                  await showAlignedDialog(
                                                                                                    barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                                                    context: context,
                                                                                                    isGlobal: true,
                                                                                                    avoidOverflow: false,
                                                                                                    targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                    builder: (dialogContext) {
                                                                                                      return Material(
                                                                                                        color: Colors.transparent,
                                                                                                        child: WebViewAware(
                                                                                                            child: Container(
                                                                                                          height: 600.0,
                                                                                                          width: 800.0,
                                                                                                          child: ListOfMediaCompWidget(),
                                                                                                        )),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() => _model.getLogoPath = value));

                                                                                                  setState(() {});
                                                                                                },
                                                                                                child: wrapWithModel(
                                                                                                  model: _model.photoGridModel1,
                                                                                                  updateCallback: () => setState(() {}),
                                                                                                  updateOnChange: true,
                                                                                                  child: PhotoGridWidget(
                                                                                                    photoWidth: 240,
                                                                                                    photoHeight: 80,
                                                                                                    photoPath: _model.getLogoPath != null && _model.getLogoPath != '' ? _model.getLogoPath : columnDwEmailTemplatesRecord?.brandLogo,
                                                                                                    photoName: 'Rectangle Logo',
                                                                                                    photoNameFontSize: 12,
                                                                                                    bgColor: FlutterFlowTheme.of(context).accent3,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            wrapWithModel(
                                                                                              model: _model.primaryRoundedButtonLoadingModel4,
                                                                                              updateCallback: () => setState(() {}),
                                                                                              updateOnChange: true,
                                                                                              child: PrimaryRoundedButtonLoadingWidget(
                                                                                                buttonText: 'Save',
                                                                                                buttonBgColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                buttonTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                buttonWidth: 80,
                                                                                                buttonHeight: 30,
                                                                                                disableStatusPara: false,
                                                                                                buttonAction: () async {
                                                                                                  logFirebaseEvent('CREATE_EMAIL_TEMPLATES_Container_3i6cil1');
                                                                                                  logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                                  await columnDwEmailTemplatesRecord!.reference.update(createDwEmailTemplatesRecordData(
                                                                                                    brandLogo: _model.getLogoPath,
                                                                                                  ));
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.inputTextFieldFromNameModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: InputTextFieldWidget(
                                                                                            labelPara: '\"From\" Name',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.brandName,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.inputTextFieldFromEmailModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: InputTextFieldWidget(
                                                                                            labelPara: '\"From\" Address',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.fromEmail,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 20.0)),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '6r996214' /* Additional email templates */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleMedium,
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.inputTextFieldAdditionalTextModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: InputTextFieldWidget(
                                                                                            labelPara: 'Additional text',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.additionalText,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.inputTextAreaFooterTextModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: InputTextAreaWidget(
                                                                                            labelPara: 'Footer text',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.footerText,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.colorTextFieldBrandColorModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: ColorTextFieldWidget(
                                                                                            labelPara: 'Brand color',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.brandColor,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.colorTextFieldBgColorModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: ColorTextFieldWidget(
                                                                                            labelPara: 'Background color',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.backgroundColor,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.colorTextFieldContentBgColorModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: ColorTextFieldWidget(
                                                                                            labelPara: 'Content background color',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.contentBackgroundColor,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                        wrapWithModel(
                                                                                          model: _model.colorTextFieldContentTextColorModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          updateOnChange: true,
                                                                                          child: ColorTextFieldWidget(
                                                                                            labelPara: 'Text color',
                                                                                            valuePara: columnDwEmailTemplatesRecord?.contentTextColor,
                                                                                            readOnlyStatusPara: false,
                                                                                            actionPara: () async {},
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 20.0)).around(SizedBox(height: 20.0)),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 20.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 30.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                ))
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 80.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'g6aosb6f' /* From: */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                RichText(
                                                                                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          _model.inputTextFieldFromNameModel.textController.text != null && _model.inputTextFieldFromNameModel.textController.text != '' ? _model.inputTextFieldFromNameModel.textController.text : (columnDwEmailTemplatesRecord?.brandName != null && columnDwEmailTemplatesRecord?.brandName != '' ? columnDwEmailTemplatesRecord?.brandName : containerDwAppRecord?.appName),
                                                                                          'Teckaa',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'vl72lb4t' /*   < */,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: valueOrDefault<String>(
                                                                                          _model.inputTextFieldFromEmailModel.textController.text != null && _model.inputTextFieldFromEmailModel.textController.text != '' ? _model.inputTextFieldFromEmailModel.textController.text : (columnDwEmailTemplatesRecord?.fromEmail != null && columnDwEmailTemplatesRecord?.fromEmail != '' ? columnDwEmailTemplatesRecord?.fromEmail : containerDwAppRecord?.appGeneralEmail),
                                                                                          'entrepriseproduct@teckaa.com',
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'wz1eq3z3' /* > */,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 80.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'swmhzwtk' /* To: */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                RichText(
                                                                                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: currentUserDisplayName,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'ir7znwxw' /*   */,
                                                                                        ),
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: '<${currentUserEmail}>',
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 80.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'pzxmurft' /* Date: */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '${dateTimeFormat(
                                                                                    'yMMMd',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )}, ${dateTimeFormat(
                                                                                    'jm',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 80.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '4gcfbiup' /* Subject: */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  _model.inputTextFieldSubjectLineModel.textController.text != null && _model.inputTextFieldSubjectLineModel.textController.text != '' ? _model.inputTextFieldSubjectLineModel.textController.text : columnDwEmailCustomTemplatesRecord.subject,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(height: 8.0)),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              800.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: Image.asset(
                                                                                'assets/images/Email_template_background.png',
                                                                              ).image,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: valueOrDefault<double>(
                                                                                    _model.choiceChipsValue == 'Desktop' ? 700.0 : 385.0,
                                                                                    700.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: colorFromCssString(
                                                                                      valueOrDefault<String>(
                                                                                        _model.colorTextFieldBgColorModel.textController.text != null && _model.colorTextFieldBgColorModel.textController.text != '' ? _model.colorTextFieldBgColorModel.textController.text : columnDwEmailTemplatesRecord?.backgroundColor,
                                                                                        'Teckaa',
                                                                                      ),
                                                                                      defaultColor: Color(0xFFF1F4F8),
                                                                                    ),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: valueOrDefault<double>(
                                                                                          _model.choiceChipsValue == 'Desktop' ? 600.0 : 385.0,
                                                                                          600.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            wrapWithModel(
                                                                                              model: _model.photoGridModel2,
                                                                                              updateCallback: () => setState(() {}),
                                                                                              updateOnChange: true,
                                                                                              child: PhotoGridWidget(
                                                                                                photoWidth: 120,
                                                                                                photoPath: _model.getLogoPath != null && _model.getLogoPath != '' ? _model.getLogoPath : containerDwAppRecord?.appLightRectangleLogo,
                                                                                                photoName: 'Logo',
                                                                                                photoNameFontSize: 12,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: colorFromCssString(
                                                                                                  valueOrDefault<String>(
                                                                                                    _model.colorTextFieldContentBgColorModel.textController.text != null && _model.colorTextFieldContentBgColorModel.textController.text != '' ? _model.colorTextFieldContentBgColorModel.textController.text : columnDwEmailTemplatesRecord?.contentBackgroundColor,
                                                                                                    'Teckaa',
                                                                                                  ),
                                                                                                  defaultColor: Colors.white,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        AuthUserStreamWidget(
                                                                                                          builder: (context) => Text(
                                                                                                            'Hi ${valueOrDefault(currentUserDocument?.firstName, '')},',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: colorFromCssString(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      _model.colorTextFieldContentTextColorModel.textController.text != null && _model.colorTextFieldContentTextColorModel.textController.text != '' ? _model.colorTextFieldContentTextColorModel.textController.text : columnDwEmailTemplatesRecord?.contentTextColor,
                                                                                                                      'Teckaa',
                                                                                                                    ),
                                                                                                                    defaultColor: Color(0xFF454745),
                                                                                                                  ),
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        TextFormField(
                                                                                                          controller: _model.textFieldContentController ??= TextEditingController(
                                                                                                            text: valueOrDefault<String>(
                                                                                                              columnDwEmailCustomTemplatesRecord.content,
                                                                                                              'Start writing',
                                                                                                            ),
                                                                                                          ),
                                                                                                          focusNode: _model.textFieldContentFocusNode,
                                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                                            '_model.textFieldContentController',
                                                                                                            Duration(milliseconds: 0),
                                                                                                            () => setState(() {}),
                                                                                                          ),
                                                                                                          autofocus: true,
                                                                                                          readOnly: widget.editMode == 'Preview',
                                                                                                          obscureText: false,
                                                                                                          decoration: InputDecoration(
                                                                                                            isDense: true,
                                                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  lineHeight: 1.6,
                                                                                                                ),
                                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                                              'r9ssh94o' /* Start writing */,
                                                                                                            ),
                                                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  lineHeight: 1.6,
                                                                                                                ),
                                                                                                            enabledBorder: InputBorder.none,
                                                                                                            focusedBorder: InputBorder.none,
                                                                                                            errorBorder: InputBorder.none,
                                                                                                            focusedErrorBorder: InputBorder.none,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: colorFromCssString(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    _model.colorTextFieldContentTextColorModel.textController.text != null && _model.colorTextFieldContentTextColorModel.textController.text != '' ? _model.colorTextFieldContentTextColorModel.textController.text : columnDwEmailTemplatesRecord?.contentTextColor,
                                                                                                                    'Teckaa',
                                                                                                                  ),
                                                                                                                  defaultColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                ),
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                lineHeight: 1.6,
                                                                                                              ),
                                                                                                          maxLines: null,
                                                                                                          minLines: 5,
                                                                                                          validator: _model.textFieldContentControllerValidator.asValidator(context),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 15.0)),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 20.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  wrapWithModel(
                                                                                                    model: _model.photoGridModel3,
                                                                                                    updateCallback: () => setState(() {}),
                                                                                                    updateOnChange: true,
                                                                                                    child: PhotoGridWidget(
                                                                                                      photoWidth: 100,
                                                                                                      photoPath: _model.getLogoPath != null && _model.getLogoPath != '' ? _model.getLogoPath : (columnDwEmailTemplatesRecord?.brandLogo != null && columnDwEmailTemplatesRecord?.brandLogo != '' ? columnDwEmailTemplatesRecord?.brandLogo : containerDwAppRecord?.appLightRectangleLogo),
                                                                                                      photoName: 'Logo',
                                                                                                      photoNameFontSize: 12,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      _model.inputTextAreaFooterTextModel.textController.text != null && _model.inputTextAreaFooterTextModel.textController.text != '' ? _model.inputTextAreaFooterTextModel.textController.text : (columnDwEmailTemplatesRecord?.footerText != null && columnDwEmailTemplatesRecord?.footerText != '' ? columnDwEmailTemplatesRecord?.footerText : containerDwAppRecord?.appName),
                                                                                                      'Teckaa',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          color: colorFromCssString(
                                                                                                            valueOrDefault<String>(
                                                                                                              _model.colorTextFieldContentTextColorModel.textController.text != null && _model.colorTextFieldContentTextColorModel.textController.text != '' ? _model.colorTextFieldContentTextColorModel.textController.text : columnDwEmailTemplatesRecord?.contentTextColor,
                                                                                                              'Teckaa',
                                                                                                            ),
                                                                                                            defaultColor: Color(0xFF454745),
                                                                                                          ),
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                          lineHeight: 1.7,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 20.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 30.0)).around(SizedBox(height: 30.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 30.0)),
                                                                    ),
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  width: 20.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.00, -1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 100.0),
                                            child: Container(
                                              width: 400.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Form(
                                                key: _model.formKey1,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
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
                                                        'om7kh3gv' /* Name your template */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .inputTextFieldTemplateNameModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          InputTextFieldWidget(
                                                        labelPara:
                                                            'Template name',
                                                        valuePara:
                                                            columnDwEmailCustomTemplatesRecord
                                                                .name,
                                                        readOnlyStatusPara:
                                                            true,
                                                        filledColorPara:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .disableColor,
                                                        actionPara: () async {},
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .inputTextFieldSubjectLineModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          InputTextFieldWidget(
                                                        labelPara:
                                                            'Subject line',
                                                        valuePara:
                                                            columnDwEmailCustomTemplatesRecord
                                                                .subject,
                                                        readOnlyStatusPara:
                                                            false,
                                                        actionPara: () async {},
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .inputTextFieldPreviewTextModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          InputTextFieldWidget(
                                                        labelPara:
                                                            'Preview text (about 35 characters) ',
                                                        valuePara:
                                                            columnDwEmailCustomTemplatesRecord
                                                                .heading,
                                                        readOnlyStatusPara:
                                                            false,
                                                        actionPara: () async {},
                                                      ),
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
                                                            'ldygdigk' /* Type */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                        FlutterFlowDropDown<
                                                            String>(
                                                          controller: _model
                                                                  .dropDownTypeValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dropDownTypeValue ??=
                                                                columnDwEmailCustomTemplatesRecord
                                                                    .type,
                                                          ),
                                                          options: [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '95v16b0v' /* Authentication */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'hduvoe9p' /* Security */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '3dy0b47g' /* Account */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'a28b3843' /* Transaction */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'pm0rajax' /* Ecommerce */,
                                                            )
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.dropDownTypeValue =
                                                                      val),
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium,
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '4j60atdm' /* Please select... */,
                                                          ),
                                                          icon: Icon(
                                                            FFIcons.karrowDown1,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            size: 18.0,
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
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
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
                                                            '81tx04ke' /* Recipients */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                        FlutterFlowDropDown<
                                                            String>(
                                                          controller: _model
                                                                  .dropDownRecipientsValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dropDownRecipientsValue ??=
                                                                columnDwEmailCustomTemplatesRecord
                                                                    .recipient,
                                                          ),
                                                          options: [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'q2gca5fi' /* Customers */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'wwmxu4ay' /* Admin */,
                                                            )
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.dropDownRecipientsValue =
                                                                      val),
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium,
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'nkr4co1e' /* Please select... */,
                                                          ),
                                                          icon: Icon(
                                                            FFIcons.karrowDown1,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            size: 18.0,
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
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .primaryButtonModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          PrimaryButtonWidget(
                                                        buttonText:
                                                            'Proceed to design',
                                                        buttonWidth: 400,
                                                        buttonHeight: 45,
                                                        disableStatusPara: (_model
                                                                        .inputTextFieldTemplateNameModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .inputTextFieldTemplateNameModel
                                                                        .textController
                                                                        .text ==
                                                                    '') ||
                                                            (_model
                                                                        .inputTextFieldSubjectLineModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .inputTextFieldSubjectLineModel
                                                                        .textController
                                                                        .text ==
                                                                    '') ||
                                                            (_model
                                                                        .inputTextFieldPreviewTextModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .inputTextFieldPreviewTextModel
                                                                        .textController
                                                                        .text ==
                                                                    ''),
                                                        disableColorPara:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .disableColor,
                                                        buttonAction: () async {
                                                          logFirebaseEvent(
                                                              'CREATE_EMAIL_TEMPLATES_Container_v7ep4ak');
                                                          logFirebaseEvent(
                                                              'PrimaryButton_validate_form');
                                                          if (_model.formKey1
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey1
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          logFirebaseEvent(
                                                              'PrimaryButton_update_component_state');
                                                          setState(() {
                                                            _model.layoutType =
                                                                'Design';
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
          },
        ),
      ),
    );
  }
}
