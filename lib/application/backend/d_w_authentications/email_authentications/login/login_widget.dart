import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Login'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Login',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.authHeaderModel,
                    updateCallback: () => setState(() {}),
                    child: AuthHeaderWidget(
                      headerText: 'Create an account',
                      textAction: () async {
                        logFirebaseEvent(
                            'LOGIN_PAGE_Container_fw961j35_CALLBACK');
                        logFirebaseEvent('AuthHeader_action_block');
                        await action_blocks.getStartedAction(context);
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 450.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LOGIN_PAGE_Text-Title_ON_TAP');
                                    logFirebaseEvent('Text-Title_navigate_to');

                                    context.pushNamed('SetupApplication');
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'rfz28my4' /* Log in to your account */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        wrapWithModel(
                                          model:
                                              _model.emailTextFieldEmailModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: EmailTextFieldWidget(
                                            labelPara: 'Email Address',
                                            hintPara: 'Email',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model
                                              .passwordTextFieldPasswordModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: PasswordTextFieldWidget(
                                            labelPara: 'Password',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model
                                              .primaryButtonLoadingLoginModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: PrimaryButtonLoadingWidget(
                                            buttonText: 'Log In',
                                            buttonBgColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            buttonTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                            buttonWidth: 450,
                                            buttonHeight: 45,
                                            disableStatusPara: (_model
                                                            .emailTextFieldEmailModel
                                                            .textController
                                                            .text ==
                                                        null ||
                                                    _model
                                                            .emailTextFieldEmailModel
                                                            .textController
                                                            .text ==
                                                        '') ||
                                                (_model.passwordTextFieldPasswordModel
                                                            .textController.text ==
                                                        null ||
                                                    _model
                                                            .passwordTextFieldPasswordModel
                                                            .textController
                                                            .text ==
                                                        ''),
                                            disableColorPara:
                                                FlutterFlowTheme.of(context)
                                                    .disableColor,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'LOGIN_PrimaryButtonLoading-Login_CALLBAC');
                                              // Action 1 - Validate form
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Login_Action1-Valid');
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              // Action 2 - Login authentication
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Login_Action2-Login');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();

                                              final user = await authManager
                                                  .signInWithEmail(
                                                context,
                                                _model.emailTextFieldEmailModel
                                                    .textController.text,
                                                _model
                                                    .passwordTextFieldPasswordModel
                                                    .textController
                                                    .text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              if (currentUserEmailVerified ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Login_action_block');
                                                unawaited(
                                                  () async {
                                                    await action_blocks
                                                        .generalEmailNotification(
                                                      context,
                                                      customTemplateName: '1',
                                                    );
                                                  }(),
                                                );
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Login_navigate_to');

                                                context.pushNamedAuth(
                                                    'Dashboard',
                                                    context.mounted);

                                                return;
                                              } else {
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Login_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                        child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            ModalConfirmWidget(
                                                          modalTitle:
                                                              'Email Verification',
                                                          modalDesc:
                                                              'You need to verify your email',
                                                          modalAction:
                                                              () async {
                                                            logFirebaseEvent(
                                                                '_auth');
                                                          },
                                                        ),
                                                      ),
                                                    ));
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                return;
                                              }
                                            },
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'LOGIN_PAGE_Button-LoginWithGoogle_ON_TAP');
                                            logFirebaseEvent(
                                                'Button-LoginWithGoogle_auth');
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final user = await authManager
                                                .signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }
                                            logFirebaseEvent(
                                                'Button-LoginWithGoogle_navigate_to');

                                            context.pushNamedAuth(
                                                'Dashboard', context.mounted);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'tts8mxya' /* Login with Google */,
                                          ),
                                          icon: Icon(
                                            FFIcons.kgoogle,
                                            size: 18.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 45.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'acitrn6w' /* Forget your Password?  */,
                                                ),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0kzm3ffw' /* Reset it here */,
                                                ),
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        logFirebaseEvent(
                                                            'LOGIN_PAGE_RichTextSpan_em87mzxo_ON_TAP');
                                                        logFirebaseEvent(
                                                            'RichTextSpan_navigate_to');

                                                        context.pushNamed(
                                                            'ForgetPassword');
                                                      },
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 100.0)),
              ),
            ),
          ),
        ));
  }
}
