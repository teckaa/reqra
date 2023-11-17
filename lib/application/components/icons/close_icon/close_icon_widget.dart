import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'close_icon_model.dart';
export 'close_icon_model.dart';

class CloseIconWidget extends StatefulWidget {
  const CloseIconWidget({
    Key? key,
    this.closeIcon,
  }) : super(key: key);

  final Widget? closeIcon;

  @override
  _CloseIconWidgetState createState() => _CloseIconWidgetState();
}

class _CloseIconWidgetState extends State<CloseIconWidget> {
  late CloseIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CloseIconModel());

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
            FFLocalizations.of(context).getText(
              'nvwrlh1m' /* Close */,
            ),
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
          logFirebaseEvent('CLOSE_ICON_COMP_Icon_4uqmos07_ON_TAP');
          logFirebaseEvent('Icon_bottom_sheet');
          Navigator.pop(context);
        },
        child: widget.closeIcon!,
      ),
    );
  }
}
