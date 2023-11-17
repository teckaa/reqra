import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_sms_model.dart';
export 'register_sms_model.dart';

class RegisterSmsWidget extends StatefulWidget {
  const RegisterSmsWidget({
    Key? key,
    this.userReferral,
  }) : super(key: key);

  final DocumentReference? userReferral;

  @override
  _RegisterSmsWidgetState createState() => _RegisterSmsWidgetState();
}

class _RegisterSmsWidgetState extends State<RegisterSmsWidget> {
  late RegisterSmsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterSmsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'RegisterSms'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REGISTER_SMS_RegisterSms_ON_INIT_STATE');
      logFirebaseEvent('RegisterSms_update_app_state');
      setState(() {
        FFAppState().userReferral = widget.userReferral;
      });
    });

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
        title: 'Register via Sms',
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
                            'REGISTER_SMS_Container_3o91w4xp_CALLBACK');
                        logFirebaseEvent('AuthHeader_action_block');
                        await action_blocks.loginAction(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 450.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'afrkirbs' /* Sign up with your Phone Number */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 200.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .textFieldWithLabelFirstnameModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: InputTextFieldWidget(
                                                    labelPara: 'Firstname',
                                                    hintPara: 'Enter firstname',
                                                    readOnlyStatusPara: false,
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 200.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .textFieldWithLabelLastnameModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: InputTextFieldWidget(
                                                    labelPara: 'Lastname',
                                                    hintPara: 'Enter lastname',
                                                    readOnlyStatusPara: false,
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 20.0)),
                                        ),
                                        wrapWithModel(
                                          model: _model
                                              .countryTextFieldWithFlagModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: CountryTextFieldWithFlagWidget(
                                            labelPara: 'Country',
                                            hintPara: 'Chose country',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model
                                              .telTextFieldWithDialCodeModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: TelTextFieldWithDialCodeWidget(
                                            labelPara: 'Phone Number',
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
                                              .textFieldWithLabelConfirmPasswordModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: PasswordTextFieldWidget(
                                            labelPara: 'Confirm Password',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model
                                              .primaryButtonLoadingRegisterModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: PrimaryButtonLoadingWidget(
                                            buttonText: 'Register',
                                            buttonBgColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            buttonTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                            buttonWidth: 450,
                                            buttonHeight: 45,
                                            disableStatusPara: (_model.textFieldWithLabelFirstnameModel.textController.text == null || _model.textFieldWithLabelFirstnameModel.textController.text == '') ||
                                                (_model.textFieldWithLabelLastnameModel.textController.text == null ||
                                                    _model
                                                            .textFieldWithLabelLastnameModel
                                                            .textController
                                                            .text ==
                                                        '') ||
                                                (_model.countryTextFieldWithFlagModel.textFieldCountryController.text == null ||
                                                    _model
                                                            .countryTextFieldWithFlagModel
                                                            .textFieldCountryController
                                                            .text ==
                                                        '') ||
                                                (_model.telTextFieldWithDialCodeModel.textFieldDialCodeController.text == null ||
                                                    _model
                                                            .telTextFieldWithDialCodeModel
                                                            .textFieldDialCodeController
                                                            .text ==
                                                        '') ||
                                                (_model.telTextFieldWithDialCodeModel.textFieldPhoneNumberController.text == null ||
                                                    _model
                                                            .telTextFieldWithDialCodeModel
                                                            .textFieldPhoneNumberController
                                                            .text ==
                                                        '') ||
                                                (_model.passwordTextFieldPasswordModel.textController.text == null ||
                                                    _model
                                                            .passwordTextFieldPasswordModel
                                                            .textController
                                                            .text ==
                                                        '') ||
                                                (_model.textFieldWithLabelConfirmPasswordModel.textController.text == null ||
                                                    _model.textFieldWithLabelConfirmPasswordModel.textController.text == ''),
                                            disableColorPara:
                                                FlutterFlowTheme.of(context)
                                                    .disableColor,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'REGISTER_SMS_PrimaryButtonLoading-Regist');
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_validate_f');
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_auth');
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'REGISTER_SMS_RichText_6dcmhf9s_ON_TAP');
                                            logFirebaseEvent(
                                                'RichText_action_block');
                                            await action_blocks
                                                .loginAction(context);
                                          },
                                          child: RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'r4uvquxq' /* Already have an account?  */,
                                                  ),
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'q236mrnh' /* Sign in */,
                                                  ),
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                  mouseCursor:
                                                      SystemMouseCursors.click,
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          logFirebaseEvent(
                                                              'REGISTER_SMS_RichTextSpan_hb7bx709_ON_TA');
                                                          logFirebaseEvent(
                                                              'RichTextSpan_navigate_to');

                                                          context.pushNamed(
                                                              'LoginSms');
                                                        },
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
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
                  ),
                ].divide(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ));
  }
}
