import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notifications'});
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
        title: 'Notifications',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
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
                          'NOTIFICATIONS_PAGE_arrowLeft2_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'wo5d2798' /* Notifications */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                )
              : null,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.dWSidebarModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: DWSidebarWidget(
                  selectedSidebarNav: 'Notifications',
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
                        pageTitle: 'Notifications',
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
                                width: 450.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.titleWithBackButtonModel,
                                      updateCallback: () => setState(() {}),
                                      child: TitleWithBackButtonWidget(
                                        titleName: 'Notifications',
                                        actionPara: () async {
                                          logFirebaseEvent(
                                              'NOTIFICATIONS_Container_qoonc92j_CALLBAC');
                                          logFirebaseEvent(
                                              'TitleWithBackButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'mv3aw5oa' /* Choose what notifcations you w... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            fontSize: 13.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                    SwitchListTile.adaptive(
                                      value: _model
                                              .switchListTilePushNotificationValue ??=
                                          true,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                                .switchListTilePushNotificationValue =
                                            newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'NOTIFICATIONS_SwitchListTile-PushNotific');
                                          logFirebaseEvent(
                                              'SwitchListTile-PushNotification_backend_');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            pushNotification: true,
                                          ));
                                          logFirebaseEvent(
                                              'SwitchListTile-PushNotification_action_b');
                                          await action_blocks.alertSuccess(
                                            context,
                                            descPara: 'Saved successfully',
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'NOTIFICATIONS_SwitchListTile-PushNotific');
                                          logFirebaseEvent(
                                              'SwitchListTile-PushNotification_backend_');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            pushNotification: false,
                                          ));
                                          logFirebaseEvent(
                                              'SwitchListTile-PushNotification_action_b');
                                          await action_blocks.alertSuccess(
                                            context,
                                            descPara: 'Saved successfully',
                                          );
                                        }
                                      },
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          'majiite8' /* Push Notifications */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                      subtitle: Text(
                                        FFLocalizations.of(context).getText(
                                          'tgyc4n2d' /* Turn on or off push notificati... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                    ),
                                    SwitchListTile.adaptive(
                                      value: _model
                                              .switchListTileEmailNotificationValue ??=
                                          true,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                                .switchListTileEmailNotificationValue =
                                            newValue!);
                                        if (newValue!) {
                                          logFirebaseEvent(
                                              'NOTIFICATIONS_SwitchListTile-EmailNotifi');
                                          logFirebaseEvent(
                                              'SwitchListTile-EmailNotification_backend');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            emailNotification: true,
                                          ));
                                          logFirebaseEvent(
                                              'SwitchListTile-EmailNotification_action_');
                                          await action_blocks.alertSuccess(
                                            context,
                                            descPara: 'Saved successfully',
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'NOTIFICATIONS_SwitchListTile-EmailNotifi');
                                          logFirebaseEvent(
                                              'SwitchListTile-EmailNotification_backend');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            emailNotification: false,
                                          ));
                                          logFirebaseEvent(
                                              'SwitchListTile-EmailNotification_action_');
                                          await action_blocks.alertSuccess(
                                            context,
                                            descPara: 'Saved successfully',
                                          );
                                        }
                                      },
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          '7tp6c5u2' /* Email Notifications */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                      subtitle: Text(
                                        FFLocalizations.of(context).getText(
                                          'ypkitn3k' /* Turn on or off emal notificati... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontSize: 12.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                    ),
                                  ].divide(SizedBox(height: 15.0)),
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
        ));
  }
}
