import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaction_biometric_model.dart';
export 'transaction_biometric_model.dart';

class TransactionBiometricWidget extends StatefulWidget {
  const TransactionBiometricWidget({Key? key}) : super(key: key);

  @override
  _TransactionBiometricWidgetState createState() =>
      _TransactionBiometricWidgetState();
}

class _TransactionBiometricWidgetState
    extends State<TransactionBiometricWidget> {
  late TransactionBiometricModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionBiometricModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TransactionBiometric'});
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
        title: 'Transaction Biometric',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 0.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      FFIcons.karrowLeft2,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'TRANSACTION_BIOMETRIC_arrowLeft2_ICN_ON_');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'jh6fit9i' /* Transaction Biometrics */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                )
              : null,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.dWSidebarModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: DWSidebarWidget(
                  selectedSidebarNav: 'Transaction Biometrics',
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    wrapWithModel(
                      model: _model.dWHeaderModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: DWHeaderWidget(
                        pageTitle: 'Transaction Biometrics',
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Container(
                                width: 450.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.titleWithBackButtonModel,
                                      updateCallback: () => setState(() {}),
                                      child: TitleWithBackButtonWidget(
                                        titleName: 'Transaction Biometrics',
                                        actionPara: () async {
                                          logFirebaseEvent(
                                              'TRANSACTION_BIOMETRIC_Container_g7yig092');
                                          logFirebaseEvent(
                                              'TitleWithBackButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                    SwitchListTile.adaptive(
                                      value: _model
                                              .switchListTilePushNotificationValue ??=
                                          true,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                                .switchListTilePushNotificationValue =
                                            newValue!);
                                      },
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          '0e8buzsq' /* Biometrics */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                      subtitle: Text(
                                        FFLocalizations.of(context).getText(
                                          'hmqm3prp' /* Activate FaceID or Biometrics */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                    ),
                                  ].divide(SizedBox(height: 15.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
