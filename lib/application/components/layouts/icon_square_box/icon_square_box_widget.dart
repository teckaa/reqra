import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_square_box_model.dart';
export 'icon_square_box_model.dart';

class IconSquareBoxWidget extends StatefulWidget {
  const IconSquareBoxWidget({
    Key? key,
    this.iconPara,
    this.textPara,
    Color? iconBgColor,
    int? boxSize,
    Color? iconBorderColor,
    Color? boxBordercolor,
    Color? boxBgColor,
    int? textSize,
    Color? textColor,
  })  : this.iconBgColor = iconBgColor ?? Colors.black,
        this.boxSize = boxSize ?? 100,
        this.iconBorderColor = iconBorderColor ?? const Color(0xFF0E6FFB),
        this.boxBordercolor = boxBordercolor ?? const Color(0xFF0E6FFB),
        this.boxBgColor = boxBgColor ?? const Color(0xFFE4E7EA),
        this.textSize = textSize ?? 14,
        this.textColor = textColor ?? const Color(0xFF2C2E34),
        super(key: key);

  final Widget? iconPara;
  final String? textPara;
  final Color iconBgColor;
  final int boxSize;
  final Color iconBorderColor;
  final Color boxBordercolor;
  final Color boxBgColor;
  final int textSize;
  final Color textColor;

  @override
  _IconSquareBoxWidgetState createState() => _IconSquareBoxWidgetState();
}

class _IconSquareBoxWidgetState extends State<IconSquareBoxWidget> {
  late IconSquareBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconSquareBoxModel());

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

    return Container(
      width: widget.boxSize.toDouble(),
      height: widget.boxSize.toDouble(),
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.boxBgColor,
          FlutterFlowTheme.of(context).primaryBackground,
        ),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget.boxBordercolor,
            FlutterFlowTheme.of(context).lineColor,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 38.0,
              height: 38.0,
              decoration: BoxDecoration(
                color: widget.iconBgColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.iconBorderColor,
                  width: 1.0,
                ),
              ),
              child: widget.iconPara!,
            ),
            Text(
              widget.textPara!,
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                    color: widget.textColor,
                    fontSize: widget.textSize.toDouble(),
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelSmallFamily),
                  ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
