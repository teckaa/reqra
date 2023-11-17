import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'copy_icon_model.dart';
export 'copy_icon_model.dart';

class CopyIconWidget extends StatefulWidget {
  const CopyIconWidget({
    Key? key,
    this.copiedMessage,
  }) : super(key: key);

  final String? copiedMessage;

  @override
  _CopyIconWidgetState createState() => _CopyIconWidgetState();
}

class _CopyIconWidgetState extends State<CopyIconWidget> {
  late CopyIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CopyIconModel());

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
              'l14hmsvg' /* Copy */,
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
          logFirebaseEvent('COPY_ICON_COMP_Icon_lmfc4rbk_ON_TAP');
          logFirebaseEvent('Icon_action_block');
          await action_blocks.copiedAction(
            context,
            message: widget.copiedMessage,
          );
        },
        child: Icon(
          FFIcons.kcopy,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 14.0,
        ),
      ),
    );
  }
}
