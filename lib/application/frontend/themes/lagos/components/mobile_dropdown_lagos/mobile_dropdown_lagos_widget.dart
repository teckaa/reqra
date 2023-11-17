import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mobile_dropdown_lagos_model.dart';
export 'mobile_dropdown_lagos_model.dart';

class MobileDropdownLagosWidget extends StatefulWidget {
  const MobileDropdownLagosWidget({Key? key}) : super(key: key);

  @override
  _MobileDropdownLagosWidgetState createState() =>
      _MobileDropdownLagosWidgetState();
}

class _MobileDropdownLagosWidgetState extends State<MobileDropdownLagosWidget>
    with TickerProviderStateMixin {
  late MobileDropdownLagosModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 100.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => MobileDropdownLagosModel());

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
      alignment: AlignmentDirectional(1.00, 0.00),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(
          width: 400.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).black,
            border: Border.all(
              width: 0.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  desktop: false,
                ))
                  Align(
                    alignment: AlignmentDirectional(1.00, 0.00),
                    child: wrapWithModel(
                      model: _model.primaryRoundedButtonModel1,
                      updateCallback: () => setState(() {}),
                      child: PrimaryRoundedButtonWidget(
                        buttonText: 'Close',
                        buttonBgColor: FlutterFlowTheme.of(context).white,
                        buttonTextColor: FlutterFlowTheme.of(context).black,
                        buttonWidth: 80,
                        buttonHeight: 35,
                        buttonAction: () async {
                          logFirebaseEvent(
                              'MOBILE_DROPDOWN_LAGOS_Container_dl5vhaqi');
                          logFirebaseEvent(
                              'PrimaryRoundedButton_close_dialog,_drawe');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MOBILE_DROPDOWN_LAGOS_Text-Home_ON_TAP');
                          logFirebaseEvent('Text-Home_navigate_to');

                          context.pushNamed('Home');
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'qkj2b70w' /* Home */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MOBILE_DROPDOWN_LAGOS_Text-About_ON_TAP');
                          logFirebaseEvent('Text-About_navigate_to');

                          context.pushNamed('AboutUs');
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '0aeam89u' /* About Us */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MOBILE_DROPDOWN_LAGOS_Text-Products_ON_T');
                              logFirebaseEvent(
                                  'Text-Products_update_component_state');
                              setState(() {
                                _model.subMenuState = false;
                              });
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'wnn73yqs' /* Products */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MOBILE_DROPDOWN_LAGOS_Text-Blog_ON_TAP');
                          logFirebaseEvent('Text-Blog_navigate_to');

                          context.pushNamed('Blog');
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '02xl4g1j' /* Blog */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.primaryRoundedButtonModel2,
                      updateCallback: () => setState(() {}),
                      child: PrimaryRoundedButtonWidget(
                        buttonText: 'Login',
                        buttonBgColor: FlutterFlowTheme.of(context).lineColor,
                        buttonTextColor: FlutterFlowTheme.of(context).black,
                        buttonWidth: 400,
                        buttonHeight: 40,
                        buttonAction: () async {
                          logFirebaseEvent(
                              'MOBILE_DROPDOWN_LAGOS_Container_yorn7ill');
                          logFirebaseEvent('PrimaryRoundedButton_action_block');
                          await action_blocks.loginAction(context);
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.primaryRoundedButtonModel3,
                      updateCallback: () => setState(() {}),
                      child: PrimaryRoundedButtonWidget(
                        buttonText: 'Get Started it\'s Free',
                        buttonWidth: 400,
                        buttonHeight: 40,
                        buttonAction: () async {
                          logFirebaseEvent(
                              'MOBILE_DROPDOWN_LAGOS_Container_9zxwddky');
                          logFirebaseEvent('PrimaryRoundedButton_action_block');
                          await action_blocks.getStartedAction(context);
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ],
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
