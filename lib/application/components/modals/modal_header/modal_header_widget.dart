import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_header_model.dart';
export 'modal_header_model.dart';

class ModalHeaderWidget extends StatefulWidget {
  const ModalHeaderWidget({
    Key? key,
    String? headerTitlePara,
    this.headerTitleTextSizePara,
    this.headerTitleTextColorPara,
    this.headerActionPara,
  })  : this.headerTitlePara = headerTitlePara ?? 'Title here',
        super(key: key);

  final String headerTitlePara;
  final int? headerTitleTextSizePara;
  final Color? headerTitleTextColorPara;
  final Future<dynamic> Function()? headerActionPara;

  @override
  _ModalHeaderWidgetState createState() => _ModalHeaderWidgetState();
}

class _ModalHeaderWidgetState extends State<ModalHeaderWidget> {
  late ModalHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalHeaderModel());

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
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.headerTitlePara,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        color: widget.headerTitleTextColorPara,
                        fontSize: widget.headerTitleTextSizePara?.toDouble(),
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('MODAL_HEADER_COMP_Icon_o4x98d66_ON_TAP');
                    logFirebaseEvent('Icon_execute_callback');
                    await widget.headerActionPara?.call();
                  },
                  child: Icon(
                    FFIcons.kcloseSquare,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 22.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 5.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
        ],
      ),
    );
  }
}
