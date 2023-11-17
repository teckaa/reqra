import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_drop_down_model.dart';
export 'modal_drop_down_model.dart';

class ModalDropDownWidget extends StatefulWidget {
  const ModalDropDownWidget({Key? key}) : super(key: key);

  @override
  _ModalDropDownWidgetState createState() => _ModalDropDownWidgetState();
}

class _ModalDropDownWidgetState extends State<ModalDropDownWidget>
    with TickerProviderStateMixin {
  late ModalDropDownModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 100.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalDropDownModel());

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
      width: 300.0,
      constraints: BoxConstraints(
        maxWidth: 670.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).lineColor,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MODAL_DROP_DOWN_Container_1xulv2k8_ON_TA');
                      logFirebaseEvent('PhotoGridWithDetails_navigate_to');

                      context.pushNamed('PersonalInformation');
                    },
                    child: wrapWithModel(
                      model: _model.photoGridWithDetailsModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: PhotoGridWithDetailsWidget(
                        photoPathPara: currentUserPhoto,
                        titlePara:
                            '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                        descPara: currentUserEmail,
                        widthPara: 40,
                        heightPara: 40,
                      ),
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'ysbobla6' /* Profile and Preferences */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleLargeFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleLargeFamily),
                      ),
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MODAL_DROP_DOWN_MenuItem-EditProfile_ON_');
                    logFirebaseEvent('MenuItem-EditProfile_navigate_to');

                    context.pushNamed('PersonalInformation');
                  },
                  child: wrapWithModel(
                    model: _model.menuItemEditProfileModel,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      itemName: 'Edit Profile',
                      itemBorderColor: FlutterFlowTheme.of(context).lineColor,
                      itemWidth: 200,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MODAL_DROP_DOWN_MenuItem-Password_ON_TAP');
                    logFirebaseEvent('MenuItem-Password_navigate_to');

                    context.pushNamed('ChangePassword');
                  },
                  child: wrapWithModel(
                    model: _model.menuItemPasswordModel,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      itemName: 'Reset Password',
                      itemWidth: 200,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MODAL_DROP_DOWN_MenuItem-Notifications_O');
                    logFirebaseEvent('MenuItem-Notifications_navigate_to');

                    context.pushNamed('Notifications');
                  },
                  child: wrapWithModel(
                    model: _model.menuItemNotificationsModel,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      itemName: 'Notifications',
                      itemWidth: 200,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MODAL_DROP_DOWN_MenuItem-Languages_ON_TA');
                    logFirebaseEvent('MenuItem-Languages_navigate_to');

                    context.pushNamed('Language');
                  },
                  child: wrapWithModel(
                    model: _model.menuItemLanguagesModel,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      itemName: 'Languages',
                      itemWidth: 200,
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ti8ttiey' /* Get in Touch */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w300,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('MODAL_DROP_DOWN_MenuItem-Help_ON_TAP');
                    logFirebaseEvent('MenuItem-Help_navigate_to');

                    context.pushNamed('HelpCenter');
                  },
                  child: wrapWithModel(
                    model: _model.menuItemHelpModel,
                    updateCallback: () => setState(() {}),
                    child: MenuItemWidget(
                      itemName: 'Help & Support',
                      itemWidth: 200,
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (Theme.of(context).brightness == Brightness.dark)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MODAL_DROP_DOWN_COMP_Icon-Dark_ON_TAP');
                          logFirebaseEvent('Icon-Dark_set_dark_mode_settings');
                          setDarkModeSetting(context, ThemeMode.light);
                        },
                        child: Icon(
                          FFIcons.kmoon,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 18.0,
                        ),
                      ),
                    if (Theme.of(context).brightness == Brightness.light)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MODAL_DROP_DOWN_COMP_Icon-Light_ON_TAP');
                          logFirebaseEvent('Icon-Light_set_dark_mode_settings');
                          setDarkModeSetting(context, ThemeMode.dark);
                        },
                        child: Icon(
                          FFIcons.ksun1,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 18.0,
                        ),
                      ),
                  ],
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('MODAL_DROP_DOWN_Text_uizjcfm9_ON_TAP');
                    logFirebaseEvent('Text_auth');
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('Home', context.mounted);
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'jbcy3e80' /* Sign Out */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
