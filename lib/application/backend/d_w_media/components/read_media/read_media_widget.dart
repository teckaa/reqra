import '/application/components/icons/copy_icon/copy_icon_widget.dart';
import '/application/components/icons/lunch_url_icon/lunch_url_icon_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_lists_of_cards/shimmer_lists_of_cards_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'read_media_model.dart';
export 'read_media_model.dart';

class ReadMediaWidget extends StatefulWidget {
  const ReadMediaWidget({
    Key? key,
    this.mediaRef,
  }) : super(key: key);

  final DocumentReference? mediaRef;

  @override
  _ReadMediaWidgetState createState() => _ReadMediaWidgetState();
}

class _ReadMediaWidgetState extends State<ReadMediaWidget> {
  late ReadMediaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadMediaModel());

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
        width: 800.0,
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
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent4,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.modalHeaderModel,
              updateCallback: () => setState(() {}),
              child: ModalHeaderWidget(
                headerTitlePara: 'Here\'s your Media Information',
                headerTitleTextColorPara:
                    FlutterFlowTheme.of(context).primaryText,
                headerActionPara: () async {
                  logFirebaseEvent('READ_MEDIA_Container_zxnkl5cf_CALLBACK');
                  logFirebaseEvent('ModalHeader_close_dialog,_drawer,_etc');
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
              child: StreamBuilder<DwMediaRecord>(
                stream: DwMediaRecord.getDocument(widget.mediaRef!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Container(
                      width: 800.0,
                      height: 350.0,
                      child: ShimmerListsOfCardsWidget(
                        itemNo: 1,
                        itemWidth: 800,
                        itemHeight: 350,
                      ),
                    );
                  }
                  final columnDwMediaRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 400.0,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).imageColor,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'READ_MEDIA_COMP_Image_dx7gbjws_ON_TAP');
                                  logFirebaseEvent('Image_expand_image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          getCORSProxyUrl(
                                            columnDwMediaRecord.photoPath,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: columnDwMediaRecord.photoPath,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: columnDwMediaRecord.photoPath,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      getCORSProxyUrl(
                                        columnDwMediaRecord.photoPath,
                                      ),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'iis6cviz' /* Date:  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                TextSpan(
                                  text: '${dateTimeFormat(
                                    'yMMMd',
                                    columnDwMediaRecord.createdTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )},${dateTimeFormat(
                                    'jms',
                                    columnDwMediaRecord.createdTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}',
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodySmall,
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
                                    'READ_MEDIA_COMP_Text_mxjfpdjo_ON_TAP');
                                logFirebaseEvent('Text_alert_dialog');
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  targetAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: WebViewAware(
                                          child: ModalConfirmWidget(
                                        modalTitle: 'Delete record',
                                        modalDesc:
                                            'Are you sure you want to delete this record.',
                                        modalAction: () async {
                                          logFirebaseEvent('_backend_call');
                                          await columnDwMediaRecord.reference
                                              .delete();
                                          logFirebaseEvent('_bottom_sheet');
                                          Navigator.pop(context);
                                          logFirebaseEvent(
                                              '_close_dialog,_drawer,_etc');
                                          Navigator.pop(context);
                                        },
                                      )),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'qog8zdrr' /* Delete */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: SelectionArea(
                                              child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ou3zf4f5' /* [photo url] */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          )),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.copyIconModel,
                                        updateCallback: () => setState(() {}),
                                        child: CopyIconWidget(
                                          copiedMessage: '[photo link]',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.lunchUrlIconModel,
                                        updateCallback: () => setState(() {}),
                                        child: LunchUrlIconWidget(
                                          messagePara: '[phot link]',
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 15.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ].divide(SizedBox(height: 20.0)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
