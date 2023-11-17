import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'title_with_back_button_model.dart';
export 'title_with_back_button_model.dart';

class TitleWithBackButtonWidget extends StatefulWidget {
  const TitleWithBackButtonWidget({
    Key? key,
    String? titleName,
    this.actionPara,
    this.titleSize,
  })  : this.titleName = titleName ?? 'Title here',
        super(key: key);

  final String titleName;
  final Future<dynamic> Function()? actionPara;
  final int? titleSize;

  @override
  _TitleWithBackButtonWidgetState createState() =>
      _TitleWithBackButtonWidgetState();
}

class _TitleWithBackButtonWidgetState extends State<TitleWithBackButtonWidget> {
  late TitleWithBackButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TitleWithBackButtonModel());

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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('TITLE_WITH_BACK_BUTTON_Icon_zfoe3jd8_ON_');
                  logFirebaseEvent('Icon_execute_callback');
                  await widget.actionPara?.call();
                },
                child: Icon(
                  FFIcons.karrowLeft2,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.titleName,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: widget.titleSize?.toDouble(),
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
