import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/menus/menu_service_box/menu_service_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_services_model.dart';
export 'list_of_services_model.dart';

class ListOfServicesWidget extends StatefulWidget {
  const ListOfServicesWidget({Key? key}) : super(key: key);

  @override
  _ListOfServicesWidgetState createState() => _ListOfServicesWidgetState();
}

class _ListOfServicesWidgetState extends State<ListOfServicesWidget> {
  late ListOfServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfServicesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListOfServices'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Pay bills',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 0.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'LIST_OF_SERVICES_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'm3uwt71i' /* Services */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.dWSidebarModel,
                    updateCallback: () => setState(() {}),
                    child: DWSidebarWidget(
                      selectedSidebarNav: 'Pay Bills',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.dWHeaderModel,
                          updateCallback: () => setState(() {}),
                          child: DWHeaderWidget(
                            pageTitle: 'Services',
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: Container(
                                    width: 400.0,
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width *
                                              1.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9wdf9v4n' /* Services */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tdcqlbfi' /* Discover our selection of serv... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_OF_SERVICES_MenuServiceBox-Airtime_');
                                                logFirebaseEvent(
                                                    'MenuServiceBox-Airtime_navigate_to');

                                                context
                                                    .pushNamed('CreateAirtime');
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .menuServiceBoxAirtimeModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: MenuServiceBoxWidget(
                                                  iconPara: Icon(
                                                    FFIcons.kcall,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  textPara: 'Airtime / Top Up',
                                                  iconBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .infoSoft,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_OF_SERVICES_MenuServiceBox-Data_ON_');
                                                logFirebaseEvent(
                                                    'MenuServiceBox-Data_navigate_to');

                                                context.pushNamed(
                                                    'CreateDataBundle');
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .menuServiceBoxDataModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: MenuServiceBoxWidget(
                                                  iconPara: Icon(
                                                    FFIcons.kwifi,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  textPara: 'Data Bundle',
                                                  iconBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .infoSoft,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_OF_SERVICES_MenuServiceBox-CableTV_');
                                                logFirebaseEvent(
                                                    'MenuServiceBox-CableTV_navigate_to');

                                                context
                                                    .pushNamed('CreateCableTV');
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .menuServiceBoxCableTVModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: MenuServiceBoxWidget(
                                                  iconPara: Icon(
                                                    FFIcons.kmonitor,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  textPara: 'Cable TV',
                                                  iconBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .infoSoft,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_OF_SERVICES_MenuServiceBox-Internet');
                                                logFirebaseEvent(
                                                    'MenuServiceBox-Internet_navigate_to');

                                                context.pushNamed(
                                                    'CreateInternetWifi');
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .menuServiceBoxInternetModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: MenuServiceBoxWidget(
                                                  iconPara: Icon(
                                                    FFIcons.kglobal,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  textPara: 'Internet/Wifi',
                                                  iconBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .infoSoft,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_OF_SERVICES_MenuServiceBox-Eletrici');
                                                logFirebaseEvent(
                                                    'MenuServiceBox-Eletricity_navigate_to');

                                                context.pushNamed(
                                                    'CreateEletricityBill');
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .menuServiceBoxEletricityModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: MenuServiceBoxWidget(
                                                  iconPara: Icon(
                                                    FFIcons.kelectricity,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  textPara: 'Electricity',
                                                  iconBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .infoSoft,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_OF_SERVICES_MenuServiceBox-Transpor');
                                                logFirebaseEvent(
                                                    'MenuServiceBox-Transport_navigate_to');

                                                context.pushNamed(
                                                    'CreateTransport');
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .menuServiceBoxTransportModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: MenuServiceBoxWidget(
                                                  iconPara: Icon(
                                                    FFIcons.kcar,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  textPara: 'Transport',
                                                  iconBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .infoSoft,
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ].divide(SizedBox(height: 20.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
