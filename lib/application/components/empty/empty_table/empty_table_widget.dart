import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_table_model.dart';
export 'empty_table_model.dart';

class EmptyTableWidget extends StatefulWidget {
  const EmptyTableWidget({
    Key? key,
    String? titlePara,
    String? descPara,
    String? buttonTextPara,
    this.buttonActionPara,
  })  : this.titlePara = titlePara ?? 'You have not make any Post Yet',
        this.descPara = descPara ??
            'Once you\'ve made your orders, they\'ll be displayed here for your convenience. Take your time and enjoy browsing our offerings.',
        this.buttonTextPara = buttonTextPara ?? 'Get Started',
        super(key: key);

  final String titlePara;
  final String descPara;
  final String buttonTextPara;
  final Future<dynamic> Function()? buttonActionPara;

  @override
  _EmptyTableWidgetState createState() => _EmptyTableWidgetState();
}

class _EmptyTableWidgetState extends State<EmptyTableWidget> {
  late EmptyTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyTableModel());

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
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 600.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                                lineHeight: 2.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                    wrapWithModel(
                      model: _model.primaryButtonModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: PrimaryButtonWidget(
                        buttonText: widget.buttonTextPara,
                        buttonWidth: 150,
                        buttonHeight: 40,
                        disableStatusPara: false,
                        buttonHoverBGColor:
                            FlutterFlowTheme.of(context).secondary,
                        buttonHoverColor: FlutterFlowTheme.of(context).white,
                        buttonAction: () async {
                          logFirebaseEvent(
                              'EMPTY_TABLE_Container_oxqslpbp_CALLBACK');
                          logFirebaseEvent('PrimaryButton_execute_callback');
                          await widget.buttonActionPara?.call();
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 25.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
