import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_item_with_drop_icon_model.dart';
export 'menu_item_with_drop_icon_model.dart';

class MenuItemWithDropIconWidget extends StatefulWidget {
  const MenuItemWithDropIconWidget({
    Key? key,
    this.itemName,
    Color? itemBorderColor,
    this.itemBgColor,
    this.itemTextColor,
    int? itemWidth,
    int? itemTextSize,
    this.itemDropArrowIcon,
  })  : this.itemBorderColor = itemBorderColor ?? const Color(0xFF0E6FFB),
        this.itemWidth = itemWidth ?? 100,
        this.itemTextSize = itemTextSize ?? 13,
        super(key: key);

  final String? itemName;
  final Color itemBorderColor;
  final Color? itemBgColor;
  final Color? itemTextColor;
  final int itemWidth;
  final int itemTextSize;
  final Widget? itemDropArrowIcon;

  @override
  _MenuItemWithDropIconWidgetState createState() =>
      _MenuItemWithDropIconWidgetState();
}

class _MenuItemWithDropIconWidgetState
    extends State<MenuItemWithDropIconWidget> {
  late MenuItemWithDropIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuItemWithDropIconModel());

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
      width: widget.itemWidth.toDouble(),
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.itemBgColor,
          FlutterFlowTheme.of(context).secondaryBackground,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Text(
                  widget.itemName!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: valueOrDefault<Color>(
                          widget.itemTextColor,
                          FlutterFlowTheme.of(context).primaryText,
                        ),
                        fontSize: valueOrDefault<double>(
                          widget.itemTextSize.toDouble(),
                          13.0,
                        ),
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                child: widget.itemDropArrowIcon!,
              ),
            ],
          ),
          Divider(
            thickness: 3.0,
            color: widget.itemBorderColor,
          ),
        ],
      ),
    );
  }
}
