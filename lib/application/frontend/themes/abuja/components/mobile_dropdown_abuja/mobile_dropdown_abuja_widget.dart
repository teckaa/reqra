import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mobile_dropdown_abuja_model.dart';
export 'mobile_dropdown_abuja_model.dart';

class MobileDropdownAbujaWidget extends StatefulWidget {
  const MobileDropdownAbujaWidget({Key? key}) : super(key: key);

  @override
  _MobileDropdownAbujaWidgetState createState() =>
      _MobileDropdownAbujaWidgetState();
}

class _MobileDropdownAbujaWidgetState extends State<MobileDropdownAbujaWidget>
    with TickerProviderStateMixin {
  late MobileDropdownAbujaModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 100.ms,
          begin: Offset(0.0, 80.0),
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
    _model = createModel(context, () => MobileDropdownAbujaModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MOBILE_DROPDOWN_ABUJA_Text-Home_ON_TAP');
                            logFirebaseEvent('Text-Home_navigate_to');

                            context.pushNamed('Home');
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rzibozbs' /* Home */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MOBILE_DROPDOWN_ABUJA_Text-About_ON_TAP');
                            logFirebaseEvent('Text-About_navigate_to');

                            context.pushNamed('AboutUs');
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'e7qb05d8' /* About Us */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MOBILE_DROPDOWN_ABUJA_Text-Products_ON_T');
                                logFirebaseEvent(
                                    'Text-Products_update_component_state');
                                setState(() {
                                  _model.subMenuState = false;
                                });
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '601jfb8s' /* Products */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            ToggleIcon(
                              onPressed: () async {
                                setState(() =>
                                    _model.subMenuState = !_model.subMenuState);
                              },
                              value: _model.subMenuState,
                              onIcon: Icon(
                                FFIcons.karrowDown1,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                              offIcon: Icon(
                                FFIcons.karrowUp2,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.subMenuState == false)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MOBILE_DROPDOWN_ABUJA_Column-SubMenu_ON_');
                            logFirebaseEvent('Column-SubMenu_navigate_to');

                            context.pushNamed('GiftCards');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MOBILE_DROPDOWN_ABUJA_Text-Crypto_ON_TAP');
                                    logFirebaseEvent('Text-Crypto_navigate_to');

                                    context.pushNamed('Crypto');
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'rla3bc1u' /* Crypto */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'znxm8ca9' /* Gift Cards */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
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
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MOBILE_DROPDOWN_ABUJA_Text-Blog_ON_TAP');
                            logFirebaseEvent('Text-Blog_navigate_to');

                            context.pushNamed('Blog');
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'pkkaurja' /* Blog */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MOBILE_DROPDOWN_ABUJA_Text-Faq_ON_TAP');
                            logFirebaseEvent('Text-Faq_navigate_to');

                            context.pushNamed('Faqs');
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '77jnbf7v' /* Faqs */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: wrapWithModel(
                    model: _model.primaryButtonLoginModel,
                    updateCallback: () => setState(() {}),
                    child: PrimaryButtonWidget(
                      buttonText: 'Login',
                      buttonBgColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      buttonTextColor: FlutterFlowTheme.of(context).primary,
                      buttonBorderColor: FlutterFlowTheme.of(context).primary,
                      buttonWidth: 400,
                      buttonHeight: 45,
                      buttonAction: () async {
                        logFirebaseEvent(
                            'MOBILE_DROPDOWN_ABUJA_PrimaryButton-Logi');
                        logFirebaseEvent('PrimaryButton-Login_action_block');
                        await action_blocks.loginAction(context);
                      },
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.primaryButtonRegisterModel,
                  updateCallback: () => setState(() {}),
                  child: PrimaryButtonWidget(
                    buttonText: 'Get Started it\'s Free',
                    buttonBgColor: FlutterFlowTheme.of(context).primary,
                    buttonTextColor: FlutterFlowTheme.of(context).white,
                    buttonWidth: 400,
                    buttonHeight: 45,
                    buttonAction: () async {
                      logFirebaseEvent(
                          'MOBILE_DROPDOWN_ABUJA_PrimaryButton-Regi');
                      logFirebaseEvent('PrimaryButton-Register_action_block');
                      await action_blocks.getStartedAction(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
