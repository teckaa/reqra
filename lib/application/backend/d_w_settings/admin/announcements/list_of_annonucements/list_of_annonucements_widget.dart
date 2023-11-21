import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_settings/admin/announcements/components/create_announcement/create_announcement_widget.dart';
import '/application/backend/d_w_settings/admin/announcements/components/update_announcement/update_announcement_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/icons/icon/icon_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_annonucements_model.dart';
export 'list_of_annonucements_model.dart';

class ListOfAnnonucementsWidget extends StatefulWidget {
  const ListOfAnnonucementsWidget({Key? key}) : super(key: key);

  @override
  _ListOfAnnonucementsWidgetState createState() =>
      _ListOfAnnonucementsWidgetState();
}

class _ListOfAnnonucementsWidgetState extends State<ListOfAnnonucementsWidget> {
  late ListOfAnnonucementsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfAnnonucementsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListOfAnnonucements'});
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
        title: 'Annonucements',
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
                            'LIST_OF_ANNONUCEMENTS_arrowLeft2_ICN_ON_');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'foef0h91' /* Annonucements */,
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
                      selectedSidebarNav: 'Annonucements',
                    ),
                  ),
                  Flexible(
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
                                  pageTitle: 'Annonucements',
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 600.0,
                                          decoration: BoxDecoration(),
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
                                                child:
                                                    TitleWithBackButtonWidget(
                                                  titleName: 'Annonucements',
                                                  actionPara: () async {
                                                    logFirebaseEvent(
                                                        'LIST_OF_ANNONUCEMENTS_Container_2ju4sqjj');
                                                    logFirebaseEvent(
                                                        'TitleWithBackButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'b9t5i833' /* If you have recent or notewort... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 300.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .searchTextFieldModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              SearchTextFieldWidget(
                                                            hintPara: 'Search',
                                                            readOnlyStatusPara:
                                                                false,
                                                            actionPara:
                                                                () async {},
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .primaryButtonModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          PrimaryButtonWidget(
                                                        buttonText: 'Add new',
                                                        disableStatusPara:
                                                            false,
                                                        buttonAction: () async {
                                                          logFirebaseEvent(
                                                              'LIST_OF_ANNONUCEMENTS_Container_n28cod9x');
                                                          logFirebaseEvent(
                                                              'PrimaryButton_bottom_sheet');
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
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      CreateAnnouncementWidget(),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                              FutureBuilder<int>(
                                                future:
                                                    queryDwAnnouncementsRecordCount(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return ShimmerCountWidget();
                                                  }
                                                  int textCount =
                                                      snapshot.data!;
                                                  return Text(
                                                    '${textCount.toString()} Announcement',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 20.0)),
                                          ),
                                        ),
                                        StreamBuilder<
                                            List<DwAnnouncementsRecord>>(
                                          stream: queryDwAnnouncementsRecord(
                                            queryBuilder:
                                                (dwAnnouncementsRecord) =>
                                                    dwAnnouncementsRecord
                                                        .orderBy('created_at',
                                                            descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: LinearProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              );
                                            }
                                            List<DwAnnouncementsRecord>
                                                columnDwAnnouncementsRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    columnDwAnnouncementsRecordList
                                                        .length, (columnIndex) {
                                                  final columnDwAnnouncementsRecord =
                                                      columnDwAnnouncementsRecordList[
                                                          columnIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
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
                                                              'LIST_OF_ANNONUCEMENTS_Container_36i9vkvc');
                                                          logFirebaseEvent(
                                                              'Container_bottom_sheet');
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
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      UpdateAnnouncementWidget(
                                                                    recordRef:
                                                                        columnDwAnnouncementsRecord
                                                                            .reference,
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              columnDwAnnouncementsRecord
                                                                  .postBgColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .warningSoft,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  columnDwAnnouncementsRecord
                                                                      .postTitle,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFF1E2429),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  columnDwAnnouncementsRecord
                                                                      .postDesc,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        color: Color(
                                                                            0xFF423E3E),
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  RichText(
                                                                    textScaleFactor:
                                                                        MediaQuery.of(context)
                                                                            .textScaleFactor,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'excgrstu' /* Date:  */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              '${dateTimeFormat(
                                                                            'yMMMd',
                                                                            columnDwAnnouncementsRecord.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} ${dateTimeFormat(
                                                                            'jm',
                                                                            columnDwAnnouncementsRecord.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )}',
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                  ),
                                                                  StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        columnDwAnnouncementsRecord
                                                                            .userRef!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              LinearProgressIndicator(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        );
                                                                      }
                                                                      final richTextUserUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return RichText(
                                                                        textScaleFactor:
                                                                            MediaQuery.of(context).textScaleFactor,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'brv9nbtu' /* Creator:  */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: richTextUserUsersRecord.displayName,
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodySmall,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          IconWidget(
                                                            key: Key(
                                                                'Keyllc_${columnIndex}_of_${columnDwAnnouncementsRecordList.length}'),
                                                            iconPara: Icon(
                                                              FFIcons.ktrash,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 18.0,
                                                            ),
                                                            iconTooltipPara:
                                                                'Remove from list',
                                                            iconActionPara:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'LIST_OF_ANNONUCEMENTS_Container_llc76za4');
                                                              logFirebaseEvent(
                                                                  'Icon_bottom_sheet');
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
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          ModalConfirmWidget(
                                                                        modalTitle:
                                                                            'Delete this Announcement',
                                                                        modalDesc:
                                                                            'Are you sure you want to delete this announcement?',
                                                                        modalAction:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              '_backend_call');
                                                                          await columnDwAnnouncementsRecord
                                                                              .reference
                                                                              .delete();
                                                                          logFirebaseEvent(
                                                                              '_bottom_sheet');
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ));
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 30.0)),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 10.0)),
                                                  );
                                                }).divide(
                                                    SizedBox(height: 15.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ].divide(SizedBox(height: 40.0)),
                                    ),
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
          ),
        ));
  }
}
