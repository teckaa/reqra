import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_service_box_model.dart';
export 'menu_service_box_model.dart';

class MenuServiceBoxWidget extends StatefulWidget {
  const MenuServiceBoxWidget({
    Key? key,
    this.iconPara,
    this.textPara,
    Color? iconBgColor,
    int? boxSize,
  })  : this.iconBgColor = iconBgColor ?? Colors.black,
        this.boxSize = boxSize ?? 100,
        super(key: key);

  final Widget? iconPara;
  final String? textPara;
  final Color iconBgColor;
  final int boxSize;

  @override
  _MenuServiceBoxWidgetState createState() => _MenuServiceBoxWidgetState();
}

class _MenuServiceBoxWidgetState extends State<MenuServiceBoxWidget> {
  late MenuServiceBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuServiceBoxModel());

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
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 38.0,
                  height: 38.0,
                  decoration: BoxDecoration(
                    color: widget.iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: widget.iconPara!,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.textPara!,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelSmallFamily),
                        ),
                  ),
                ),
              ],
            ),
            Icon(
              FFIcons.karrowRight3,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
