import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'app_logo_model.dart';
export 'app_logo_model.dart';

class AppLogoWidget extends StatefulWidget {
  const AppLogoWidget({Key? key}) : super(key: key);

  @override
  _AppLogoWidgetState createState() => _AppLogoWidgetState();
}

class _AppLogoWidgetState extends State<AppLogoWidget> {
  late AppLogoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppLogoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AppLogo'});
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
        title: 'App Logo',
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
                        logFirebaseEvent('APP_LOGO_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'bnkozl7r' /* App Logo */,
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
                      selectedSidebarNav: 'App Logo',
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
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.dWHeaderModel,
                                      updateCallback: () => setState(() {}),
                                      child: DWHeaderWidget(
                                        pageTitle: 'App Logo',
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                20.0,
                                                                20.0,
                                                                20.0),
                                                    child: StreamBuilder<
                                                        List<DwAppRecord>>(
                                                      stream: queryDwAppRecord(
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return ShimmerListOfListsWidget();
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
                                                          width: 500.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              wrapWithModel(
                                                                model: _model
                                                                    .titleWithBackButtonModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    TitleWithBackButtonWidget(
                                                                  titleName:
                                                                      'App Logo',
                                                                  actionPara:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'APP_LOGO_Container_ttrv8y5f_CALLBACK');
                                                                    logFirebaseEvent(
                                                                        'TitleWithBackButton_navigate_back');
                                                                    context
                                                                        .safePop();
                                                                  },
                                                                ),
                                                              ),
                                                              RichText(
                                                                textScaleFactor:
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ywyv9b5l' /* Please take a moment to upload... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                13.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'v0oof6ag' /* Canva (canva.com) */,
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                      ),
                                                                      mouseCursor:
                                                                          SystemMouseCursors
                                                                              .click,
                                                                      recognizer:
                                                                          TapGestureRecognizer()
                                                                            ..onTap =
                                                                                () async {
                                                                              logFirebaseEvent('APP_LOGO_RichTextSpan_7gcjv41g_ON_TAP');
                                                                              logFirebaseEvent('RichTextSpan_launch_u_r_l');
                                                                              await launchURL('https://canva.com');
                                                                            },
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '4n5bacfn' /*  a user-friendly design platfo... */,
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        lineHeight:
                                                                            1.6,
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
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
                                                                              'ztisz91g' /* Light Mode */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '4rranvts' /* Please upload your light mode ... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                      Wrap(
                                                                        spacing:
                                                                            25.0,
                                                                        runSpacing:
                                                                            20.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                120.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'z29z0ezq' /* Square logo (100by100) */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        fontSize: 10.0,
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
                                                                                      logFirebaseEvent('APP_LOGO_PAGE_Container_6xjf96vs_ON_TAP');
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
                                                                                                child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: Container(
                                                                                                height: 600.0,
                                                                                                width: 800.0,
                                                                                                child: ListOfMediaCompWidget(),
                                                                                              ),
                                                                                            )),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.getLightImagePathForSquareLogo = value));

                                                                                      logFirebaseEvent('PhotoGrid_update_page_state');
                                                                                      setState(() {
                                                                                        _model.lightSquareLogoSaveButton = true;
                                                                                      });

                                                                                      setState(() {});
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.photoGridModel1,
                                                                                      updateCallback: () => setState(() {}),
                                                                                      updateOnChange: true,
                                                                                      child: PhotoGridWidget(
                                                                                        photoWidth: 120,
                                                                                        photoHeight: 120,
                                                                                        photoPath: _model.getLightImagePathForSquareLogo == null || _model.getLightImagePathForSquareLogo == '' ? containerDwAppRecord?.appLightSquareLogo : _model.getLightImagePathForSquareLogo,
                                                                                        photoName: 'Square Logo',
                                                                                        photoNameFontSize: 11,
                                                                                        bgColor: FlutterFlowTheme.of(context).accent3,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    if (_model.lightSquareLogoSaveButton)
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel1,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        updateOnChange: true,
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Save',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonBorderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonWidth: 50,
                                                                                          buttonHeight: 25,
                                                                                          disableStatusPara: false,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_yl17xwvs_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appLightSquareLogo: _model.getLightImagePathForSquareLogo,
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.lightSquareLogoSaveButton = false;
                                                                                            });
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_action_block');
                                                                                            await action_blocks.alertSuccess(
                                                                                              context,
                                                                                              descPara: 'Saved',
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    if (containerDwAppRecord?.appLightSquareLogo != null && containerDwAppRecord?.appLightSquareLogo != '')
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel2,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        updateOnChange: true,
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Delete',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonWidth: 60,
                                                                                          buttonHeight: 25,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_2tcm5cns_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appLightSquareLogo: '',
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.lightSquareLogoSaveButton = false;
                                                                                            });
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
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                320.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'vug6kzcl' /* Rectangle logo (400by100) */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        fontSize: 10.0,
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
                                                                                      logFirebaseEvent('APP_LOGO_PAGE_Container_sc3zuo8w_ON_TAP');
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
                                                                                                child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: Container(
                                                                                                height: 600.0,
                                                                                                width: 800.0,
                                                                                                child: ListOfMediaCompWidget(),
                                                                                              ),
                                                                                            )),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.getLightImagePathForRectangleLogo = value));

                                                                                      logFirebaseEvent('PhotoGrid_update_page_state');
                                                                                      setState(() {
                                                                                        _model.lightRectangleLogoSaveButton = true;
                                                                                      });

                                                                                      setState(() {});
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.photoGridModel2,
                                                                                      updateCallback: () => setState(() {}),
                                                                                      updateOnChange: true,
                                                                                      child: PhotoGridWidget(
                                                                                        photoWidth: 320,
                                                                                        photoHeight: 120,
                                                                                        photoPath: _model.getLightImagePathForRectangleLogo == null || _model.getLightImagePathForRectangleLogo == '' ? containerDwAppRecord?.appLightRectangleLogo : _model.getLightImagePathForRectangleLogo,
                                                                                        photoName: 'Rectangle Logo',
                                                                                        photoNameFontSize: 11,
                                                                                        bgColor: FlutterFlowTheme.of(context).accent3,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    if (_model.lightRectangleLogoSaveButton)
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel3,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        updateOnChange: true,
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Save',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonBorderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonWidth: 50,
                                                                                          buttonHeight: 25,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_700s54ta_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appLightRectangleLogo: _model.getLightImagePathForRectangleLogo,
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.lightRectangleLogoSaveButton = false;
                                                                                            });
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_action_block');
                                                                                            await action_blocks.alertSuccess(
                                                                                              context,
                                                                                              descPara: 'Saved',
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    if (containerDwAppRecord?.appLightRectangleLogo != null && containerDwAppRecord?.appLightRectangleLogo != '')
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel4,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        updateOnChange: true,
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Delete',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonWidth: 60,
                                                                                          buttonHeight: 25,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_8uaw25y0_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appLightRectangleLogo: '',
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.lightRectangleLogoSaveButton = false;
                                                                                            });
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
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            20.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
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
                                                                              '5l134qo6' /* Dark Mode */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '91nl9mlp' /* Please upload your dark mode l... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                      Wrap(
                                                                        spacing:
                                                                            25.0,
                                                                        runSpacing:
                                                                            20.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                120.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'e62bgjvu' /* Square logo (100by100) */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        fontSize: 10.0,
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
                                                                                      logFirebaseEvent('APP_LOGO_PAGE_Container_re1udh9e_ON_TAP');
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
                                                                                                child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: Container(
                                                                                                height: 600.0,
                                                                                                width: 800.0,
                                                                                                child: ListOfMediaCompWidget(),
                                                                                              ),
                                                                                            )),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.getDarkImagePathForSquareLogo = value));

                                                                                      logFirebaseEvent('PhotoGrid_update_page_state');
                                                                                      setState(() {
                                                                                        _model.darkSquareLogoSaveButton = true;
                                                                                      });

                                                                                      setState(() {});
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.photoGridModel3,
                                                                                      updateCallback: () => setState(() {}),
                                                                                      updateOnChange: true,
                                                                                      child: PhotoGridWidget(
                                                                                        photoWidth: 120,
                                                                                        photoHeight: 120,
                                                                                        photoPath: _model.getDarkImagePathForSquareLogo == null || _model.getDarkImagePathForSquareLogo == '' ? containerDwAppRecord?.appDarkSquareLogo : _model.getDarkImagePathForSquareLogo,
                                                                                        photoName: 'Square Logo',
                                                                                        photoNameFontSize: 11,
                                                                                        bgColor: FlutterFlowTheme.of(context).overlay,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    if (_model.darkSquareLogoSaveButton)
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel5,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        updateOnChange: true,
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Save',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonBorderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonWidth: 50,
                                                                                          buttonHeight: 25,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_nhn7n3qs_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appDarkSquareLogo: _model.getDarkImagePathForSquareLogo,
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.darkSquareLogoSaveButton = false;
                                                                                            });
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_action_block');
                                                                                            await action_blocks.alertSuccess(
                                                                                              context,
                                                                                              descPara: 'Saved',
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    if (containerDwAppRecord?.appDarkSquareLogo != null && containerDwAppRecord?.appDarkSquareLogo != '')
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel6,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        updateOnChange: true,
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Delete',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonWidth: 60,
                                                                                          buttonHeight: 25,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_o8q5w6m3_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appDarkSquareLogo: '',
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.darkSquareLogoSaveButton = false;
                                                                                            });
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
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                320.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '25y8xv84' /* Rectangle logo (400by100) */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        fontSize: 10.0,
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
                                                                                      logFirebaseEvent('APP_LOGO_PAGE_Container_y25goma1_ON_TAP');
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
                                                                                                child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: Container(
                                                                                                height: 600.0,
                                                                                                width: 800.0,
                                                                                                child: ListOfMediaCompWidget(),
                                                                                              ),
                                                                                            )),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.getDarkImagePathForRectangleLogo = value));

                                                                                      logFirebaseEvent('PhotoGrid_update_page_state');
                                                                                      setState(() {
                                                                                        _model.darkRectangleLogoSaveButton = true;
                                                                                      });

                                                                                      setState(() {});
                                                                                    },
                                                                                    child: wrapWithModel(
                                                                                      model: _model.photoGridModel4,
                                                                                      updateCallback: () => setState(() {}),
                                                                                      updateOnChange: true,
                                                                                      child: PhotoGridWidget(
                                                                                        photoWidth: 320,
                                                                                        photoHeight: 120,
                                                                                        photoPath: _model.getDarkImagePathForRectangleLogo == null || _model.getDarkImagePathForRectangleLogo == '' ? containerDwAppRecord?.appDarkRectangleLogo : _model.getDarkImagePathForRectangleLogo,
                                                                                        photoName: 'Rectangle Logo',
                                                                                        photoNameFontSize: 11,
                                                                                        bgColor: FlutterFlowTheme.of(context).overlay,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    if (_model.darkRectangleLogoSaveButton)
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel7,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Save',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonBorderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonWidth: 50,
                                                                                          buttonHeight: 25,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_ohn3bx7o_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appDarkRectangleLogo: _model.getDarkImagePathForRectangleLogo,
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.darkRectangleLogoSaveButton = false;
                                                                                            });
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_action_block');
                                                                                            await action_blocks.alertSuccess(
                                                                                              context,
                                                                                              descPara: 'Saved',
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    if (containerDwAppRecord?.appDarkRectangleLogo != null && containerDwAppRecord?.appDarkRectangleLogo != '')
                                                                                      wrapWithModel(
                                                                                        model: _model.primaryRoundedButtonLoadingModel8,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        child: PrimaryRoundedButtonLoadingWidget(
                                                                                          buttonText: 'Delete',
                                                                                          buttonBgColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          buttonTextColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          buttonWidth: 60,
                                                                                          buttonHeight: 25,
                                                                                          buttonAction: () async {
                                                                                            logFirebaseEvent('APP_LOGO_Container_tbt9lwrj_CALLBACK');
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_backend_call');

                                                                                            await containerDwAppRecord!.reference.update(createDwAppRecordData(
                                                                                              appDarkRectangleLogo: '',
                                                                                            ));
                                                                                            logFirebaseEvent('PrimaryRoundedButtonLoading_update_page_');
                                                                                            setState(() {
                                                                                              _model.darkRectangleLogoSaveButton = false;
                                                                                            });
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
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            20.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 20.0)),
                                                          ),
                                                        );
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
