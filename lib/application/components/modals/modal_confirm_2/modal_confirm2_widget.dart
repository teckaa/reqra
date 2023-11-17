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
import 'modal_confirm2_model.dart';
export 'modal_confirm2_model.dart';

class ModalConfirm2Widget extends StatefulWidget {
  const ModalConfirm2Widget({
    Key? key,
    this.modalTitlePara,
    this.modalDescPara,
    this.cancelBtnTextPara,
    this.confirmBtnTextPara,
    this.confirmActionPara,
  }) : super(key: key);

  final String? modalTitlePara;
  final String? modalDescPara;
  final String? cancelBtnTextPara;
  final String? confirmBtnTextPara;
  final Future<dynamic> Function()? confirmActionPara;

  @override
  _ModalConfirm2WidgetState createState() => _ModalConfirm2WidgetState();
}

class _ModalConfirm2WidgetState extends State<ModalConfirm2Widget>
    with TickerProviderStateMixin {
  late ModalConfirm2Model _model;

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
    _model = createModel(context, () => ModalConfirm2Model());

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
          padding: EdgeInsetsDirectional.fromSTEB(35.0, 35.0, 35.0, 35.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.modalTitlePara!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Text(
                    widget.modalDescPara!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                          lineHeight: 2.0,
                        ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
              if (isiOS || isAndroid) Spacer(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.primaryButtonLoadingModel,
                    updateCallback: () => setState(() {}),
                    child: PrimaryButtonLoadingWidget(
                      buttonText: widget.confirmBtnTextPara,
                      buttonWidth: 400,
                      buttonHeight: 50,
                      disableStatusPara: false,
                      buttonAction: () async {
                        logFirebaseEvent(
                            'MODAL_CONFIRM_2_Container_s3cmstqx_CALLB');
                        logFirebaseEvent(
                            'PrimaryButtonLoading_execute_callback');
                        await widget.confirmActionPara?.call();
                      },
                    ),
                  ),
                  wrapWithModel(
                    model: _model.primaryButtonModel,
                    updateCallback: () => setState(() {}),
                    child: PrimaryButtonWidget(
                      buttonText: widget.cancelBtnTextPara,
                      buttonBgColor: FlutterFlowTheme.of(context).accent4,
                      buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                      buttonWidth: 400,
                      buttonHeight: 50,
                      disableStatusPara: false,
                      buttonHoverBGColor: FlutterFlowTheme.of(context).accent3,
                      buttonAction: () async {
                        logFirebaseEvent(
                            'MODAL_CONFIRM_2_Container_w70awwjc_CALLB');
                        logFirebaseEvent(
                            'PrimaryButton_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ].divide(SizedBox(height: 30.0)),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
