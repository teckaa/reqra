import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'circle_menu_item_model.dart';
export 'circle_menu_item_model.dart';

class CircleMenuItemWidget extends StatefulWidget {
  const CircleMenuItemWidget({
    Key? key,
    String? itemName,
    this.itemBgColor,
    this.itemTextColor,
    int? itemSizePara,
  })  : this.itemName = itemName ?? 'Menu',
        this.itemSizePara = itemSizePara ?? 12,
        super(key: key);

  final String itemName;
  final Color? itemBgColor;
  final Color? itemTextColor;
  final int itemSizePara;

  @override
  _CircleMenuItemWidgetState createState() => _CircleMenuItemWidgetState();
}

class _CircleMenuItemWidgetState extends State<CircleMenuItemWidget> {
  late CircleMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CircleMenuItemModel());

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
      decoration: BoxDecoration(
        color: widget.itemBgColor,
        borderRadius: BorderRadius.circular(20.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Text(
          widget.itemName,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: valueOrDefault<Color>(
                  widget.itemTextColor,
                  FlutterFlowTheme.of(context).primaryText,
                ),
                fontSize: widget.itemSizePara.toDouble(),
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
      ),
    );
  }
}
