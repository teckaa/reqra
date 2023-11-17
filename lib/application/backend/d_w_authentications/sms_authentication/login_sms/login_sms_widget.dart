import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
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
import 'login_sms_model.dart';
export 'login_sms_model.dart';

class LoginSmsWidget extends StatefulWidget {
  const LoginSmsWidget({Key? key}) : super(key: key);

  @override
  _LoginSmsWidgetState createState() => _LoginSmsWidgetState();
}

class _LoginSmsWidgetState extends State<LoginSmsWidget> {
  late LoginSmsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginSmsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginSms'});
    authManager.handlePhoneAuthStateChanges(context);
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
        title: 'Login via Sms',
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
                            'LOGIN_SMS_Container_od6pyb3j_CALLBACK');
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
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '0cflz9xy' /* Log in via Sms */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
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
                                          model: _model
                                              .telTextFieldWithDialCodeModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: TelTextFieldWithDialCodeWidget(
                                            labelPara:
                                                'Enter your phone number to continue',
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
                                            buttonText: 'Continue',
                                            buttonBgColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            buttonTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                            buttonWidth: 450,
                                            buttonHeight: 45,
                                            disableStatusPara: (_model
                                                            .telTextFieldWithDialCodeModel
                                                            .textFieldDialCodeController
                                                            .text ==
                                                        null ||
                                                    _model
                                                            .telTextFieldWithDialCodeModel
                                                            .textFieldDialCodeController
                                                            .text ==
                                                        '') ||
                                                (_model
                                                            .telTextFieldWithDialCodeModel
                                                            .textFieldPhoneNumberController
                                                            .text ==
                                                        null ||
                                                    _model
                                                            .telTextFieldWithDialCodeModel
                                                            .textFieldPhoneNumberController
                                                            .text ==
                                                        ''),
                                            disableColorPara:
                                                FlutterFlowTheme.of(context)
                                                    .disableColor,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'LOGIN_SMS_PrimaryButtonLoading-Login_CAL');
                                              // Action 1 - Validate form
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Login_Action1-Valid');
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Login_auth');
                                              final phoneNumberVal =
                                                  '${_model.telTextFieldWithDialCodeModel.textFieldDialCodeController.text}${_model.telTextFieldWithDialCodeModel.textFieldPhoneNumberController.text}';
                                              if (phoneNumberVal == null ||
                                                  phoneNumberVal.isEmpty ||
                                                  !phoneNumberVal
                                                      .startsWith('+')) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'Phone Number is required and has to start with +.'),
                                                  ),
                                                );
                                                return;
                                              }
                                              await authManager.beginPhoneAuth(
                                                context: context,
                                                phoneNumber: phoneNumberVal,
                                                onCodeSent: (context) async {
                                                  context.goNamedAuth(
                                                    'VerifySMSOTP',
                                                    context.mounted,
                                                    queryParameters: {
                                                      'getMobileNumber':
                                                          serializeParam(
                                                        '${_model.telTextFieldWithDialCodeModel.textFieldDialCodeController.text}${_model.telTextFieldWithDialCodeModel.textFieldPhoneNumberController.text}',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    ignoreRedirect: true,
                                                  );
                                                },
                                              );
                                            },
                                          ),
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
                                                  'oj3poegf' /* Forget your password?  */,
                                                ),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'p1dbt4su' /* Reset it here */,
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
                                                            'LOGIN_SMS_RichTextSpan_6y13na55_ON_TAP');
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
