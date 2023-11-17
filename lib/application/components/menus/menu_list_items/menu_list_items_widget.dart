import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_list_items_model.dart';
export 'menu_list_items_model.dart';

class MenuListItemsWidget extends StatefulWidget {
  const MenuListItemsWidget({
    Key? key,
    this.menuTitle,
    this.itemName,
    this.itemIcon,
    this.itemBgColor,
    this.itemTextColor,
  }) : super(key: key);

  final String? menuTitle;
  final String? itemName;
  final Widget? itemIcon;
  final Color? itemBgColor;
  final Color? itemTextColor;

  @override
  _MenuListItemsWidgetState createState() => _MenuListItemsWidgetState();
}

class _MenuListItemsWidgetState extends State<MenuListItemsWidget> {
  late MenuListItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuListItemsModel());

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
      height: 45.0,
      decoration: BoxDecoration(
        color: widget.itemBgColor,
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).lineColor,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.itemIcon!,
          Text(
            widget.itemName!,
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                  color: widget.itemTextColor,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelSmallFamily),
                ),
          ),
        ].divide(SizedBox(width: 15.0)).around(SizedBox(width: 15.0)),
      ),
    );
  }
}
