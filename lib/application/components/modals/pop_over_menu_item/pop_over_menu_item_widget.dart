import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_over_menu_item_model.dart';
export 'pop_over_menu_item_model.dart';

class PopOverMenuItemWidget extends StatefulWidget {
  const PopOverMenuItemWidget({
    Key? key,
    this.itemName,
    this.itemIcon,
    this.itemLeftBorderColor,
    this.itemBgColor,
    this.itemTextColor,
    this.itemTextSize,
  }) : super(key: key);

  final String? itemName;
  final Widget? itemIcon;
  final Color? itemLeftBorderColor;
  final Color? itemBgColor;
  final Color? itemTextColor;
  final int? itemTextSize;

  @override
  _PopOverMenuItemWidgetState createState() => _PopOverMenuItemWidgetState();
}

class _PopOverMenuItemWidgetState extends State<PopOverMenuItemWidget> {
  late PopOverMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopOverMenuItemModel());

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
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.itemBgColor,
          Color(0x00F1F4F8),
        ),
        borderRadius: BorderRadius.circular(0.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            widget.itemIcon!,
            Text(
              widget.itemName!,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                    fontSize: widget.itemTextSize?.toDouble(),
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodySmallFamily),
                  ),
            ),
          ].divide(SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
