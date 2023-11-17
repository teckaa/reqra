import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sidebar_menu_item_model.dart';
export 'sidebar_menu_item_model.dart';

class SidebarMenuItemWidget extends StatefulWidget {
  const SidebarMenuItemWidget({
    Key? key,
    this.itemName,
    this.itemIcon,
    this.itemBorderColor,
    this.itemBgColor,
    Color? itemTextColor,
  })  : this.itemTextColor = itemTextColor ?? Colors.black,
        super(key: key);

  final String? itemName;
  final Widget? itemIcon;
  final Color? itemBorderColor;
  final Color? itemBgColor;
  final Color itemTextColor;

  @override
  _SidebarMenuItemWidgetState createState() => _SidebarMenuItemWidgetState();
}

class _SidebarMenuItemWidgetState extends State<SidebarMenuItemWidget> {
  late SidebarMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SidebarMenuItemModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: Container(
        width: double.infinity,
        height: valueOrDefault<double>(
          () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 60.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 60.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 40.0;
            } else {
              return 40.0;
            }
          }(),
          40.0,
        ),
        decoration: BoxDecoration(
          color: widget.itemBgColor,
          borderRadius: BorderRadius.circular(8.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            widget.itemIcon!,
            Text(
              widget.itemName!,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodySmallFamily),
                  ),
            ),
          ].divide(SizedBox(width: 15.0)).around(SizedBox(width: 15.0)),
        ),
      ),
    );
  }
}
