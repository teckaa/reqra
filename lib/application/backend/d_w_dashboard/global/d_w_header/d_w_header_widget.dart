import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/modals/modal_drop_down/modal_drop_down_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'd_w_header_model.dart';
export 'd_w_header_model.dart';

class DWHeaderWidget extends StatefulWidget {
  const DWHeaderWidget({
    Key? key,
    String? pageTitle,
  })  : this.pageTitle = pageTitle ?? 'Profile',
        super(key: key);

  final String pageTitle;

  @override
  _DWHeaderWidgetState createState() => _DWHeaderWidgetState();
}

class _DWHeaderWidgetState extends State<DWHeaderWidget> {
  late DWHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DWHeaderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('D_W_HEADER_COMP_DWHeader_ON_INIT_STATE');
      // Action 1 - Get Announcement Data
      logFirebaseEvent('DWHeader_Action1-GetAnnouncementData');
      unawaited(
        () async {
          _model.getAnnouncementData = await queryDwAnnouncementsRecordCount(
            queryBuilder: (dwAnnouncementsRecord) =>
                dwAnnouncementsRecord.where(
              'post_status',
              isEqualTo: true,
            ),
          );
        }(),
      );
    });

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
          ))
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            widget.pageTitle,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'D_W_HEADER_COMP_VIEW_HOMEPAGE_BTN_ON_TAP');
                            logFirebaseEvent('Button_launch_u_r_l');
                            await launchURL(functions.getDomainUrl()!);
                          },
                          text: FFLocalizations.of(context).getText(
                            'b4yxua96' /* View Homepage */,
                          ),
                          icon: Icon(
                            FFIcons.keye,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            height: 35.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).lineColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                            hoverColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            hoverTextColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'D_W_HEADER_COMP_Card_42444f1l_ON_TAP');
                              logFirebaseEvent('Card_alert_dialog');
                              await showAlignedDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                isGlobal: false,
                                avoidOverflow: false,
                                targetAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor:
                                    AlignmentDirectional(0.92, -1.05)
                                        .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: WebViewAware(
                                        child: ModalDropDownWidget()),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.photoGridCoverModel,
                                  updateCallback: () => setState(() {}),
                                  child: PhotoGridCoverWidget(
                                    photoWidth: 35,
                                    photoHeight: 35,
                                    photoPath: currentUserPhoto,
                                    photoName: functions.getFirstLetterOfString(
                                        valueOrDefault(
                                            currentUserDocument?.firstName,
                                            '')),
                                    photoNameFontSize: 14,
                                    bgColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: StreamBuilder<List<DwAnnouncementsRecord>>(
              stream: queryDwAnnouncementsRecord(
                queryBuilder: (dwAnnouncementsRecord) => dwAnnouncementsRecord
                    .where(
                      'post_status',
                      isEqualTo: true,
                    )
                    .orderBy('created_at', descending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return ShimmerCard2Widget(
                    itemNo: 1,
                    itemSpacing: 20,
                    itemHeight: 60,
                  );
                }
                List<DwAnnouncementsRecord>
                    listViewAnnouncementBarDwAnnouncementsRecordList =
                    snapshot.data!;
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:
                      listViewAnnouncementBarDwAnnouncementsRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(
                      height: (listViewAnnouncementBarDwAnnouncementsRecordList
                                      .length ==
                                  0
                              ? 0
                              : 20)
                          .toDouble()),
                  itemBuilder: (context, listViewAnnouncementBarIndex) {
                    final listViewAnnouncementBarDwAnnouncementsRecord =
                        listViewAnnouncementBarDwAnnouncementsRecordList[
                            listViewAnnouncementBarIndex];
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          listViewAnnouncementBarDwAnnouncementsRecord
                              .postBgColor,
                          FlutterFlowTheme.of(context).warningSoft,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listViewAnnouncementBarDwAnnouncementsRecord
                                  .postTitle,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Color(0xFF1E2429),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Text(
                              listViewAnnouncementBarDwAnnouncementsRecord
                                  .postDesc,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: Color(0xFF423E3E),
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
