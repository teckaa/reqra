import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_model.dart';
export 'register_model.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    Key? key,
    this.userReferral,
  }) : super(key: key);

  final DocumentReference? userReferral;

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late RegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Register'});
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
        title: 'Register',
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
                      textAction: () async {
                        logFirebaseEvent(
                            'REGISTER_Container_qhez02pp_CALLBACK');
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
                                      'hemzq6we' /* Let’s Get Started */,
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
                                                decoration: BoxDecoration(),
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
                                                decoration: BoxDecoration(),
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
                                            hintPara: '8123456789',
                                            readOnlyStatusPara: false,
                                            actionPara: () async {},
                                          ),
                                        ),
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
                                                (_model.emailTextFieldEmailModel.textController.text == null ||
                                                    _model
                                                            .emailTextFieldEmailModel
                                                            .textController
                                                            .text ==
                                                        '') ||
                                                (_model.passwordTextFieldPasswordModel.textController.text == null ||
                                                    _model.passwordTextFieldPasswordModel.textController.text == '') ||
                                                (_model.textFieldWithLabelConfirmPasswordModel.textController.text == null || _model.textFieldWithLabelConfirmPasswordModel.textController.text == ''),
                                            disableColorPara:
                                                FlutterFlowTheme.of(context)
                                                    .disableColor,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'REGISTER_PrimaryButtonLoading-Register_C');
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_firestore_');
                                              _model.countUser =
                                                  await queryUsersRecordCount();
                                              // Action 1 - Validate Register
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_Action1-Va');
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              // Action 2 - Create User Information
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_Action2-Cr');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              if (_model
                                                      .passwordTextFieldPasswordModel
                                                      .textController
                                                      .text !=
                                                  _model
                                                      .textFieldWithLabelConfirmPasswordModel
                                                      .textController
                                                      .text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Passwords don\'t match!',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              final user = await authManager
                                                  .createAccountWithEmail(
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

                                              await UsersRecord.collection
                                                  .doc(user.uid)
                                                  .update(createUsersRecordData(
                                                    userRole:
                                                        valueOrDefault<String>(
                                                      _model.countUser! < 1
                                                          ? 'Owner'
                                                          : 'User',
                                                      'User',
                                                    ),
                                                    firstName: functions
                                                        .firstLetterUpperCase(_model
                                                            .textFieldWithLabelFirstnameModel
                                                            .textController
                                                            .text),
                                                    lastName: functions
                                                        .firstLetterUpperCase(_model
                                                            .textFieldWithLabelLastnameModel
                                                            .textController
                                                            .text),
                                                    displayName:
                                                        '${functions.firstLetterUpperCase(_model.textFieldWithLabelFirstnameModel.textController.text)} ${functions.firstLetterUpperCase(_model.textFieldWithLabelLastnameModel.textController.text)}',
                                                    email: _model
                                                        .emailTextFieldEmailModel
                                                        .textController
                                                        .text,
                                                    phoneNumber: _model
                                                        .telTextFieldWithDialCodeModel
                                                        .textFieldPhoneNumberController
                                                        .text,
                                                    dialCode: _model
                                                        .telTextFieldWithDialCodeModel
                                                        .textFieldDialCodeController
                                                        .text,
                                                    country: _model
                                                        .countryTextFieldWithFlagModel
                                                        .textFieldCountryController
                                                        .text,
                                                    isoCode: _model
                                                        .countryTextFieldWithFlagModel
                                                        .textFieldIsoCodeController
                                                        .text,
                                                    createdTime:
                                                        getCurrentTimestamp,
                                                  ));

                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_backend_ca');
                                              unawaited(
                                                () async {
                                                  await widget.userReferral!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'user_referrals':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget.userReferral
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }(),
                                              );
                                              // Action 3 - Sent Email Link
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_Action3-Se');
                                              await authManager
                                                  .sendEmailVerification();
                                              // Action 4 - Navigate to verify users
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Register_Action4-Na');

                                              context.pushNamedAuth(
                                                  'VerifyRegister',
                                                  context.mounted);

                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'REGISTER_RegisterWithGoogleButton_ON_TAP');
                                            logFirebaseEvent(
                                                'RegisterWithGoogleButton_auth');
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final user = await authManager
                                                .signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }
                                            logFirebaseEvent(
                                                'RegisterWithGoogleButton_navigate_to');

                                            context.pushNamedAuth(
                                                'Dashboard', context.mounted);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'dztgm8if' /* Sign up with Google */,
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
                                      ].divide(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REGISTER_PAGE_RichText_aogirxv5_ON_TAP');
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
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'q4ujqrnw' /* Already have an account?  */,
                                                ),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'oj9dq5kk' /* Sign in */,
                                                ),
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 30.0)),
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
