import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'updat_app_security_model.dart';
export 'updat_app_security_model.dart';

class UpdatAppSecurityWidget extends StatefulWidget {
  const UpdatAppSecurityWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _UpdatAppSecurityWidgetState createState() => _UpdatAppSecurityWidgetState();
}

class _UpdatAppSecurityWidgetState extends State<UpdatAppSecurityWidget>
    with TickerProviderStateMixin {
  late UpdatAppSecurityModel _model;

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
    _model = createModel(context, () => UpdatAppSecurityModel());

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
          width: 450.0,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Update',
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'UPDAT_APP_SECURITY_Container_5jtcph4j_CA');
                    logFirebaseEvent('ModalHeader_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
                  child: StreamBuilder<DwPluginsRecord>(
                    stream: DwPluginsRecord.getDocument(widget.recordRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return ShimmerCardWidget(
                          heightPara: 217,
                        );
                      }
                      final columnDwPluginsRecord = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${columnDwPluginsRecord.pluginName} Security Settings',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enable or Disable ${columnDwPluginsRecord.pluginName}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Switch.adaptive(
                                value: _model.switchSecurityValue ??=
                                    columnDwPluginsRecord
                                        .pluginSecurityTransactionStatus,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchSecurityValue = newValue!);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).accent1,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ],
                          ),
                          wrapWithModel(
                            model: _model.inputTextAreaModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: InputTextAreaWidget(
                              labelPara: 'Security Message',
                              valuePara: columnDwPluginsRecord
                                  .pluginSecurityTransactionMessage,
                              readOnlyStatusPara: false,
                              actionPara: () async {},
                            ),
                          ),
                          wrapWithModel(
                            model: _model.primaryButtonLoadingModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: PrimaryButtonLoadingWidget(
                              buttonText: 'Update',
                              buttonBgColor:
                                  FlutterFlowTheme.of(context).primary,
                              buttonTextColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              buttonWidth: 450,
                              buttonHeight: 45,
                              disableStatusPara: _model.inputTextAreaModel
                                          .textController.text ==
                                      null ||
                                  _model.inputTextAreaModel.textController
                                          .text ==
                                      '',
                              disableColorPara:
                                  FlutterFlowTheme.of(context).disableColor,
                              buttonAction: () async {
                                logFirebaseEvent(
                                    'UPDAT_APP_SECURITY_Container_f4cso34o_CA');
                                // Action 1 - Validate form
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_Action1-Validatefor');
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                // Action 3 - Create service
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_Action3-Createservi');

                                await widget.recordRef!
                                    .update(createDwPluginsRecordData(
                                  pluginSecurityTransactionStatus:
                                      _model.switchSecurityValue,
                                  pluginSecurityTransactionMessage: _model
                                      .inputTextAreaModel.textController.text,
                                ));
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_bottom_sheet');
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
