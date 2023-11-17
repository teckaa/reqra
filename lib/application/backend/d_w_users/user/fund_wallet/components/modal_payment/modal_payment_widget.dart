import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_payment_model.dart';
export 'modal_payment_model.dart';

class ModalPaymentWidget extends StatefulWidget {
  const ModalPaymentWidget({
    Key? key,
    this.paymentLink,
  }) : super(key: key);

  final String? paymentLink;

  @override
  _ModalPaymentWidgetState createState() => _ModalPaymentWidgetState();
}

class _ModalPaymentWidgetState extends State<ModalPaymentWidget>
    with TickerProviderStateMixin {
  late ModalPaymentModel _model;

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
    _model = createModel(context, () => ModalPaymentModel());

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
          width: valueOrDefault<double>(
            () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 350.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return 700.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 800.0;
              } else {
                return 800.0;
              }
            }(),
            800.0,
          ),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Payment',
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'MODAL_PAYMENT_Container_0qrkzomn_CALLBAC');
                    logFirebaseEvent('ModalHeader_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                    logFirebaseEvent('ModalHeader_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      if (widget.paymentLink != null &&
                          widget.paymentLink != '') {
                        return FlutterFlowWebView(
                          content: widget.paymentLink!,
                          bypass: false,
                          height: 600.0,
                          verticalScroll: false,
                          horizontalScroll: false,
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 400.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'pe9cjigo' /* It seems you cancel the paymen... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.modalFooterColumnModel,
                              updateCallback: () => setState(() {}),
                              child: ModalFooterColumnWidget(
                                proceedTextPara: 'Close',
                                disableProceedBtnPara: false,
                                proceedTextAction: () async {
                                  logFirebaseEvent(
                                      'MODAL_PAYMENT_Container_yivzbqvp_CALLBAC');
                                  logFirebaseEvent(
                                      'ModalFooterColumn_navigate_to');

                                  context.pushNamed(
                                    'Dashboard',
                                    queryParameters: {
                                      'defaultDashboard': serializeParam(
                                        'Bill Payments',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 30.0)),
                        );
                      }
                    },
                  ),
                ],
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
