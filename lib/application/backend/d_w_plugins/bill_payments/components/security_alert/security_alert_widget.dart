import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
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
import 'security_alert_model.dart';
export 'security_alert_model.dart';

class SecurityAlertWidget extends StatefulWidget {
  const SecurityAlertWidget({
    Key? key,
    String? pluginName,
  })  : this.pluginName = pluginName ?? '',
        super(key: key);

  final String pluginName;

  @override
  _SecurityAlertWidgetState createState() => _SecurityAlertWidgetState();
}

class _SecurityAlertWidgetState extends State<SecurityAlertWidget>
    with TickerProviderStateMixin {
  late SecurityAlertModel _model;

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
    _model = createModel(context, () => SecurityAlertModel());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.modalHeaderModel,
                  updateCallback: () => setState(() {}),
                  child: ModalHeaderWidget(
                    headerTitlePara: 'Security Alert',
                    headerTitleTextColorPara:
                        FlutterFlowTheme.of(context).primaryText,
                    headerActionPara: () async {
                      logFirebaseEvent(
                          'SECURITY_ALERT_Container_9j9rf0st_CALLBA');
                      logFirebaseEvent('ModalHeader_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: StreamBuilder<List<DwPluginsRecord>>(
                    stream: queryDwPluginsRecord(
                      queryBuilder: (dwPluginsRecord) => dwPluginsRecord.where(
                        'plugin_name',
                        isEqualTo: widget.pluginName,
                      ),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return ShimmerCard2Widget(
                          itemNo: 1,
                          itemHeight: 120,
                        );
                      }
                      List<DwPluginsRecord> columnMessageDwPluginsRecordList =
                          snapshot.data!;
                      final columnMessageDwPluginsRecord =
                          columnMessageDwPluginsRecordList.isNotEmpty
                              ? columnMessageDwPluginsRecordList.first
                              : null;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              columnMessageDwPluginsRecord!
                                  .pluginSecurityTransactionMessage,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.modalFooterColumnModel,
                  updateCallback: () => setState(() {}),
                  child: ModalFooterColumnWidget(
                    cancelTextPara: 'Cancel',
                    proceedTextPara: 'Create Transaction PIN',
                    disableProceedBtnPara: false,
                    proceedTextAction: () async {
                      logFirebaseEvent(
                          'SECURITY_ALERT_Container_4e3ccvld_CALLBA');
                      logFirebaseEvent('ModalFooterColumn_navigate_to');

                      context.pushNamed('CreateTransactionPin');
                    },
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
