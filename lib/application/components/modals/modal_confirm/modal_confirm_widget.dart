import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_confirm_model.dart';
export 'modal_confirm_model.dart';

class ModalConfirmWidget extends StatefulWidget {
  const ModalConfirmWidget({
    Key? key,
    this.modalTitle,
    this.modalDesc,
    this.modalAction,
  }) : super(key: key);

  final String? modalTitle;
  final String? modalDesc;
  final Future<dynamic> Function()? modalAction;

  @override
  _ModalConfirmWidgetState createState() => _ModalConfirmWidgetState();
}

class _ModalConfirmWidgetState extends State<ModalConfirmWidget>
    with TickerProviderStateMixin {
  late ModalConfirmModel _model;

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
    _model = createModel(context, () => ModalConfirmModel());

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
          width: 350.0,
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
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.modalTitle!,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                    Text(
                      widget.modalDesc!,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.primaryButtonLoadingDeleteModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: PrimaryButtonLoadingWidget(
                        buttonText: 'Yes',
                        buttonWidth: 120,
                        buttonHeight: 40,
                        disableStatusPara: false,
                        buttonAction: () async {
                          logFirebaseEvent(
                              'MODAL_CONFIRM_PrimaryButtonLoading-Delet');
                          logFirebaseEvent(
                              'PrimaryButtonLoading-Delete_execute_call');
                          await widget.modalAction?.call();
                        },
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MODAL_CONFIRM_PrimaryButton-Cancel_ON_TA');
                        logFirebaseEvent(
                            'PrimaryButton-Cancel_close_dialog,_drawe');
                        Navigator.pop(context);
                      },
                      child: wrapWithModel(
                        model: _model.primaryButtonCancelModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: PrimaryButtonWidget(
                          buttonText: 'No',
                          buttonBgColor: FlutterFlowTheme.of(context).accent4,
                          buttonTextColor:
                              FlutterFlowTheme.of(context).primaryText,
                          buttonWidth: 120,
                          buttonHeight: 40,
                          disableStatusPara: false,
                          buttonHoverBGColor:
                              FlutterFlowTheme.of(context).accent3,
                          buttonAction: () async {
                            logFirebaseEvent(
                                'MODAL_CONFIRM_PrimaryButton-Cancel_CALLB');
                            logFirebaseEvent(
                                'PrimaryButton-Cancel_bottom_sheet');
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 15.0)),
                ),
              ].divide(SizedBox(height: 50.0)),
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
