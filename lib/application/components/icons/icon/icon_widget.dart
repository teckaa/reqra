import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_model.dart';
export 'icon_model.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    Key? key,
    this.iconPara,
    String? iconTooltipPara,
    this.iconActionPara,
  })  : this.iconTooltipPara = iconTooltipPara ?? '',
        super(key: key);

  final Widget? iconPara;
  final String iconTooltipPara;
  final Future<dynamic> Function()? iconActionPara;

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  late IconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconModel());

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

    return AlignedTooltip(
      content: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: Text(
            widget.iconTooltipPara,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w300,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyLargeFamily),
                ),
          )),
      offset: 4.0,
      preferredDirection: AxisDirection.left,
      borderRadius: BorderRadius.circular(5.0),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 3.0,
      tailBaseWidth: 24.0,
      tailLength: 12.0,
      waitDuration: Duration(milliseconds: 100),
      showDuration: Duration(milliseconds: 1500),
      triggerMode: TooltipTriggerMode.tap,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('ICON_COMP_Icon_ezx6ov6j_ON_TAP');
          logFirebaseEvent('Icon_execute_callback');
          await widget.iconActionPara?.call();
        },
        child: widget.iconPara!,
      ),
    );
  }
}
