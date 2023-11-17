import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_register_model.dart';
export 'verify_register_model.dart';

class VerifyRegisterWidget extends StatefulWidget {
  const VerifyRegisterWidget({Key? key}) : super(key: key);

  @override
  _VerifyRegisterWidgetState createState() => _VerifyRegisterWidgetState();
}

class _VerifyRegisterWidgetState extends State<VerifyRegisterWidget> {
  late VerifyRegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyRegisterModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VerifyRegister'});
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
        title: 'Verify Register',
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
                            'VERIFY_REGISTER_Container_y0yjfnrw_CALLB');
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
                                    'rem2mytg' /* Email Sent */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ex9s4wba' /* We have sent an email to your ... */,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VERIFY_REGISTER_PrimaryButtonLoading-For');
                                          logFirebaseEvent(
                                              'PrimaryButtonLoading-Forget_navigate_bac');
                                          context.safePop();
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .primaryButtonLoadingForgetModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: PrimaryButtonLoadingWidget(
                                            buttonText: 'Back',
                                            buttonBgColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            buttonTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                            buttonWidth: 450,
                                            buttonHeight: 45,
                                            disableStatusPara: false,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'VERIFY_REGISTER_PrimaryButtonLoading-For');
                                              logFirebaseEvent(
                                                  'PrimaryButtonLoading-Forget_navigate_bac');
                                              context.safePop();
                                            },
                                          ),
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
                                                'dto1qfc6' /* Back to login?  */,
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
                                                '3qgyxt8i' /* Click here */,
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
                                                      'VERIFY_REGISTER_RichTextSpan_p59ml9jp_ON');
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
