import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'forget_password_model.dart';
export 'forget_password_model.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  late ForgetPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgetPasswordModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ForgetPassword'});
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
        title: 'Forget Password',
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
                      headerText: 'Log in',
                      textAction: () async {
                        logFirebaseEvent(
                            'FORGET_PASSWORD_Container_x7v64ign_CALLB');
                        logFirebaseEvent('AuthHeader_action_block');
                        await action_blocks.loginAction(context);
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 450.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'e7wmbtfi' /* Forget Password */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '3atksh5z' /* Enter your email address and w... */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      wrapWithModel(
                                        model: _model.emailTextFieldModel,
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
                                            .primaryButtonLoadingForgetModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: PrimaryButtonLoadingWidget(
                                          buttonBgColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          buttonTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          buttonWidth: 450,
                                          buttonHeight: 45,
                                          disableStatusPara: _model
                                                      .emailTextFieldModel
                                                      .textController
                                                      .text ==
                                                  null ||
                                              _model.emailTextFieldModel
                                                      .textController.text ==
                                                  '',
                                          disableColorPara:
                                              FlutterFlowTheme.of(context)
                                                  .disableColor,
                                          buttonAction: () async {
                                            logFirebaseEvent(
                                                'FORGET_PASSWORD_PrimaryButtonLoading-For');
                                            logFirebaseEvent(
                                                'PrimaryButtonLoading-Forget_validate_for');
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            logFirebaseEvent(
                                                'PrimaryButtonLoading-Forget_auth');
                                            if (_model.emailTextFieldModel
                                                .textController.text.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Email required!',
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            await authManager.resetPassword(
                                              email: _model.emailTextFieldModel
                                                  .textController.text,
                                              context: context,
                                            );
                                            logFirebaseEvent(
                                                'PrimaryButtonLoading-Forget_navigate_to');

                                            context.pushNamed(
                                                'EmailSent-ForgetPassword');
                                          },
                                        ),
                                      ),
                                      RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qz6qwqo2' /* Back to login?  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'rygvvs16' /* Click here */,
                                              ),
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              mouseCursor:
                                                  SystemMouseCursors.click,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  logFirebaseEvent(
                                                      'FORGET_PASSWORD_RichTextSpan_tac2gfpf_ON');
                                                  logFirebaseEvent(
                                                      'RichTextSpan_action_block');
                                                  await action_blocks
                                                      .loginAction(context);
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
