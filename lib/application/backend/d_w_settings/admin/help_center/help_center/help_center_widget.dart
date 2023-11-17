import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/backend/d_w_settings/admin/help_center/components/help_center_live_chat/help_center_live_chat_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/menus/sidebar_menu_item/sidebar_menu_item_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'help_center_model.dart';
export 'help_center_model.dart';

class HelpCenterWidget extends StatefulWidget {
  const HelpCenterWidget({Key? key}) : super(key: key);

  @override
  _HelpCenterWidgetState createState() => _HelpCenterWidgetState();
}

class _HelpCenterWidgetState extends State<HelpCenterWidget>
    with TickerProviderStateMixin {
  late HelpCenterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(40.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpCenterModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HelpCenter'});

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
        title: 'Help center',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
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
                          'HELP_CENTER_PAGE_arrowLeft2_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'y7upyrzr' /* Help & Support */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                )
              : null,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.dWSidebarModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: DWSidebarWidget(
                  selectedSidebarNav: 'Help & Support',
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    wrapWithModel(
                      model: _model.dWHeaderModel,
                      updateCallback: () => setState(() {}),
                      child: DWHeaderWidget(
                        pageTitle: 'Help & Support',
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder<List<DwAppRecord>>(
                              stream: queryDwAppRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: Container(
                                      width: 450.0,
                                      child: ShimmerCardWidget(
                                        heightPara: 500,
                                      ),
                                    ),
                                  );
                                }
                                List<DwAppRecord> columnDwAppRecordList =
                                    snapshot.data!;
                                final columnDwAppRecord =
                                    columnDwAppRecordList.isNotEmpty
                                        ? columnDwAppRecordList.first
                                        : null;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<DwAppHelpCenterRecord>>(
                                      stream: queryDwAppHelpCenterRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 20.0),
                                            child: Container(
                                              width: 450.0,
                                              child: ShimmerCardWidget(
                                                heightPara: 500,
                                              ),
                                            ),
                                          );
                                        }
                                        List<DwAppHelpCenterRecord>
                                            wrapDwAppHelpCenterRecordList =
                                            snapshot.data!;
                                        final wrapDwAppHelpCenterRecord =
                                            wrapDwAppHelpCenterRecordList
                                                    .isNotEmpty
                                                ? wrapDwAppHelpCenterRecordList
                                                    .first
                                                : null;
                                        return Wrap(
                                          spacing: 20.0,
                                          runSpacing: 20.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: Container(
                                                width: 450.0,
                                                decoration: BoxDecoration(),
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
                                                        wrapWithModel(
                                                          model: _model
                                                              .titleWithBackButtonModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              TitleWithBackButtonWidget(
                                                            titleName:
                                                                'Help & Support',
                                                            actionPara:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'HELP_CENTER_Container_6al1mx4u_CALLBACK');
                                                              logFirebaseEvent(
                                                                  'TitleWithBackButton_navigate_back');
                                                              context.safePop();
                                                            },
                                                          ),
                                                        ),
                                                        if ((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.userRole,
                                                                    '') ==
                                                                'Owner') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.userRole,
                                                                    '') ==
                                                                'Admin'))
                                                          AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                wrapWithModel(
                                                              model: _model
                                                                  .primaryRoundedButtonModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  PrimaryRoundedButtonWidget(
                                                                buttonText:
                                                                    'Edit',
                                                                buttonBgColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                buttonTextColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                buttonWidth: 60,
                                                                buttonHeight:
                                                                    30,
                                                                disableStatusPara:
                                                                    false,
                                                                buttonAction:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HELP_CENTER_Container_mxewd95w_CALLBACK');
                                                                  logFirebaseEvent(
                                                                      'PrimaryRoundedButton_update_page_state');
                                                                  setState(() {
                                                                    _model.editLayout =
                                                                        true;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .photoGridCoverModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            PhotoGridCoverWidget(
                                                          photoWidth: 120,
                                                          photoHeight: 120,
                                                          photoPath:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.getLogoPath !=
                                                                        null &&
                                                                    _model.getLogoPath !=
                                                                        ''
                                                                ? _model
                                                                    .getLogoPath
                                                                : wrapDwAppHelpCenterRecord
                                                                    ?.helpCenterImage,
                                                            'https://dummyimage.com/200X200&text=teckaa.com',
                                                          ),
                                                          photoName:
                                                              columnDwAppRecord
                                                                  ?.appName,
                                                          photoNameFontSize: 12,
                                                          bgColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                                        .inputTextFieldTitleModel
                                                                        .textController
                                                                        .text !=
                                                                    null &&
                                                                _model
                                                                        .inputTextFieldTitleModel
                                                                        .textController
                                                                        .text !=
                                                                    ''
                                                            ? _model
                                                                .inputTextFieldTitleModel
                                                                .textController
                                                                .text
                                                            : wrapDwAppHelpCenterRecord
                                                                ?.helpCenterTitle,
                                                        'Help center',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                                        .inputTextAreaDescModel
                                                                        .textController
                                                                        .text !=
                                                                    null &&
                                                                _model
                                                                        .inputTextAreaDescModel
                                                                        .textController
                                                                        .text !=
                                                                    ''
                                                            ? _model
                                                                .inputTextAreaDescModel
                                                                .textController
                                                                .text
                                                            : wrapDwAppHelpCenterRecord
                                                                ?.helpCenterDesc,
                                                        'How can we help you?',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                                lineHeight: 1.8,
                                                              ),
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
                                                                '6kie06uu' /* Tap the number to call  */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .sidebarMenuItemModel1,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  SidebarMenuItemWidget(
                                                                itemName: _model
                                                                                .inputTextFieldPhoneNumberModel.textController.text !=
                                                                            null &&
                                                                        _model.inputTextFieldPhoneNumberModel.textController
                                                                                .text !=
                                                                            ''
                                                                    ? _model
                                                                        .inputTextFieldPhoneNumberModel
                                                                        .textController
                                                                        .text
                                                                    : (wrapDwAppHelpCenterRecord?.helpCenterHotline !=
                                                                                null &&
                                                                            wrapDwAppHelpCenterRecord?.helpCenterHotline !=
                                                                                ''
                                                                        ? wrapDwAppHelpCenterRecord
                                                                            ?.helpCenterHotline
                                                                        : '080${functions.allLetterUpperCase(columnDwAppRecord?.appName)}'),
                                                                itemIcon: Icon(
                                                                  FFIcons.kcall,
                                                                ),
                                                              ),
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
                                                                'bx6apyig' /* Tap to send us message */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HELP_CENTER_Container_n7dal995_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'SidebarMenuItem_send_email');
                                                                await launchUrl(
                                                                    Uri(
                                                                        scheme:
                                                                            'mailto',
                                                                        path: wrapDwAppHelpCenterRecord?.helpCenterEmail != null && wrapDwAppHelpCenterRecord?.helpCenterEmail != ''
                                                                            ? wrapDwAppHelpCenterRecord!
                                                                                .helpCenterEmail
                                                                            : columnDwAppRecord!
                                                                                .appGeneralEmail,
                                                                        query: {
                                                                          'subject':
                                                                              'I need your assistance ',
                                                                          'body':
                                                                              'Hi ${columnDwAppRecord?.appName}, i need your assistance',
                                                                        }
                                                                            .entries
                                                                            .map((MapEntry<String, String> e) =>
                                                                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                                            .join('&')));
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .sidebarMenuItemModel2,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    SidebarMenuItemWidget(
                                                                  itemName: _model.emailTextFieldEmailModel.textController.text !=
                                                                              null &&
                                                                          _model.emailTextFieldEmailModel.textController.text !=
                                                                              ''
                                                                      ? _model
                                                                          .emailTextFieldEmailModel
                                                                          .textController
                                                                          .text
                                                                      : (wrapDwAppHelpCenterRecord?.helpCenterEmail != null &&
                                                                              wrapDwAppHelpCenterRecord?.helpCenterEmail !=
                                                                                  ''
                                                                          ? wrapDwAppHelpCenterRecord
                                                                              ?.helpCenterEmail
                                                                          : columnDwAppRecord
                                                                              ?.appGeneralEmail),
                                                                  itemIcon:
                                                                      Icon(
                                                                    FFIcons
                                                                        .ksms,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                DwAppLiveChatApiRecord>>(
                                                          stream:
                                                              queryDwAppLiveChatApiRecord(
                                                            singleRecord: true,
                                                          ),
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
                                                            List<DwAppLiveChatApiRecord>
                                                                columnLiveChatDwAppLiveChatApiRecordList =
                                                                snapshot.data!;
                                                            final columnLiveChatDwAppLiveChatApiRecord =
                                                                columnLiveChatDwAppLiveChatApiRecordList
                                                                        .isNotEmpty
                                                                    ? columnLiveChatDwAppLiveChatApiRecordList
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
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'zc9fpobl' /* Tap to chat with us */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HELP_CENTER_Container_sdrw96z8_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'SidebarMenuItem_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .overlay,
                                                                      useSafeArea:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                            child:
                                                                                Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              HelpCenterLiveChatWidget(
                                                                            liveChatUrl:
                                                                                columnLiveChatDwAppLiveChatApiRecord?.liveChatApi,
                                                                          ),
                                                                        ));
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .sidebarMenuItemModel3,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    updateOnChange:
                                                                        true,
                                                                    child:
                                                                        SidebarMenuItemWidget(
                                                                      itemName:
                                                                          'Live chat',
                                                                      itemIcon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kmessages,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 20.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 25.0)),
                                                ),
                                              ),
                                            ),
                                            if (_model.editLayout == true)
                                              Container(
                                                width: 450.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 40.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      offset: Offset(0.0, 2.0),
                                                      spreadRadius: 1.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .modalHeaderModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child: ModalHeaderWidget(
                                                        headerTitlePara:
                                                            'Edit Help & Support ',
                                                        headerActionPara:
                                                            () async {
                                                          logFirebaseEvent(
                                                              'HELP_CENTER_Container_xt98jjsk_CALLBACK');
                                                          logFirebaseEvent(
                                                              'ModalHeader_bottom_sheet');
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
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    ModalConfirmWidget(
                                                                  modalTitle:
                                                                      'Close this section',
                                                                  modalDesc:
                                                                      'Before closing the edit section, be sure to save your changes or you will lose them.',
                                                                  modalAction:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        '_update_page_state');
                                                                    setState(
                                                                        () {
                                                                      _model.editLayout =
                                                                          false;
                                                                    });
                                                                    logFirebaseEvent(
                                                                        '_bottom_sheet');
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    ),
                                                    Form(
                                                      key: _model.formKey,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    20.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
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
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100.0),
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HELP_CENTER_Container_aqnruait_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'PhotoGrid_alert_dialog');
                                                                        await showAlignedDialog(
                                                                          barrierColor:
                                                                              FlutterFlowTheme.of(context).overlay,
                                                                          context:
                                                                              context,
                                                                          isGlobal:
                                                                              true,
                                                                          avoidOverflow:
                                                                              false,
                                                                          targetAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          followerAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          builder:
                                                                              (dialogContext) {
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
                                                                        ).then((value) =>
                                                                            safeSetState(() =>
                                                                                _model.getLogoPath = value));

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .photoGridModel,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            PhotoGridWidget(
                                                                          photoWidth:
                                                                              120,
                                                                          photoHeight:
                                                                              120,
                                                                          photoPath: _model.getLogoPath != null && _model.getLogoPath != ''
                                                                              ? _model.getLogoPath
                                                                              : 'https://dummyimage.com/200X200&text=teckaa.com',
                                                                          photoName:
                                                                              columnDwAppRecord?.appName,
                                                                          photoNameFontSize:
                                                                              12,
                                                                          bgColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .inputTextFieldTitleModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  InputTextFieldWidget(
                                                                labelPara:
                                                                    'Help Title',
                                                                valuePara:
                                                                    wrapDwAppHelpCenterRecord
                                                                        ?.helpCenterTitle,
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .inputTextAreaDescModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  InputTextAreaWidget(
                                                                labelPara:
                                                                    'Description',
                                                                valuePara:
                                                                    wrapDwAppHelpCenterRecord
                                                                        ?.helpCenterDesc,
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .inputTextFieldPhoneNumberModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  InputTextFieldWidget(
                                                                labelPara:
                                                                    'Help Phone Number',
                                                                valuePara:
                                                                    wrapDwAppHelpCenterRecord
                                                                        ?.helpCenterHotline,
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .emailTextFieldEmailModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  EmailTextFieldWidget(
                                                                labelPara:
                                                                    'Help Center Email',
                                                                valuePara:
                                                                    wrapDwAppHelpCenterRecord
                                                                        ?.helpCenterEmail,
                                                                readOnlyStatusPara:
                                                                    false,
                                                                actionPara:
                                                                    () async {},
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HELP_CENTER_PAGE_Row_6l49o9jz_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Row_navigate_to');

                                                                context.pushNamed(
                                                                    'APIIntegration');
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wa0hperd' /* Click here to add Live Chat */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                  Icon(
                                                                    FFIcons
                                                                        .karrowRight1,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .primaryButtonLoadingModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    PrimaryButtonLoadingWidget(
                                                                  buttonText:
                                                                      'Save',
                                                                  buttonWidth:
                                                                      450,
                                                                  buttonHeight:
                                                                      45,
                                                                  disableStatusPara:
                                                                      false,
                                                                  buttonAction:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HELP_CENTER_Container_l3cnzq0c_CALLBACK');
                                                                    logFirebaseEvent(
                                                                        'PrimaryButtonLoading_validate_form');
                                                                    if (_model.formKey.currentState ==
                                                                            null ||
                                                                        !_model
                                                                            .formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                      return;
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'PrimaryButtonLoading_backend_call');

                                                                    await wrapDwAppHelpCenterRecord!
                                                                        .reference
                                                                        .update(
                                                                            createDwAppHelpCenterRecordData(
                                                                      helpCenterTitle: _model
                                                                          .inputTextFieldTitleModel
                                                                          .textController
                                                                          .text,
                                                                      helpCenterDesc: _model
                                                                          .inputTextAreaDescModel
                                                                          .textController
                                                                          .text,
                                                                      helpCenterHotline: _model
                                                                          .inputTextFieldPhoneNumberModel
                                                                          .textController
                                                                          .text,
                                                                      helpCenterEmail: _model
                                                                          .emailTextFieldEmailModel
                                                                          .textController
                                                                          .text,
                                                                      helpCenterImage:
                                                                          _model
                                                                              .getLogoPath,
                                                                    ));
                                                                    logFirebaseEvent(
                                                                        'PrimaryButtonLoading_action_block');
                                                                    await action_blocks
                                                                        .alertSuccess(
                                                                      context,
                                                                      descPara:
                                                                          'Help center info saved',
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 20.0))
                                                              .around(SizedBox(
                                                                  height:
                                                                      20.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation']!),
                                          ],
                                        );
                                      },
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
            ],
          ),
        ));
  }
}
