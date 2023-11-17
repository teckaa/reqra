import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_item_model.dart';
export 'menu_item_model.dart';

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget({
    Key? key,
    this.itemName,
    this.itemBorderColor,
    this.itemBgColor,
    this.itemTextColor,
    int? itemWidth,
    int? itemTextSize,
  })  : this.itemWidth = itemWidth ?? 100,
        this.itemTextSize = itemTextSize ?? 13,
        super(key: key);

  final String? itemName;
  final Color? itemBorderColor;
  final Color? itemBgColor;
  final Color? itemTextColor;
  final int itemWidth;
  final int itemTextSize;

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  late MenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuItemModel());

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
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.itemName!,
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                  color: valueOrDefault<Color>(
                    widget.itemTextColor,
                    FlutterFlowTheme.of(context).primaryText,
                  ),
                  fontSize: widget.itemTextSize.toDouble(),
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelSmallFamily),
                ),
          ),
        ],
      ),
    );
  }
}
