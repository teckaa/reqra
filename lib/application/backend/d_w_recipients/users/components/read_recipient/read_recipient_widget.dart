import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'read_recipient_model.dart';
export 'read_recipient_model.dart';

class ReadRecipientWidget extends StatefulWidget {
  const ReadRecipientWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _ReadRecipientWidgetState createState() => _ReadRecipientWidgetState();
}

class _ReadRecipientWidgetState extends State<ReadRecipientWidget>
    with TickerProviderStateMixin {
  late ReadRecipientModel _model;

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
    _model = createModel(context, () => ReadRecipientModel());

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
          width: 400.0,
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
          child: StreamBuilder<DwRecipientsRecord>(
            stream: DwRecipientsRecord.getDocument(widget.recordRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: LinearProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                );
              }
              final columnDwRecipientsRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.modalHeaderModel,
                    updateCallback: () => setState(() {}),
                    child: ModalHeaderWidget(
                      headerTitlePara: 'View Recipient Details',
                      headerTitleTextColorPara:
                          FlutterFlowTheme.of(context).primaryText,
                      headerActionPara: () async {
                        logFirebaseEvent(
                            'READ_RECIPIENT_Container_b3jsunbz_CALLBA');
                        logFirebaseEvent(
                            'ModalHeader_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'i7azxg6e' /* Bank name */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        columnDwRecipientsRecord.bankName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'READ_RECIPIENT_COMP_Icon-Copy_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon-Copy_action_block');
                                          await action_blocks.copiedAction(
                                            context,
                                            message: columnDwRecipientsRecord
                                                .bankName,
                                          );
                                        },
                                        child: Icon(
                                          FFIcons.kcopy,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '2zdlxta3' /* Name on account */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        columnDwRecipientsRecord.accountName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'READ_RECIPIENT_COMP_Icon-Copy_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon-Copy_action_block');
                                          await action_blocks.copiedAction(
                                            context,
                                            message: columnDwRecipientsRecord
                                                .accountName,
                                          );
                                        },
                                        child: Icon(
                                          FFIcons.kcopy,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'qh1gxa3p' /* Account number */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        columnDwRecipientsRecord.accountNumber,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'READ_RECIPIENT_COMP_Icon-Copy_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon-Copy_action_block');
                                          await action_blocks.copiedAction(
                                            context,
                                            message: columnDwRecipientsRecord
                                                .accountNumber,
                                          );
                                        },
                                        child: Icon(
                                          FFIcons.kcopy,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => wrapWithModel(
                      model: _model.modalFooterColumnModel,
                      updateCallback: () => setState(() {}),
                      child: ModalFooterColumnWidget(
                        cancelTextPara: 'Close',
                        proceedTextPara: 'Delete',
                        proceedTextAction: () async {
                          logFirebaseEvent(
                              'READ_RECIPIENT_Container_s8a34bou_CALLBA');
                          logFirebaseEvent('ModalFooterColumn_alert_dialog');
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
                                  modalTitle: 'Delete receipent',
                                  modalDesc:
                                      'Are you sure you want to delete this receipent ',
                                  modalAction: () async {
                                    logFirebaseEvent('_backend_call');
                                    await columnDwRecipientsRecord.reference
                                        .delete();
                                    logFirebaseEvent(
                                        '_close_dialog,_drawer,_etc');
                                    Navigator.pop(context);
                                    logFirebaseEvent('_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                                )),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
