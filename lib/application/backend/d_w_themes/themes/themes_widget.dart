import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_themes/components/create_theme/create_theme_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'themes_model.dart';
export 'themes_model.dart';

class ThemesWidget extends StatefulWidget {
  const ThemesWidget({Key? key}) : super(key: key);

  @override
  _ThemesWidgetState createState() => _ThemesWidgetState();
}

class _ThemesWidgetState extends State<ThemesWidget> {
  late ThemesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThemesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Themes'});
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
        title: 'Themes',
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
                      borderWidth: 0.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('THEMES_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'hvfg038o' /* Themes */,
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
                      selectedSidebarNav: 'Themes',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if ((valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Owner') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Admin')) {
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
                                          pageTitle: 'Themes',
                                        ),
                                      ),
                                      StreamBuilder<List<DwAppRecord>>(
                                        stream: queryDwAppRecord(
                                          singleRecord: true,
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
                                          List<DwAppRecord>
                                              columnDwAppRecordList =
                                              snapshot.data!;
                                          final columnDwAppRecord =
                                              columnDwAppRecordList.isNotEmpty
                                                  ? columnDwAppRecordList.first
                                                  : null;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .primaryRoundedButtonModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        PrimaryRoundedButtonWidget(
                                                      buttonText:
                                                          'Create Theme',
                                                      buttonWidth: 150,
                                                      disableStatusPara: false,
                                                      buttonAction: () async {
                                                        logFirebaseEvent(
                                                            'THEMES_PAGE_Container_cv745g6c_CALLBACK');
                                                        logFirebaseEvent(
                                                            'PrimaryRoundedButton_bottom_sheet');
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
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CreateThemeWidget(),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 20.0),
                                                child: StreamBuilder<
                                                    List<DwThemesRecord>>(
                                                  stream: queryDwThemesRecord(
                                                    queryBuilder:
                                                        (dwThemesRecord) =>
                                                            dwThemesRecord
                                                                .orderBy('uuid',
                                                                    descending:
                                                                        true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child:
                                                            LinearProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      );
                                                    }
                                                    List<DwThemesRecord>
                                                        gridViewDwThemesRecordList =
                                                        snapshot.data!;
                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount:
                                                            valueOrDefault<int>(
                                                          () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 1;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 2;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 2;
                                                            } else {
                                                              return 2;
                                                            }
                                                          }(),
                                                          2,
                                                        ),
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 5.0,
                                                        childAspectRatio: 1.5,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          gridViewDwThemesRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          gridViewIndex) {
                                                        final gridViewDwThemesRecord =
                                                            gridViewDwThemesRecordList[
                                                                gridViewIndex];
                                                        return Container(
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Image.network(
                                                                getCORSProxyUrl(
                                                                  'https://picsum.photos/seed/89/600',
                                                                ),
                                                                width: double
                                                                    .infinity,
                                                                height: 300.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        1.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          gridViewDwThemesRecord
                                                                              .themeName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      PrimaryRoundedButtonLoadingWidget(
                                                                        key: Key(
                                                                            'Keyxrx_${gridViewIndex}_of_${gridViewDwThemesRecordList.length}'),
                                                                        buttonText: columnDwAppRecord?.appTheme ==
                                                                                gridViewDwThemesRecord.themeName
                                                                            ? 'Activated'
                                                                            : 'Activate',
                                                                        buttonBgColor: columnDwAppRecord?.appTheme ==
                                                                                columnDwAppRecord?.appTheme
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).disableColor,
                                                                        buttonWidth:
                                                                            120,
                                                                        buttonHeight:
                                                                            40,
                                                                        disableStatusPara:
                                                                            false,
                                                                        buttonAction:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'THEMES_PAGE_Container_xrxbizh2_CALLBACK');
                                                                          logFirebaseEvent(
                                                                              'PrimaryRoundedButtonLoading_backend_call');

                                                                          await columnDwAppRecord!
                                                                              .reference
                                                                              .update(createDwAppRecordData(
                                                                            appTheme:
                                                                                gridViewDwThemesRecord.themeName,
                                                                          ));
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        },
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
