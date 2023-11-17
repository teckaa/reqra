import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_dropdown_lagos_model.dart';
export 'products_dropdown_lagos_model.dart';

class ProductsDropdownLagosWidget extends StatefulWidget {
  const ProductsDropdownLagosWidget({Key? key}) : super(key: key);

  @override
  _ProductsDropdownLagosWidgetState createState() =>
      _ProductsDropdownLagosWidgetState();
}

class _ProductsDropdownLagosWidgetState
    extends State<ProductsDropdownLagosWidget> with TickerProviderStateMixin {
  late ProductsDropdownLagosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsDropdownLagosModel());

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
      width: 320.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 1.0),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PRODUCTS_DROPDOWN_LAGOS_ListTile-Airtime');
                  logFirebaseEvent('ListTile-Airtime_navigate_to');

                  context.pushNamed('Airtime');
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      '0qwe8iyy' /* Airtime */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).black,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      'tvbv30g7' /* Top up your airtime */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: Color(0xFF454745),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).black,
                  dense: true,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.contextMenu ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PRODUCTS_DROPDOWN_LAGOS_ListTitle-Data_O');
                  logFirebaseEvent('ListTitle-Data_navigate_to');

                  context.pushNamed('DataBundle');
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      '10g7j5nv' /* Data Bundle */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).black,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      'pssxkh1i' /* Purchase data on the go */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: Color(0xFF454745),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              onEnter: ((event) async {
                setState(() => _model.mouseRegionHovered1 = true);
              }),
              onExit: ((event) async {
                setState(() => _model.mouseRegionHovered1 = false);
              }),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.contextMenu ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PRODUCTS_DROPDOWN_LAGOS_ListTitle-Data_O');
                  logFirebaseEvent('ListTitle-Data_navigate_to');

                  context.pushNamed('CableTV');
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'p5kun0gf' /* Cable TV */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).black,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      '8mogn98k' /* Subscribe to your TV show */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: Color(0xFF454745),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              onEnter: ((event) async {
                setState(() => _model.mouseRegionHovered2 = true);
              }),
              onExit: ((event) async {
                setState(() => _model.mouseRegionHovered2 = false);
              }),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.contextMenu ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PRODUCTS_DROPDOWN_LAGOS_ListTitle-Data_O');
                  logFirebaseEvent('ListTitle-Data_navigate_to');

                  context.pushNamed('InternetWifi');
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'p5jix3uq' /* Internet/Wifi */,
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).black,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      'peozz9du' /* Purchase internet access */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: Color(0xFF454745),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              onEnter: ((event) async {
                setState(() => _model.mouseRegionHovered3 = true);
              }),
              onExit: ((event) async {
                setState(() => _model.mouseRegionHovered3 = false);
              }),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.contextMenu ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PRODUCTS_DROPDOWN_LAGOS_ListTitle-Data_O');
                  logFirebaseEvent('ListTitle-Data_navigate_to');

                  context.pushNamed('Electricity');
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'ybedmxjd' /* Electricity */,
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).black,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      '6fqzxlss' /* Pay up your electricity bill */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: Color(0xFF454745),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              onEnter: ((event) async {
                setState(() => _model.mouseRegionHovered4 = true);
              }),
              onExit: ((event) async {
                setState(() => _model.mouseRegionHovered4 = false);
              }),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.contextMenu ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PRODUCTS_DROPDOWN_LAGOS_ListTitle-Data_O');
                  logFirebaseEvent('ListTitle-Data_navigate_to');

                  context.pushNamed('Education');
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'e5rroxat' /* Education */,
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).black,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      '5x0z7qc5' /* Purchase WAEC,NECO pin and mor... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: Color(0xFF454745),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: true,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                ),
              ),
              onEnter: ((event) async {
                setState(() => _model.mouseRegionHovered5 = true);
              }),
              onExit: ((event) async {
                setState(() => _model.mouseRegionHovered5 = false);
              }),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
