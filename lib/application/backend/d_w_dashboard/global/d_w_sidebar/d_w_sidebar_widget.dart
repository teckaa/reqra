import '/application/backend/d_w_dashboard/global/sidebar_comp/sidebar_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'd_w_sidebar_model.dart';
export 'd_w_sidebar_model.dart';

class DWSidebarWidget extends StatefulWidget {
  const DWSidebarWidget({
    Key? key,
    this.menuType,
    this.selectedSidebarNav,
  }) : super(key: key);

  final String? menuType;
  final String? selectedSidebarNav;

  @override
  _DWSidebarWidgetState createState() => _DWSidebarWidgetState();
}

class _DWSidebarWidgetState extends State<DWSidebarWidget> {
  late DWSidebarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DWSidebarModel());

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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
        tabletLandscape: false,
      ),
      child: Container(
        width: 320.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
          child: wrapWithModel(
            model: _model.sidebarCompModel,
            updateCallback: () => setState(() {}),
            updateOnChange: true,
            child: SidebarCompWidget(
              selectedSidebarNav: widget.selectedSidebarNav,
            ),
          ),
        ),
      ),
    );
  }
}
