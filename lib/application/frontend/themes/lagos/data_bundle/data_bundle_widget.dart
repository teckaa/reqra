import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/frontend/themes/lagos/components/footer_lagos/footer_lagos_widget.dart';
import '/application/frontend/themes/lagos/components/header_lagos/header_lagos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data_bundle_model.dart';
export 'data_bundle_model.dart';

class DataBundleWidget extends StatefulWidget {
  const DataBundleWidget({Key? key}) : super(key: key);

  @override
  _DataBundleWidgetState createState() => _DataBundleWidgetState();
}

class _DataBundleWidgetState extends State<DataBundleWidget> {
  late DataBundleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataBundleModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'DataBundle'});
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
        title: 'Data Bundle',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).white,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.headerLagosModel,
                      updateCallback: () => setState(() {}),
                      child: HeaderLagosWidget(
                        products: Color(0xFF625D5D),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).black,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 80.0, 15.0, 80.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: valueOrDefault<double>(
                                  FFAppState().appDefaultWebWidth.toDouble(),
                                  1280.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Wrap(
                                  spacing: 5.0,
                                  runSpacing: 30.0,
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width >=
                                                1280.0
                                            ? (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4)
                                            : MediaQuery.sizeOf(context).width,
                                        600.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5064iuc8' /* Purchase Data Bundles */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displayLargeFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: SelectionArea(
                                                child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qrmo5w5j' /* Get your data fix effortlessly... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                        lineHeight: 1.6,
                                                      ),
                                            )),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .primaryRoundedButtonModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: PrimaryRoundedButtonWidget(
                                                buttonText:
                                                    'Get Started, It\'s Free',
                                                buttonBgColor:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                buttonTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .black,
                                                buttonWidth: 180,
                                                buttonHeight: 50,
                                                buttonAction: () async {
                                                  logFirebaseEvent(
                                                      'DATA_BUNDLE_Container_8ab7yt2c_CALLBACK');
                                                  logFirebaseEvent(
                                                      'PrimaryRoundedButton_action_block');
                                                  await action_blocks
                                                      .getStartedAction(
                                                          context);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width >=
                                                1280.0
                                            ? (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4)
                                            : MediaQuery.sizeOf(context).width,
                                        600.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Airtime.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 100.0, 15.0, 150.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 700.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'dqqthkl0' /* Seamless Data Bundle Transacti... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily),
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: SelectionArea(
                                          child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ift65cnb' /* Enjoy uninterrupted access to ... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              color: Color(0xFF454745),
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily),
                                              lineHeight: 1.6,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.footerLagosModel,
                      updateCallback: () => setState(() {}),
                      child: FooterLagosWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
