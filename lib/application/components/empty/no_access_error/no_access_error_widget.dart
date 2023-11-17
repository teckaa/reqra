import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_access_error_model.dart';
export 'no_access_error_model.dart';

class NoAccessErrorWidget extends StatefulWidget {
  const NoAccessErrorWidget({
    Key? key,
    String? titlePara,
    String? descPara,
  })  : this.titlePara = titlePara ?? 'Access to this page is restricted.',
        this.descPara = descPara ?? 'Back to Dashboard',
        super(key: key);

  final String titlePara;
  final String descPara;

  @override
  _NoAccessErrorWidgetState createState() => _NoAccessErrorWidgetState();
}

class _NoAccessErrorWidgetState extends State<NoAccessErrorWidget> {
  late NoAccessErrorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoAccessErrorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Container(
          width: 600.0,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.titlePara,
                          'You have not make any Post Yet',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.descPara,
                          'Once you\'ve made your post, they\'ll be displayed here for your convenience. Take your time and enjoy browsing our offerings.',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                              lineHeight: 2.0,
                            ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
              wrapWithModel(
                model: _model.primaryRoundedButtonModel,
                updateCallback: () => setState(() {}),
                child: PrimaryRoundedButtonWidget(
                  buttonText: 'Back to Dashboard',
                  buttonBgColor: FlutterFlowTheme.of(context).primary,
                  buttonWidth: 180,
                  buttonHeight: 45,
                  disableStatusPara: false,
                  buttonHoverBGColor: FlutterFlowTheme.of(context).secondary,
                  buttonAction: () async {
                    logFirebaseEvent(
                        'NO_ACCESS_ERROR_Container_knwhm9lm_CALLB');
                    logFirebaseEvent('PrimaryRoundedButton_navigate_to');

                    context.pushNamed('Dashboard');
                  },
                ),
              ),
            ].divide(SizedBox(height: 25.0)),
          ),
        ),
      ),
    );
  }
}
