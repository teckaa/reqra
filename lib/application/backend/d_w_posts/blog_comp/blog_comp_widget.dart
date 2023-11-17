import '/application/backend/d_w_posts/admin/post_settings/post_settings_widget.dart';
import '/application/backend/d_w_posts/components/create_post/create_post_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_circle_button/shimmer_circle_button_widget.dart';
import '/application/components/shimmers/shimmer_lists_of_cards/shimmer_lists_of_cards_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'blog_comp_model.dart';
export 'blog_comp_model.dart';

class BlogCompWidget extends StatefulWidget {
  const BlogCompWidget({Key? key}) : super(key: key);

  @override
  _BlogCompWidgetState createState() => _BlogCompWidgetState();
}

class _BlogCompWidgetState extends State<BlogCompWidget>
    with TickerProviderStateMixin {
  late BlogCompModel _model;

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, 100.0),
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
    _model = createModel(context, () => BlogCompModel());

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
      alignment: AlignmentDirectional(0.00, -1.00),
      child: StreamBuilder<List<DwPostsSettingsRecord>>(
        stream: queryDwPostsSettingsRecord(
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: ShimmerCardWidget(
                heightPara: 500,
              ),
            );
          }
          List<DwPostsSettingsRecord> containerDwPostsSettingsRecordList =
              snapshot.data!;
          final containerDwPostsSettingsRecord =
              containerDwPostsSettingsRecordList.isNotEmpty
                  ? containerDwPostsSettingsRecordList.first
                  : null;
          return Material(
            color: Colors.transparent,
            elevation: 0.0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 50.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 1200.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((valueOrDefault(
                                                currentUserDocument?.userRole,
                                                '') ==
                                            'Owner') ||
                                        (valueOrDefault(
                                                currentUserDocument?.userRole,
                                                '') ==
                                            'Admin') ||
                                        (valueOrDefault(
                                                currentUserDocument?.userRole,
                                                '') ==
                                            'Customer Support'))
                                      AuthUserStreamWidget(
                                        builder: (context) => Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '7ay3wec2' /* Edit this Section */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .primaryRoundedButtonModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: PrimaryRoundedButtonWidget(
                                                buttonText: 'Edit',
                                                buttonBgColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                buttonTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                buttonWidth: 60,
                                                buttonHeight: 30,
                                                disableStatusPara: false,
                                                buttonAction: () async {
                                                  logFirebaseEvent(
                                                      'BLOG_Container_rmkha24c_CALLBACK');
                                                  logFirebaseEvent(
                                                      'PrimaryRoundedButton_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .overlay,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                          child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            PostSettingsWidget(),
                                                      ));
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 15.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containerDwPostsSettingsRecord
                                                          ?.blogTitle,
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation1']!),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    containerDwPostsSettingsRecord
                                                        ?.blogDesc,
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                        lineHeight: 1.6,
                                                      ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation2']!),
                                              ],
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Container(
                        width: 1200.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((valueOrDefault(
                                        currentUserDocument?.userRole, '') ==
                                    'Owner') ||
                                (valueOrDefault(
                                        currentUserDocument?.userRole, '') ==
                                    'Admin') ||
                                (valueOrDefault(
                                        currentUserDocument?.userRole, '') ==
                                    'Customer Support'))
                              AuthUserStreamWidget(
                                builder: (context) => Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'pm963fgr' /* Write a new Post */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                    wrapWithModel(
                                      model: _model.primaryRoundedButtonModel2,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: PrimaryRoundedButtonWidget(
                                        buttonText: 'Create',
                                        buttonBgColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        buttonTextColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        buttonWidth: 80,
                                        buttonHeight: 30,
                                        disableStatusPara: false,
                                        buttonAction: () async {
                                          logFirebaseEvent(
                                              'BLOG_Container_q2mdfq82_CALLBACK');
                                          logFirebaseEvent(
                                              'PrimaryRoundedButton_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .overlay,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                  child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CreatePostWidget(),
                                              ));
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: StreamBuilder<
                                      List<DwPostsCategoriesRecord>>(
                                    stream: queryDwPostsCategoriesRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return ShimmerCircleButtonWidget(
                                          buttonWidth: 80,
                                          buttonHeight: 32,
                                          numberOfButton: 4,
                                        );
                                      }
                                      List<DwPostsCategoriesRecord>
                                          rowDwPostsCategoriesRecordList =
                                          snapshot.data!;
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              rowDwPostsCategoriesRecordList
                                                  .length, (rowIndex) {
                                            final rowDwPostsCategoriesRecord =
                                                rowDwPostsCategoriesRecordList[
                                                    rowIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      rowDwPostsCategoriesRecord
                                                          .catName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                fontSize: 13.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).divide(SizedBox(width: 20.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1000.0,
                              decoration: BoxDecoration(),
                              child: StreamBuilder<List<DwPostsRecord>>(
                                stream: queryDwPostsRecord(
                                  queryBuilder: (dwPostsRecord) => dwPostsRecord
                                      .where(
                                        'post_publish_status',
                                        isEqualTo: 'Published',
                                      )
                                      .orderBy('created_at'),
                                  limit: 12,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return ShimmerListsOfCardsWidget(
                                      itemNo: 3,
                                      itemSpacing: 20,
                                      itemHeight: 300,
                                    );
                                  }
                                  List<DwPostsRecord>
                                      gridViewDwPostsRecordList =
                                      snapshot.data!;
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: valueOrDefault<int>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 1;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 2;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 3;
                                          } else {
                                            return 3;
                                          }
                                        }(),
                                        3,
                                      ),
                                      crossAxisSpacing: 20.0,
                                      mainAxisSpacing: 50.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: gridViewDwPostsRecordList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewDwPostsRecord =
                                          gridViewDwPostsRecordList[
                                              gridViewIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                              child: Image.network(
                                                getCORSProxyUrl(
                                                  gridViewDwPostsRecord
                                                      .postMedia,
                                                ),
                                                width: double.infinity,
                                                height: valueOrDefault<double>(
                                                  () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 200.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 180.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 200.0;
                                                    } else {
                                                      return 200.0;
                                                    }
                                                  }(),
                                                  200.0,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    gridViewDwPostsRecord
                                                        .postTitle,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                  Text(
                                                    gridViewDwPostsRecord
                                                        .postDescription
                                                        .maybeHandleOverflow(
                                                      maxChars: 50,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 10.0))
                                                    .around(
                                                        SizedBox(height: 10.0)),
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
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 50.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
