import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/application/components/menus/sidebar_menu_item/sidebar_menu_item_widget.dart';
import '/application/components/shimmers/shimmer_two_line/shimmer_two_line_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sidebar_comp_model.dart';
export 'sidebar_comp_model.dart';

class SidebarCompWidget extends StatefulWidget {
  const SidebarCompWidget({
    Key? key,
    String? selectedSidebarNav,
  })  : this.selectedSidebarNav = selectedSidebarNav ?? '',
        super(key: key);

  final String selectedSidebarNav;

  @override
  _SidebarCompWidgetState createState() => _SidebarCompWidgetState();
}

class _SidebarCompWidgetState extends State<SidebarCompWidget> {
  late SidebarCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SidebarCompModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SIDEBAR_Container_sei7d4on_ON_TAP');
                logFirebaseEvent('AppRectangleLogo_navigate_to');

                context.pushNamed('Dashboard');

                logFirebaseEvent('AppRectangleLogo_update_app_state');
                setState(() {
                  FFAppState().menuType = '';
                });
              },
              child: wrapWithModel(
                model: _model.appRectangleLogoModel,
                updateCallback: () => setState(() {}),
                child: AppRectangleLogoWidget(),
              ),
            ),
          ),
        if (responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SIDEBAR_Container_3aoiimkz_ON_TAP');
                  logFirebaseEvent('PhotoGridWithDetails_navigate_to');

                  context.pushNamed('Profile');
                },
                child: wrapWithModel(
                  model: _model.photoGridWithDetailsModel1,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: PhotoGridWithDetailsWidget(
                    photoPathPara: currentUserPhoto,
                    titlePara:
                        '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                    descPara: currentUserEmail,
                    widthPara: 60,
                    heightPara: 60,
                    titleSizePara: 15,
                    descSizePara: 14,
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    if (FFAppState().menuType == 'Profile') {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
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
                                        'SIDEBAR_COMP_COMP_Row_atkaya2v_ON_TAP');
                                    logFirebaseEvent('Row_update_app_state');
                                    setState(() {
                                      FFAppState().menuType = '';
                                    });
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed('Dashboard');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        FFIcons.karrowLeft2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'pcyeycqv' /* Main Menu */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '05a9vklv' /* Profile */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SIDEBAR_SidebarMenuItem-BasicInfo_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-BasicInfo_navigate_to');

                              context.pushNamed('PersonalInformation');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemBasicInfoModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Personal Information',
                                itemIcon: Icon(
                                  FFIcons.kuserEdit,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'Personal Information'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-Address_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Address_navigate_to');

                              context.pushNamed('EditAddress');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemAddressModel1,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Address',
                                itemIcon: Icon(
                                  FFIcons.klocation,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Address'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-KYC_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-KYC_navigate_to');

                              context.pushNamed('KYC-BVN');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemKYCModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'KYC (Know your customers)',
                                itemIcon: Icon(
                                  FFIcons.kverify,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'KYC (Know your customers)'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-Security_ON_TAP');
                              if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall
                                  ? true
                                  : true) {
                                logFirebaseEvent(
                                    'SidebarMenuItem-Security_update_app_stat');
                                setState(() {
                                  FFAppState().menuType = 'Security';
                                });
                                logFirebaseEvent(
                                    'SidebarMenuItem-Security_navigate_to');

                                context.pushNamed('ChangePassword');

                                return;
                              } else {
                                logFirebaseEvent(
                                    'SidebarMenuItem-Security_navigate_to');

                                context.pushNamed('Security');

                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemSecurityModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Security',
                                itemIcon: Icon(
                                  FFIcons.ksecurity,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Security'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-TransactionSecur');
                              if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall
                                  ? true
                                  : true) {
                                logFirebaseEvent(
                                    'SidebarMenuItem-TransactionSecurity_upda');
                                setState(() {
                                  FFAppState().menuType =
                                      'Transaction Security';
                                });
                                return;
                              } else {
                                logFirebaseEvent(
                                    'SidebarMenuItem-TransactionSecurity_navi');

                                context.pushNamed('TransactionSecurity');

                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model
                                  .sidebarMenuItemTransactionSecurityModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Transaction Security',
                                itemIcon: Icon(
                                  FFIcons.ksecuritySafe,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Security'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.sidebarMenuItemUserReferralModel,
                            updateCallback: () => setState(() {}),
                            child: SidebarMenuItemWidget(
                              itemName: 'Refer a Friend',
                              itemIcon: Icon(
                                FFIcons.kuserAdd,
                                size: 20.0,
                              ),
                              itemBgColor:
                                  widget.selectedSidebarNav == 'Refer a Friend'
                                      ? FlutterFlowTheme.of(context).accent3
                                      : Color(0x00000000),
                            ),
                          ),
                        ],
                      );
                    } else if (FFAppState().menuType == 'Settings') {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
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
                                        'SIDEBAR_COMP_COMP_Row_95d7t7wu_ON_TAP');
                                    logFirebaseEvent('Row_update_app_state');
                                    setState(() {
                                      FFAppState().menuType = '';
                                    });
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed('Dashboard');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        FFIcons.karrowLeft2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'dqu0v9a7' /* Main Menu */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '33cxslc9' /* Settings */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                          Column(
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
                                      'SIDEBAR_SidebarMenuItem-Notifications_ON');
                                  logFirebaseEvent(
                                      'SidebarMenuItem-Notifications_navigate_t');

                                  context.pushNamed('Notifications');
                                },
                                child: wrapWithModel(
                                  model:
                                      _model.sidebarMenuItemNotificationsModel,
                                  updateCallback: () => setState(() {}),
                                  child: SidebarMenuItemWidget(
                                    itemName: 'Notifications',
                                    itemIcon: Icon(
                                      FFIcons.knotification,
                                      size: 20.0,
                                    ),
                                    itemBgColor: widget.selectedSidebarNav ==
                                            'Notifications'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                      'SIDEBAR_SidebarMenuItem-Language_ON_TAP');
                                  logFirebaseEvent(
                                      'SidebarMenuItem-Language_navigate_to');

                                  context.pushNamed('Language');
                                },
                                child: wrapWithModel(
                                  model: _model.sidebarMenuItemLanguageModel,
                                  updateCallback: () => setState(() {}),
                                  child: SidebarMenuItemWidget(
                                    itemName: 'Language',
                                    itemIcon: Icon(
                                      FFIcons.klanguageSquare,
                                      size: 20.0,
                                    ),
                                    itemBgColor: widget.selectedSidebarNav ==
                                            'Language'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                      'SIDEBAR_SidebarMenuItem-Appearance_ON_TA');
                                  logFirebaseEvent(
                                      'SidebarMenuItem-Appearance_navigate_to');

                                  context.pushNamed('Appearance');
                                },
                                child: wrapWithModel(
                                  model: _model.sidebarMenuItemAppearanceModel,
                                  updateCallback: () => setState(() {}),
                                  child: SidebarMenuItemWidget(
                                    itemName: 'Appearance',
                                    itemIcon: Icon(
                                      FFIcons.klevel,
                                      size: 20.0,
                                    ),
                                    itemBgColor: widget.selectedSidebarNav ==
                                            'Appearance'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                      'SIDEBAR_SidebarMenuItem-Message_ON_TAP');
                                  logFirebaseEvent(
                                      'SidebarMenuItem-Message_navigate_to');

                                  context.pushNamed('ListOfChats');
                                },
                                child: wrapWithModel(
                                  model: _model.sidebarMenuItemMessageModel,
                                  updateCallback: () => setState(() {}),
                                  child: SidebarMenuItemWidget(
                                    itemName: 'Messages',
                                    itemIcon: Icon(
                                      FFIcons.kmessages3,
                                      size: 20.0,
                                    ),
                                    itemBgColor: widget.selectedSidebarNav ==
                                            'Messages'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                      'SIDEBAR_SidebarMenuItem-HelpSupport_ON_T');
                                  logFirebaseEvent(
                                      'SidebarMenuItem-HelpSupport_navigate_to');

                                  context.pushNamed('HelpCenter');
                                },
                                child: wrapWithModel(
                                  model: _model.sidebarMenuItemHelpSupportModel,
                                  updateCallback: () => setState(() {}),
                                  child: SidebarMenuItemWidget(
                                    itemName: 'Help & Support',
                                    itemIcon: Icon(
                                      FFIcons.ksupport,
                                      size: 20.0,
                                    ),
                                    itemBgColor: widget.selectedSidebarNav ==
                                            'Help & Support'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                      'SIDEBAR_SidebarMenuItem-DeleteAccount_ON');
                                  logFirebaseEvent(
                                      'SidebarMenuItem-DeleteAccount_navigate_t');

                                  context.pushNamed('DeleteAccount');
                                },
                                child: wrapWithModel(
                                  model:
                                      _model.sidebarMenuItemDeleteAccountModel,
                                  updateCallback: () => setState(() {}),
                                  child: SidebarMenuItemWidget(
                                    itemName: 'Delete Account',
                                    itemIcon: Icon(
                                      FFIcons.ktrash,
                                      size: 20.0,
                                    ),
                                    itemBgColor: widget.selectedSidebarNav ==
                                            'Delete Account'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                      'SIDEBAR_SidebarMenuItem-SignOut_ON_TAP');
                                  logFirebaseEvent(
                                      'SidebarMenuItem-SignOut_auth');
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth('Home', context.mounted);
                                },
                                child: wrapWithModel(
                                  model: _model.sidebarMenuItemSignOutModel,
                                  updateCallback: () => setState(() {}),
                                  child: SidebarMenuItemWidget(
                                    itemName: 'Sign Out',
                                    itemIcon: Icon(
                                      FFIcons.klogout1,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      );
                    } else if (FFAppState().menuType == 'Security') {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
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
                                        'SIDEBAR_COMP_COMP_Row_fkc5o5mb_ON_TAP');
                                    logFirebaseEvent('Row_update_app_state');
                                    setState(() {
                                      FFAppState().menuType = '';
                                    });
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed('Dashboard');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        FFIcons.karrowLeft2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'bgpwgho2' /* Main Menu */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '4t9rlkq6' /* Security */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SIDEBAR_SidebarMenuItem-Password_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Password_navigate_to');

                              context.pushNamed('ChangePassword');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemPasswordModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SidebarMenuItemWidget(
                                itemName: 'Password',
                                itemIcon: Icon(
                                  FFIcons.kpasswordCheck,
                                  size: 18.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Password'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
                              ),
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SIDEBAR_SidebarMenuItem-Pin_ON_TAP');
                                logFirebaseEvent(
                                    'SidebarMenuItem-Pin_navigate_to');

                                context.pushNamed('CreatePin');
                              },
                              child: wrapWithModel(
                                model: _model.sidebarMenuItemPinModel1,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: SidebarMenuItemWidget(
                                  itemName: valueOrDefault<String>(
                                    valueOrDefault(
                                                    currentUserDocument
                                                        ?.securityPin,
                                                    '') !=
                                                null &&
                                            valueOrDefault(
                                                    currentUserDocument
                                                        ?.securityPin,
                                                    '') !=
                                                ''
                                        ? 'Update your security Pin'
                                        : 'Set your Pin',
                                    'Set your Pin',
                                  ),
                                  itemIcon: Icon(
                                    FFIcons.kcalculator,
                                    size: 18.0,
                                  ),
                                  itemBgColor: widget.selectedSidebarNav ==
                                          'Set your Pin'
                                      ? FlutterFlowTheme.of(context).accent3
                                      : Color(0x00000000),
                                ),
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
                                  'SIDEBAR_SidebarMenuItem-Biometric_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Biometric_navigate_to');

                              context.pushNamed('LoginBiometric');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemBiometricModel1,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SidebarMenuItemWidget(
                                itemName: 'Biometrics',
                                itemIcon: Icon(
                                  FFIcons.kfingerScan,
                                  size: 18.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Biometrics'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (FFAppState().menuType == 'App Information') {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
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
                                        'SIDEBAR_COMP_COMP_Row_lkhn3wo2_ON_TAP');
                                    logFirebaseEvent('Row_update_app_state');
                                    setState(() {
                                      FFAppState().menuType = '';
                                    });
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed('Dashboard');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        FFIcons.karrowLeft2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'toh25mlj' /* Main Menu */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'd48em0bm' /* App Information */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SIDEBAR_SidebarMenuItem-AppInfo_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-AppInfo_navigate_to');

                              context.pushNamed('AppName');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemAppInfoModel1,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'App Name',
                                itemIcon: Icon(
                                  FFIcons.ksmallcaps,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'App Name'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-AppLogo_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-AppLogo_navigate_to');

                              context.pushNamed('AppLogo');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemAppLogoModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'App Logo',
                                itemIcon: Icon(
                                  FFIcons.klampOn,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'App Logo'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-AppEmails_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-AppEmails_navigate_to');

                              context.pushNamed('AppEmail');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemAppEmailsModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'App Emails',
                                itemIcon: Icon(
                                  FFIcons.ksms,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'App Emails'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-EmailTemplates_O');
                              logFirebaseEvent(
                                  'SidebarMenuItem-EmailTemplates_navigate_');

                              context.pushNamed('ListOfEmailTemplates');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemEmailTemplatesModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Email Templates',
                                itemIcon: Icon(
                                  FFIcons.kframe2,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'Email Templates'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-APIIntegration_O');
                              logFirebaseEvent(
                                  'SidebarMenuItem-APIIntegration_navigate_');

                              context.pushNamed('APIIntegration');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemAPIIntegrationModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'API Integration',
                                itemIcon: Icon(
                                  FFIcons.kdeviceMessage,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'API Integration'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-ConnectAppWeb_ON');
                              logFirebaseEvent(
                                  'SidebarMenuItem-ConnectAppWeb_navigate_t');

                              context.pushNamed('Links');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemConnectAppWebModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Connect App Store & Web',
                                itemIcon: Icon(
                                  FFIcons.klinkSquare,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'Connect App Store & Web'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-Currency_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Currency_navigate_to');

                              context.pushNamed('Currency');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemCurrencyModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Currency',
                                itemIcon: Icon(
                                  FFIcons.kemptyWalletChange,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Currency'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-Announcement_ON_');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Announcement_navigate_to');

                              context.pushNamed('ListOfAnnonucements');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemAnnouncementModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Annonucements',
                                itemIcon: Icon(
                                  FFIcons.kmessage,
                                  size: 20.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Annonucements'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-RoleAndPermissio');
                              logFirebaseEvent(
                                  'SidebarMenuItem-RoleAndPermissions_navig');

                              context.pushNamed('Permissions');
                            },
                            child: wrapWithModel(
                              model:
                                  _model.sidebarMenuItemRoleAndPermissionsModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Roles & Permissions',
                                itemIcon: Icon(
                                  FFIcons.kprofileRemove,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'Roles & Permissions'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-ManageRecipients');
                              logFirebaseEvent(
                                  'SidebarMenuItem-ManageRecipients_navigat');

                              context.pushNamed('ManageRecipeints');
                            },
                            child: wrapWithModel(
                              model:
                                  _model.sidebarMenuItemManageRecipientsModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Manage Recipients',
                                itemIcon: Icon(
                                  FFIcons.ktoggleOnCircle,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'Manage Recipients'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-ManageSecurity_O');
                              logFirebaseEvent(
                                  'SidebarMenuItem-ManageSecurity_navigate_');

                              context.pushNamed('ManageSecurity');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemManageSecurityModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Manage Security',
                                itemIcon: Icon(
                                  FFIcons.ksecuritySafe,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'Manage Security'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-ManageAppAds_ON_');
                              logFirebaseEvent(
                                  'SidebarMenuItem-ManageAppAds_navigate_to');

                              context.pushNamed('ManageAds');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemManageAppAdsModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Manage App Ads',
                                itemIcon: Icon(
                                  FFIcons.ksliderHorizontal,
                                  size: 20.0,
                                ),
                                itemBgColor: widget.selectedSidebarNav ==
                                        'Manage App Ads'
                                    ? FlutterFlowTheme.of(context).accent3
                                    : Color(0x00000000),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (FFAppState().menuType ==
                        'Transaction Security') {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
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
                                        'SIDEBAR_COMP_COMP_Row_vmf1c5j1_ON_TAP');
                                    logFirebaseEvent('Row_update_app_state');
                                    setState(() {
                                      FFAppState().menuType = '';
                                    });
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed('Dashboard');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        FFIcons.karrowLeft2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'i7emfrfz' /* Main Menu */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '77tzwqqd' /* Transaction Security */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SIDEBAR_SidebarMenuItem-Pin_ON_TAP');
                                logFirebaseEvent(
                                    'SidebarMenuItem-Pin_navigate_to');

                                context.pushNamed('CreatePin');
                              },
                              child: wrapWithModel(
                                model: _model.sidebarMenuItemPinModel2,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: SidebarMenuItemWidget(
                                  itemName: valueOrDefault<String>(
                                    valueOrDefault(
                                                    currentUserDocument
                                                        ?.securityPin,
                                                    '') !=
                                                null &&
                                            valueOrDefault(
                                                    currentUserDocument
                                                        ?.securityPin,
                                                    '') !=
                                                ''
                                        ? 'Update your Security Transaction Pin'
                                        : 'Set your Transaction Pin',
                                    'Set your Pin',
                                  ),
                                  itemIcon: Icon(
                                    FFIcons.kcalculator,
                                    size: 18.0,
                                  ),
                                  itemBgColor: widget.selectedSidebarNav ==
                                          'Set your Transaction Pin'
                                      ? FlutterFlowTheme.of(context).accent3
                                      : Color(0x00000000),
                                ),
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
                                  'SIDEBAR_SidebarMenuItem-Biometric_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Biometric_navigate_to');

                              context.pushNamed('LoginBiometric');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemBiometricModel2,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SidebarMenuItemWidget(
                                itemName: 'Biometrics',
                                itemIcon: Icon(
                                  FFIcons.kfingerScan,
                                  size: 18.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Biometrics'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
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
                                  'SIDEBAR_SidebarMenuItem-Dashboard_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Dashboard_navigate_to');

                              context.pushNamed('Dashboard');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemDashboardModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Dashboard',
                                itemIcon: Icon(
                                  FFIcons.khome,
                                  size: 18.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Dashboard'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder<List<DwPluginsRecord>>(
                                stream: queryDwPluginsRecord(
                                  queryBuilder: (dwPluginsRecord) =>
                                      dwPluginsRecord
                                          .where(
                                            'plugin_name',
                                            isEqualTo: 'Bill Payment',
                                          )
                                          .where(
                                            'plugin_status',
                                            isEqualTo: true,
                                          ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        child: ShimmerTwoLineWidget(),
                                      ),
                                    );
                                  }
                                  List<DwPluginsRecord>
                                      columnBillPaymentDwPluginsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnBillPaymentDwPluginsRecord =
                                      columnBillPaymentDwPluginsRecordList
                                              .isNotEmpty
                                          ? columnBillPaymentDwPluginsRecordList
                                              .first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SIDEBAR_SidebarMenuItem-Bill_ON_TAP');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-Bill_navigate_to');

                                          context.pushNamed('ListOfServices');
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.sidebarMenuItemBillModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Pay Bills',
                                            itemIcon: Icon(
                                              FFIcons.kbill,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Pay Bills'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                              'SIDEBAR_SidebarMenuItem-BillOrders_ON_TA');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-BillOrders_navigate_to');

                                          context.pushNamed('ListOfBillOrders');
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .sidebarMenuItemBillOrdersModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Bill Orders',
                                            itemIcon: Icon(
                                              FFIcons.ktextalignJustifyright,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Bill Orders'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              StreamBuilder<List<DwPluginsRecord>>(
                                stream: queryDwPluginsRecord(
                                  queryBuilder: (dwPluginsRecord) =>
                                      dwPluginsRecord
                                          .where(
                                            'plugin_name',
                                            isEqualTo: 'Fintech',
                                          )
                                          .where(
                                            'plugin_status',
                                            isEqualTo: true,
                                          ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        child: ShimmerTwoLineWidget(),
                                      ),
                                    );
                                  }
                                  List<DwPluginsRecord>
                                      columnFintechDwPluginsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnFintechDwPluginsRecord =
                                      columnFintechDwPluginsRecordList
                                              .isNotEmpty
                                          ? columnFintechDwPluginsRecordList
                                              .first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SIDEBAR_SidebarMenuItem-Transactions_ON_');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-Transactions_navigate_to');

                                          context.pushNamed('ListOfProducts');

                                          logFirebaseEvent(
                                              'SidebarMenuItem-Transactions_update_app_');
                                          setState(() {
                                            FFAppState().menuType = 'eCommerce';
                                          });
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .sidebarMenuItemTransactionsModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Transactions',
                                            itemIcon: Icon(
                                              FFIcons.kflash,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Transactions'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                              'SIDEBAR_SidebarMenuItem-VirtualCard_ON_T');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-VirtualCard_navigate_to');

                                          context.pushNamed('VirtualCard');
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .sidebarMenuItemVirtualCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Virtual Card',
                                            itemIcon: Icon(
                                              FFIcons.kcard,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Virtual Card'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              StreamBuilder<List<DwPluginsRecord>>(
                                stream: queryDwPluginsRecord(
                                  queryBuilder: (dwPluginsRecord) =>
                                      dwPluginsRecord
                                          .where(
                                            'plugin_name',
                                            isEqualTo: 'Ecommerce',
                                          )
                                          .where(
                                            'plugin_status',
                                            isEqualTo: true,
                                          ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        child: ShimmerTwoLineWidget(),
                                      ),
                                    );
                                  }
                                  List<DwPluginsRecord>
                                      columnEcommerceDwPluginsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnEcommerceDwPluginsRecord =
                                      columnEcommerceDwPluginsRecordList
                                              .isNotEmpty
                                          ? columnEcommerceDwPluginsRecordList
                                              .first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SIDEBAR_SidebarMenuItem-Orders_ON_TAP');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-Orders_navigate_to');

                                          context.pushNamed('ListOfProducts');

                                          logFirebaseEvent(
                                              'SidebarMenuItem-Orders_update_app_state');
                                          setState(() {
                                            FFAppState().menuType = 'eCommerce';
                                          });
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.sidebarMenuItemOrdersModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Orders',
                                            itemIcon: Icon(
                                              FFIcons.kflash,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Orders'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                              'SIDEBAR_SidebarMenuItem-Carts_ON_TAP');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-Carts_navigate_to');

                                          context.pushNamed('ListOfProducts');

                                          logFirebaseEvent(
                                              'SidebarMenuItem-Carts_update_app_state');
                                          setState(() {
                                            FFAppState().menuType = 'eCommerce';
                                          });
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.sidebarMenuItemCartsModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Carts',
                                            itemIcon: Icon(
                                              FFIcons.kshoppingCart,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Carts'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                              'SIDEBAR_SidebarMenuItem-Address_ON_TAP');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-Address_navigate_to');

                                          context.pushNamed('ListOfProducts');

                                          logFirebaseEvent(
                                              'SidebarMenuItem-Address_update_app_state');
                                          setState(() {
                                            FFAppState().menuType = 'eCommerce';
                                          });
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .sidebarMenuItemAddressModel2,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Address',
                                            itemIcon: Icon(
                                              FFIcons.klocation,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Address'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              StreamBuilder<List<DwPluginsRecord>>(
                                stream: queryDwPluginsRecord(
                                  queryBuilder: (dwPluginsRecord) =>
                                      dwPluginsRecord
                                          .where(
                                            'plugin_name',
                                            isEqualTo: 'Giftcard',
                                          )
                                          .where(
                                            'plugin_status',
                                            isEqualTo: true,
                                          ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        child: ShimmerTwoLineWidget(),
                                      ),
                                    );
                                  }
                                  List<DwPluginsRecord>
                                      columnGiftcardDwPluginsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnGiftcardDwPluginsRecord =
                                      columnGiftcardDwPluginsRecordList
                                              .isNotEmpty
                                          ? columnGiftcardDwPluginsRecordList
                                              .first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SIDEBAR_SidebarMenuItem-GiftcardsOrders_');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-GiftcardsOrders_navigate');

                                          context.pushNamed('ListOfProducts');

                                          logFirebaseEvent(
                                              'SidebarMenuItem-GiftcardsOrders_update_a');
                                          setState(() {
                                            FFAppState().menuType = 'eCommerce';
                                          });
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .sidebarMenuItemGiftcardsOrdersModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Giftcard Orders',
                                            itemIcon: Icon(
                                              FFIcons.kcardPos,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Giftcard Orders'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              StreamBuilder<List<DwPluginsRecord>>(
                                stream: queryDwPluginsRecord(
                                  queryBuilder: (dwPluginsRecord) =>
                                      dwPluginsRecord
                                          .where(
                                            'plugin_name',
                                            isEqualTo: 'Crypto',
                                          )
                                          .where(
                                            'plugin_status',
                                            isEqualTo: true,
                                          ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 250.0,
                                        child: ShimmerTwoLineWidget(),
                                      ),
                                    );
                                  }
                                  List<DwPluginsRecord>
                                      columnCryptoDwPluginsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnCryptoDwPluginsRecord =
                                      columnCryptoDwPluginsRecordList.isNotEmpty
                                          ? columnCryptoDwPluginsRecordList
                                              .first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SIDEBAR_SidebarMenuItem-CryptosOrders_ON');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-CryptosOrders_navigate_t');

                                          context
                                              .pushNamed('ListOfCryptoOrders');
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .sidebarMenuItemCryptosOrdersModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Trade Orders',
                                            itemIcon: Icon(
                                              FFIcons.ktrade,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Trade Orders'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SIDEBAR_SidebarMenuItem-Recipients_ON_TA');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Recipients_navigate_to');

                              context.pushNamed('ListOfRecipients');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemRecipientsModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Recipients',
                                itemIcon: Icon(
                                  FFIcons.kpersonalcard,
                                  size: 18.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Recipients'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-Profiles_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Profiles_update_app_stat');
                              setState(() {
                                FFAppState().menuType = 'Profile';
                              });
                              logFirebaseEvent(
                                  'SidebarMenuItem-Profiles_navigate_to');

                              context.pushNamed('PersonalInformation');
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemProfilesModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Profile',
                                itemIcon: Icon(
                                  FFIcons.kuser,
                                  size: 18.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Profile'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
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
                                  'SIDEBAR_SidebarMenuItem-Settings_ON_TAP');
                              logFirebaseEvent(
                                  'SidebarMenuItem-Settings_update_app_stat');
                              setState(() {
                                FFAppState().menuType = 'Settings';
                              });
                            },
                            child: wrapWithModel(
                              model: _model.sidebarMenuItemSettingsModel,
                              updateCallback: () => setState(() {}),
                              child: SidebarMenuItemWidget(
                                itemName: 'Settings',
                                itemIcon: Icon(
                                  FFIcons.ksetting3,
                                  size: 18.0,
                                ),
                                itemBgColor:
                                    widget.selectedSidebarNav == 'Settings'
                                        ? FlutterFlowTheme.of(context).accent3
                                        : Color(0x00000000),
                              ),
                            ),
                          ),
                          if ((valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Owner') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Admin') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Customer Support') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'IT Support') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Marketing Department'))
                            AuthUserStreamWidget(
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 15.0, 15.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'w5plrowh' /* Administrator */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StreamBuilder<List<DwPluginsRecord>>(
                                            stream: queryDwPluginsRecord(
                                              queryBuilder: (dwPluginsRecord) =>
                                                  dwPluginsRecord
                                                      .where(
                                                        'plugin_name',
                                                        isEqualTo:
                                                            'Bill Payment',
                                                      )
                                                      .where(
                                                        'plugin_status',
                                                        isEqualTo: true,
                                                      ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: 210.0,
                                                    child:
                                                        ShimmerTwoLineWidget(),
                                                  ),
                                                );
                                              }
                                              List<DwPluginsRecord>
                                                  columnBillPaymentsDwPluginsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final columnBillPaymentsDwPluginsRecord =
                                                  columnBillPaymentsDwPluginsRecordList
                                                          .isNotEmpty
                                                      ? columnBillPaymentsDwPluginsRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SIDEBAR_SidebarMenuItem-BillPayments_ON_');
                                                      logFirebaseEvent(
                                                          'SidebarMenuItem-BillPayments_navigate_to');

                                                      context.pushNamed(
                                                          'ListOfBillOrdersForAdmin');
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .sidebarMenuItemBillPaymentsModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          SidebarMenuItemWidget(
                                                        itemName:
                                                            'Bill Payment',
                                                        itemIcon: Icon(
                                                          FFIcons.kbill,
                                                          size: 18.0,
                                                        ),
                                                        itemBgColor: widget
                                                                    .selectedSidebarNav ==
                                                                'Bill Payments'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3
                                                            : Color(0x00000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SIDEBAR_COMP_COMP_MenuItem-Orders_ON_TAP');
                                                            logFirebaseEvent(
                                                                'MenuItem-Orders_navigate_to');

                                                            context.pushNamed(
                                                                'ListOfBillOrdersForAdmin');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .menuItemOrdersModel1,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                MenuItemWidget(
                                                              itemName:
                                                                  'Orders',
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SIDEBAR_MenuItem-BillPaymentsSettings_ON');
                                                            logFirebaseEvent(
                                                                'MenuItem-BillPaymentsSettings_navigate_t');

                                                            context.pushNamed(
                                                                'BillSettings');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .menuItemBillPaymentsSettingsModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                MenuItemWidget(
                                                              itemName:
                                                                  'Bill Settings',
                                                            ),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 20.0))
                                                          .addToEnd(SizedBox(
                                                              height: 10.0)),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<DwPluginsRecord>>(
                                            stream: queryDwPluginsRecord(
                                              queryBuilder: (dwPluginsRecord) =>
                                                  dwPluginsRecord
                                                      .where(
                                                        'plugin_name',
                                                        isEqualTo: 'Fintech',
                                                      )
                                                      .where(
                                                        'plugin_status',
                                                        isEqualTo: true,
                                                      ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: 210.0,
                                                    child:
                                                        ShimmerTwoLineWidget(),
                                                  ),
                                                );
                                              }
                                              List<DwPluginsRecord>
                                                  columnFintechDwPluginsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final columnFintechDwPluginsRecord =
                                                  columnFintechDwPluginsRecordList
                                                          .isNotEmpty
                                                      ? columnFintechDwPluginsRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SIDEBAR_SidebarMenuItem-Fintech_ON_TAP');
                                                      logFirebaseEvent(
                                                          'SidebarMenuItem-Fintech_navigate_to');

                                                      context.pushNamed(
                                                          'ListOfCryptoOrders');
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .sidebarMenuItemFintechModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          SidebarMenuItemWidget(
                                                        itemName: 'Fintech',
                                                        itemIcon: Icon(
                                                          FFIcons.kflash,
                                                          size: 18.0,
                                                        ),
                                                        itemBgColor: widget
                                                                    .selectedSidebarNav ==
                                                                'Fintech'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3
                                                            : Color(0x00000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemTransactionsModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName:
                                                                'Transactions',
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemCardsModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName: 'Cards',
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SIDEBAR_MenuItem-FintechSettings_ON_TAP');
                                                            logFirebaseEvent(
                                                                'MenuItem-FintechSettings_navigate_to');

                                                            context.pushNamed(
                                                                'FintechSettings');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .menuItemFintechSettingsModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                MenuItemWidget(
                                                              itemName:
                                                                  'Fintech Settings',
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 30.0)),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<DwPluginsRecord>>(
                                            stream: queryDwPluginsRecord(
                                              queryBuilder: (dwPluginsRecord) =>
                                                  dwPluginsRecord
                                                      .where(
                                                        'plugin_name',
                                                        isEqualTo: 'Ecommerce',
                                                      )
                                                      .where(
                                                        'plugin_status',
                                                        isEqualTo: true,
                                                      ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: 210.0,
                                                    child:
                                                        ShimmerTwoLineWidget(),
                                                  ),
                                                );
                                              }
                                              List<DwPluginsRecord>
                                                  columnEcommerceDwPluginsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final columnEcommerceDwPluginsRecord =
                                                  columnEcommerceDwPluginsRecordList
                                                          .isNotEmpty
                                                      ? columnEcommerceDwPluginsRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SIDEBAR_SidebarMenuItem-Ecommerce_ON_TAP');
                                                      logFirebaseEvent(
                                                          'SidebarMenuItem-Ecommerce_navigate_to');

                                                      context.pushNamed(
                                                          'ListOfProducts');

                                                      logFirebaseEvent(
                                                          'SidebarMenuItem-Ecommerce_update_app_sta');
                                                      setState(() {
                                                        FFAppState().menuType =
                                                            'eCommerce';
                                                      });
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .sidebarMenuItemEcommerceModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          SidebarMenuItemWidget(
                                                        itemName: 'Ecommerce',
                                                        itemIcon: Icon(
                                                          FFIcons.kshoppingCart,
                                                          size: 18.0,
                                                        ),
                                                        itemBgColor: widget
                                                                    .selectedSidebarNav ==
                                                                'Ecommerce'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3
                                                            : Color(0x00000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemInventoryModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName:
                                                                'Inventory',
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemOrdersModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName: 'Orders',
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemPaymentsModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName:
                                                                'Payments',
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SIDEBAR_MenuItem-Settings_ON_TAP');
                                                            logFirebaseEvent(
                                                                'MenuItem-Settings_navigate_to');

                                                            context.pushNamed(
                                                                'EcommerceSettings');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .menuItemSettingsModel1,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                MenuItemWidget(
                                                              itemName:
                                                                  'Ecommerce Settings',
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 30.0)),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<DwPluginsRecord>>(
                                            stream: queryDwPluginsRecord(
                                              queryBuilder: (dwPluginsRecord) =>
                                                  dwPluginsRecord
                                                      .where(
                                                        'plugin_name',
                                                        isEqualTo: 'Giftcard',
                                                      )
                                                      .where(
                                                        'plugin_status',
                                                        isEqualTo: true,
                                                      ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: 210.0,
                                                    child:
                                                        ShimmerTwoLineWidget(),
                                                  ),
                                                );
                                              }
                                              List<DwPluginsRecord>
                                                  columnGiftcardDwPluginsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final columnGiftcardDwPluginsRecord =
                                                  columnGiftcardDwPluginsRecordList
                                                          .isNotEmpty
                                                      ? columnGiftcardDwPluginsRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SIDEBAR_SidebarMenuItem-Giftcard_ON_TAP');
                                                      logFirebaseEvent(
                                                          'SidebarMenuItem-Giftcard_navigate_to');

                                                      context.pushNamed(
                                                          'ListOfCardsOrders');
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .sidebarMenuItemGiftcardModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          SidebarMenuItemWidget(
                                                        itemName: 'Giftcard',
                                                        itemIcon: Icon(
                                                          FFIcons.kshoppingCart,
                                                          size: 18.0,
                                                        ),
                                                        itemBgColor: widget
                                                                    .selectedSidebarNav ==
                                                                'Giftcards'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3
                                                            : Color(0x00000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemInventoryModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName:
                                                                'Inventory',
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemOrdersModel3,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName: 'Orders',
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .menuItemSettingsModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: MenuItemWidget(
                                                            itemName:
                                                                'Giftcard Settings',
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 30.0)),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<DwPluginsRecord>>(
                                            stream: queryDwPluginsRecord(
                                              queryBuilder: (dwPluginsRecord) =>
                                                  dwPluginsRecord
                                                      .where(
                                                        'plugin_name',
                                                        isEqualTo: 'Crypto',
                                                      )
                                                      .where(
                                                        'plugin_status',
                                                        isEqualTo: true,
                                                      ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: 210.0,
                                                    child:
                                                        ShimmerTwoLineWidget(),
                                                  ),
                                                );
                                              }
                                              List<DwPluginsRecord>
                                                  columnCryptoDwPluginsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final columnCryptoDwPluginsRecord =
                                                  columnCryptoDwPluginsRecordList
                                                          .isNotEmpty
                                                      ? columnCryptoDwPluginsRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SIDEBAR_SidebarMenuItem-Cryptos_ON_TAP');
                                                      logFirebaseEvent(
                                                          'SidebarMenuItem-Cryptos_navigate_to');

                                                      context.pushNamed(
                                                          'ListOfCryptoOrders');
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .sidebarMenuItemCryptosModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          SidebarMenuItemWidget(
                                                        itemName: 'Cryptos',
                                                        itemIcon: Icon(
                                                          FFIcons.kshoppingCart,
                                                          size: 18.0,
                                                        ),
                                                        itemBgColor: widget
                                                                    .selectedSidebarNav ==
                                                                'Cryptos'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3
                                                            : Color(0x00000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SIDEBAR_COMP_COMP_MenuItem-Orders_ON_TAP');
                                                            logFirebaseEvent(
                                                                'MenuItem-Orders_navigate_to');

                                                            context.pushNamed(
                                                                'ListOfCryptoOrders');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .menuItemOrdersModel4,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                MenuItemWidget(
                                                              itemName:
                                                                  'Orders',
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SIDEBAR_MenuItem-WalletRates_ON_TAP');
                                                            logFirebaseEvent(
                                                                'MenuItem-WalletRates_navigate_to');

                                                            context.pushNamed(
                                                                'ListOfWallets');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .menuItemWalletRatesModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                MenuItemWidget(
                                                              itemName:
                                                                  'Wallet & Rates',
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SIDEBAR_MenuItem-Settings_ON_TAP');
                                                            logFirebaseEvent(
                                                                'MenuItem-Settings_navigate_to');

                                                            context.pushNamed(
                                                                'CryptoSettings');
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .menuItemSettingsModel3,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                MenuItemWidget(
                                                              itemName:
                                                                  'Crypto Settings',
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 30.0)),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SIDEBAR_SidebarMenuItem-AppInfo_ON_TAP');
                                      logFirebaseEvent(
                                          'SidebarMenuItem-AppInfo_update_app_state');
                                      setState(() {
                                        FFAppState().menuType =
                                            'App Information';
                                      });
                                      logFirebaseEvent(
                                          'SidebarMenuItem-AppInfo_navigate_to');

                                      context.pushNamed('AppName');
                                    },
                                    child: wrapWithModel(
                                      model:
                                          _model.sidebarMenuItemAppInfoModel2,
                                      updateCallback: () => setState(() {}),
                                      child: SidebarMenuItemWidget(
                                        itemName: 'App Information',
                                        itemIcon: Icon(
                                          FFIcons.kinfoCircle,
                                          size: 18.0,
                                        ),
                                        itemBgColor:
                                            widget.selectedSidebarNav ==
                                                    'App Information'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                          'SIDEBAR_SidebarMenuItem-Plugins_ON_TAP');
                                      logFirebaseEvent(
                                          'SidebarMenuItem-Plugins_navigate_to');

                                      context.pushNamed('Plugins');
                                    },
                                    child: wrapWithModel(
                                      model: _model.sidebarMenuItemPluginsModel,
                                      updateCallback: () => setState(() {}),
                                      child: SidebarMenuItemWidget(
                                        itemName: 'Plugins',
                                        itemIcon: Icon(
                                          FFIcons.kelementPlus,
                                          size: 18.0,
                                        ),
                                        itemBgColor:
                                            widget.selectedSidebarNav ==
                                                    'Plugins'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                          'SIDEBAR_SidebarMenuItem-Themes_ON_TAP');
                                      logFirebaseEvent(
                                          'SidebarMenuItem-Themes_navigate_to');

                                      context.pushNamed('Themes');
                                    },
                                    child: wrapWithModel(
                                      model: _model.sidebarMenuItemThemesModel,
                                      updateCallback: () => setState(() {}),
                                      child: SidebarMenuItemWidget(
                                        itemName: 'Themes',
                                        itemIcon: Icon(
                                          FFIcons.kbrush1,
                                          size: 18.0,
                                        ),
                                        itemBgColor:
                                            widget.selectedSidebarNav ==
                                                    'Themes'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                          'SIDEBAR_SidebarMenuItem-Users_ON_TAP');
                                      logFirebaseEvent(
                                          'SidebarMenuItem-Users_navigate_to');

                                      context.pushNamed('ListOfUsers');
                                    },
                                    child: wrapWithModel(
                                      model: _model.sidebarMenuItemUsersModel,
                                      updateCallback: () => setState(() {}),
                                      child: SidebarMenuItemWidget(
                                        itemName: 'Users',
                                        itemIcon: Icon(
                                          FFIcons.kpeople,
                                          size: 18.0,
                                        ),
                                        itemBgColor:
                                            widget.selectedSidebarNav == 'Users'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 15.0, 15.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'e6bq5dsl' /* Content Manager */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
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
                                              'SIDEBAR_SidebarMenuItem-Media_ON_TAP');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-Media_navigate_to');

                                          context.pushNamed('ListOfMedia');
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.sidebarMenuItemMediaModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Media',
                                            itemIcon: Icon(
                                              FFIcons.kgalleryAdd,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Media'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
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
                                              'SIDEBAR_SidebarMenuItem-Posts_ON_TAP');
                                          logFirebaseEvent(
                                              'SidebarMenuItem-Posts_navigate_to');

                                          context.pushNamed('ListOfPosts');
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.sidebarMenuItemPostsModel,
                                          updateCallback: () => setState(() {}),
                                          child: SidebarMenuItemWidget(
                                            itemName: 'Posts',
                                            itemIcon: Icon(
                                              FFIcons.klayer,
                                              size: 18.0,
                                            ),
                                            itemBgColor: widget
                                                        .selectedSidebarNav ==
                                                    'Posts'
                                                ? FlutterFlowTheme.of(context)
                                                    .accent3
                                                : Color(0x00000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SIDEBAR_SidebarMenuItem-Signout_ON_TAP');
                                logFirebaseEvent(
                                    'SidebarMenuItem-Signout_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth('Home', context.mounted);
                              },
                              child: wrapWithModel(
                                model: _model.sidebarMenuItemSignoutModel1,
                                updateCallback: () => setState(() {}),
                                child: SidebarMenuItemWidget(
                                  itemName: 'Sign out',
                                  itemIcon: Icon(
                                    FFIcons.klogout1,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ))
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 12.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent3,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('SIDEBAR_Container_18lq1mv9_ON_TAP');
                      logFirebaseEvent('PhotoGridWithDetails_navigate_to');

                      context.pushNamed('Profile');
                    },
                    child: wrapWithModel(
                      model: _model.photoGridWithDetailsModel2,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: PhotoGridWithDetailsWidget(
                        photoPathPara: currentUserPhoto,
                        titlePara:
                            '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                        descPara: currentUserEmail,
                        widthPara: 35,
                        heightPara: 35,
                        titleSizePara: 13,
                        descSizePara: 11,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SIDEBAR_SidebarMenuItem-Signout_ON_TAP');
                  logFirebaseEvent('SidebarMenuItem-Signout_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth('Home', context.mounted);
                },
                child: wrapWithModel(
                  model: _model.sidebarMenuItemSignoutModel2,
                  updateCallback: () => setState(() {}),
                  child: SidebarMenuItemWidget(
                    itemName: 'Sign Out',
                    itemIcon: Icon(
                      FFIcons.klogout1,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ].divide(SizedBox(height: 30.0)),
    );
  }
}
