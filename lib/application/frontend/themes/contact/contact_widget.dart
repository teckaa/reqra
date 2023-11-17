import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field/tel_text_field_widget.dart';
import '/application/frontend/themes/footer/footer_widget.dart';
import '/application/frontend/themes/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contact_model.dart';
export 'contact_model.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget>
    with TickerProviderStateMixin {
  late ContactModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, 38.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Contact'});

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
        title: 'Contact',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => setState(() {}),
                      child: HeaderWidget(
                        viewMode: false,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: Image.asset(
                            'assets/images/background-photo-13.png',
                          ).image,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 50.0, 15.0, 50.0),
                            child: Container(
                              width: 700.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectionArea(
                                      child: Text(
                                    FFLocalizations.of(context).getText(
                                      '1a66gu30' /* Contact Us */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily),
                                        ),
                                  )).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: SelectionArea(
                                        child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3zp6iw98' /* We pride ourselves on providin... */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily),
                                            lineHeight: 1.6,
                                          ),
                                    )).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation2']!),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 80.0, 15.0, 80.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 700.0,
                              decoration: BoxDecoration(),
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.inputTextFieldFullnameModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: InputTextFieldWidget(
                                          labelPara: 'Fullname (Company Name)',
                                          hintPara: 'John Doe',
                                          readOnlyStatusPara: false,
                                          actionPara: () async {},
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: wrapWithModel(
                                        model: _model.emailTextFieldEmailModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: EmailTextFieldWidget(
                                          labelPara: 'Email Address',
                                          hintPara: 'Email address',
                                          readOnlyStatusPara: false,
                                          actionPara: () async {},
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.telTextFieldPhoneNumberModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: TelTextFieldWidget(
                                          labelPara: 'Phone Number',
                                          hintPara: 'Phone number',
                                          readOnlyStatusPara: false,
                                          actionPara: () async {},
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.inputTextFieldSubjectModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: InputTextFieldWidget(
                                          labelPara: 'Subject',
                                          hintPara: 'Subject',
                                          actionPara: () async {},
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: wrapWithModel(
                                        model: _model.inputTextAreaMessageModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: InputTextAreaWidget(
                                          labelPara: 'Your message here',
                                          hintPara: 'Message',
                                          actionPara: () async {},
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.primaryButtonModel,
                                      updateCallback: () => setState(() {}),
                                      child: PrimaryButtonWidget(
                                        buttonText: 'Send Message',
                                        buttonBgColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        buttonBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        buttonWidth: 150,
                                        buttonHeight: 50,
                                        buttonAction: () async {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.footerModel,
                      updateCallback: () => setState(() {}),
                      child: FooterWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
