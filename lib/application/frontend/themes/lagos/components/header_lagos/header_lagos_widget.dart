import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/application/frontend/themes/lagos/components/mobile_dropdown_lagos/mobile_dropdown_lagos_widget.dart';
import '/application/frontend/themes/lagos/components/products_dropdown_lagos/products_dropdown_lagos_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'header_lagos_model.dart';
export 'header_lagos_model.dart';

class HeaderLagosWidget extends StatefulWidget {
  const HeaderLagosWidget({
    Key? key,
    this.home,
    this.about,
    this.blog,
    this.faqs,
    this.contact,
    this.products,
    bool? viewMode,
  })  : this.viewMode = viewMode ?? false,
        super(key: key);

  final Color? home;
  final Color? about;
  final Color? blog;
  final Color? faqs;
  final Color? contact;
  final Color? products;
  final bool viewMode;

  @override
  _HeaderLagosWidgetState createState() => _HeaderLagosWidgetState();
}

class _HeaderLagosWidgetState extends State<HeaderLagosWidget> {
  late HeaderLagosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderLagosModel());

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
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.viewMode == true)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'v2xcf9xa' /* Preview mode */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.primaryRoundedButtonModel1,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: PrimaryRoundedButtonWidget(
                      buttonText: 'Close',
                      buttonWidth: 80,
                      buttonHeight: 30,
                      disableStatusPara: false,
                      buttonAction: () async {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).black,
                ),
                child: Container(
                  width: valueOrDefault<double>(
                    FFAppState().appDefaultWebWidth.toDouble(),
                    1280.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '57rm228g' /* With our new app, Paying your ... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1100.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                                      'HEADER_LAGOS_Container_un9t1spr_ON_TAP');
                                  logFirebaseEvent(
                                      'AppRectangleLogo_action_block');
                                  await action_blocks.backToHomeAction(context);
                                },
                                child: wrapWithModel(
                                  model: _model.appRectangleLogoModel,
                                  updateCallback: () => setState(() {}),
                                  child: AppRectangleLogoWidget(),
                                ),
                              ),
                            ],
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HEADER_LAGOS_COMP_MenuItem-Home_ON_TAP');
                                    logFirebaseEvent(
                                        'MenuItem-Home_navigate_to');

                                    context.pushNamed('Home');
                                  },
                                  child: wrapWithModel(
                                    model: _model.menuItemHomeModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: MenuItemWidget(
                                      itemName: 'Home',
                                      itemTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      itemTextSize: 16,
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
                                        'HEADER_LAGOS_COMP_MenuItem-About_ON_TAP');
                                    logFirebaseEvent(
                                        'MenuItem-About_navigate_to');

                                    context.pushNamed('AboutUs');
                                  },
                                  child: wrapWithModel(
                                    model: _model.menuItemAboutModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: MenuItemWidget(
                                      itemName: 'About us',
                                      itemTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      itemTextSize: 16,
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HEADER_LAGOS_MenuItem-Products_ON_TAP');
                                      logFirebaseEvent(
                                          'MenuItem-Products_alert_dialog');
                                      await showAlignedDialog(
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        isGlobal: false,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(-0.78, -1.1)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: WebViewAware(
                                                child:
                                                    ProductsDropdownLagosWidget()),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: wrapWithModel(
                                      model: _model.menuItemProductsModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: MenuItemWidget(
                                        itemName: 'Products',
                                        itemTextColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        itemTextSize: 16,
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
                                        'HEADER_LAGOS_COMP_MenuItem-Blog_ON_TAP');
                                    logFirebaseEvent(
                                        'MenuItem-Blog_navigate_to');

                                    context.pushNamed('Blog');
                                  },
                                  child: wrapWithModel(
                                    model: _model.menuItemBlogModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: MenuItemWidget(
                                      itemName: 'Blogs',
                                      itemTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      itemTextSize: 16,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 30.0)),
                            ),
                        ].divide(SizedBox(width: 30.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Builder(
                            builder: (context) {
                              if (loggedIn) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HEADER_LAGOS_Container_x4wmkixt_ON_TAP');
                                    logFirebaseEvent('Container_action_block');
                                    await action_blocks.dashboard(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 5.0, 5.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'humnbt3i' /* Dashboard */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                            ),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  wrapWithModel(
                                                model:
                                                    _model.photoGridCoverModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: PhotoGridCoverWidget(
                                                  photoWidth: 30,
                                                  photoHeight: 30,
                                                  photoPath: currentUserPhoto,
                                                  photoName: functions
                                                      .getFirstLetterOfString(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.firstName,
                                                              '')),
                                                  photoNameFontSize: 14,
                                                  bgColor: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                    ))
                                      wrapWithModel(
                                        model:
                                            _model.primaryRoundedButtonModel2,
                                        updateCallback: () => setState(() {}),
                                        child: PrimaryRoundedButtonWidget(
                                          buttonText: 'Open an account',
                                          buttonBgColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          buttonTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          buttonWidth: 150,
                                          buttonHeight: 40,
                                          disableStatusPara: false,
                                          buttonAction: () async {
                                            logFirebaseEvent(
                                                'HEADER_LAGOS_Container_wbgrt16b_CALLBACK');
                                            logFirebaseEvent(
                                                'PrimaryRoundedButton_action_block');
                                            await action_blocks
                                                .getStartedAction(context);
                                          },
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                    ))
                                      wrapWithModel(
                                        model:
                                            _model.primaryRoundedButtonModel3,
                                        updateCallback: () => setState(() {}),
                                        child: PrimaryRoundedButtonWidget(
                                          buttonText: 'Login',
                                          buttonBgColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          buttonTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          buttonWidth: 100,
                                          buttonHeight: 40,
                                          disableStatusPara: false,
                                          buttonAction: () async {
                                            logFirebaseEvent(
                                                'HEADER_LAGOS_Container_vqfhiuxz_CALLBACK');
                                            logFirebaseEvent(
                                                'PrimaryRoundedButton_action_block');
                                            await action_blocks
                                                .loginAction(context);
                                          },
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      desktop: false,
                                    ))
                                      Builder(
                                        builder: (context) => wrapWithModel(
                                          model:
                                              _model.primaryRoundedButtonModel4,
                                          updateCallback: () => setState(() {}),
                                          child: PrimaryRoundedButtonWidget(
                                            buttonText: 'Menu',
                                            buttonBgColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            buttonTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            buttonWidth: 70,
                                            buttonHeight: 37,
                                            disableStatusPara: false,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'HEADER_LAGOS_Container_abcctwmy_CALLBACK');
                                              logFirebaseEvent(
                                                  'PrimaryRoundedButton_alert_dialog');
                                              await showAlignedDialog(
                                                barrierColor:
                                                    Colors.transparent,
                                                context: context,
                                                isGlobal: true,
                                                avoidOverflow: false,
                                                targetAnchor:
                                                    AlignmentDirectional(
                                                            0.0, 0.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                followerAnchor:
                                                    AlignmentDirectional(
                                                            0.0, -0.6)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                builder: (dialogContext) {
                                                  return Material(
                                                    color: Colors.transparent,
                                                    child: WebViewAware(
                                                        child:
                                                            MobileDropdownLagosWidget()),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 10.0)),
                                );
                              }
                            },
                          ),
                        ].divide(SizedBox(width: 20.0)),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 2.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
