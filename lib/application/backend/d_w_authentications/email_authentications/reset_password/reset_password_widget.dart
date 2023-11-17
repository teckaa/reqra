import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_password_model.dart';
export 'reset_password_model.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  late ResetPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPasswordModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ResetPassword'});
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
        title: 'Reset Password',
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
                            'RESET_PASSWORD_Container_guyhhb6j_CALLBA');
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
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'id8xetmo' /* Reset your Password */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.always,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
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
                                            .primaryButtonLoadingResetModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: PrimaryButtonLoadingWidget(
                                          buttonText: 'Reset Password',
                                          buttonBgColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          buttonTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          buttonWidth: 450,
                                          buttonHeight: 45,
                                          disableStatusPara: false,
                                          disableColorPara:
                                              FlutterFlowTheme.of(context)
                                                  .disableColor,
                                          buttonAction: () async {
                                            logFirebaseEvent(
                                                'RESET_PASSWORD_PrimaryButtonLoading-Rese');
                                            logFirebaseEvent(
                                                'PrimaryButtonLoading-Reset_validate_form');
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            logFirebaseEvent(
                                                'PrimaryButtonLoading-Reset_auth');
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
                                          },
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
