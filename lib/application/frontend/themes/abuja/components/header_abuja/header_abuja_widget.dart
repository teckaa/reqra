import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/menus/menu_item/menu_item_widget.dart';
import '/application/frontend/themes/abuja/components/mobile_dropdown_abuja/mobile_dropdown_abuja_widget.dart';
import '/application/frontend/themes/abuja/components/products_dropdown_abuja/products_dropdown_abuja_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'header_abuja_model.dart';
export 'header_abuja_model.dart';

class HeaderAbujaWidget extends StatefulWidget {
  const HeaderAbujaWidget({
    Key? key,
    this.home,
    this.about,
    this.blog,
    this.faqs,
    this.giftcards,
    this.contact,
    this.crypto,
  }) : super(key: key);

  final Color? home;
  final Color? about;
  final Color? blog;
  final Color? faqs;
  final Color? giftcards;
  final Color? contact;
  final Color? crypto;

  @override
  _HeaderAbujaWidgetState createState() => _HeaderAbujaWidgetState();
}

class _HeaderAbujaWidgetState extends State<HeaderAbujaWidget> {
  late HeaderAbujaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderAbujaModel());

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
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).primaryText
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-0.98, -1.0),
                end: AlignmentDirectional(0.98, 1.0),
              ),
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
                    Expanded(
                      child: RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'c7z1ft9c' /* With our new app, trading is n... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'hbbetpg8' /*  clicking here. */,
                              ),
                              style: TextStyle(),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  logFirebaseEvent(
                                      'HEADER_ABUJA_RichTextSpan_h086mjbc_ON_TA');
                                  logFirebaseEvent('RichTextSpan_navigate_to');

                                  context.pushNamed('AboutUs');
                                },
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: valueOrDefault<double>(
              FFAppState().appDefaultWebWidth.toDouble(),
              1280.0,
            ),
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'HEADER_ABUJA_Container_s2i1ru2n_ON_TAP');
                          logFirebaseEvent('AppRectangleLogo_action_block');
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                    'HEADER_ABUJA_COMP_MenuItem-Home_ON_TAP');
                                logFirebaseEvent('MenuItem-Home_navigate_to');

                                context.pushNamed('Home');
                              },
                              child: wrapWithModel(
                                model: _model.menuItemHomeModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: MenuItemWidget(
                                  itemName: 'Home',
                                  itemTextColor: widget.home,
                                  itemTextSize: 15,
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
                                    'HEADER_ABUJA_COMP_MenuItem-About_ON_TAP');
                                logFirebaseEvent('MenuItem-About_navigate_to');

                                context.pushNamed('AboutUs');
                              },
                              child: wrapWithModel(
                                model: _model.menuItemAboutModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: MenuItemWidget(
                                  itemName: 'About Us',
                                  itemBgColor: Color(0x00000000),
                                  itemTextColor: widget.about,
                                  itemTextSize: 15,
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
                                      'HEADER_ABUJA_MenuItem-Products_ON_TAP');
                                  logFirebaseEvent(
                                      'MenuItem-Products_alert_dialog');
                                  await showAlignedDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    isGlobal: false,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            -0.78, -1.5)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: WebViewAware(
                                            child:
                                                ProductsDropdownAbujaWidget()),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: wrapWithModel(
                                  model: _model.menuItemProductsModel,
                                  updateCallback: () => setState(() {}),
                                  child: MenuItemWidget(
                                    itemName: 'Products',
                                    itemTextSize: 15,
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
                                    'HEADER_ABUJA_COMP_MenuItem-Blog_ON_TAP');
                                logFirebaseEvent('MenuItem-Blog_navigate_to');

                                context.pushNamed('Blog');
                              },
                              child: wrapWithModel(
                                model: _model.menuItemBlogModel,
                                updateCallback: () => setState(() {}),
                                child: MenuItemWidget(
                                  itemName: 'Blog',
                                  itemBorderColor: Color(0x00000000),
                                  itemTextColor: widget.blog,
                                  itemTextSize: 15,
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
                                    'HEADER_ABUJA_COMP_MenuItem-Faq_ON_TAP');
                                logFirebaseEvent('MenuItem-Faq_navigate_to');

                                context.pushNamed('Faqs');
                              },
                              child: wrapWithModel(
                                model: _model.menuItemFaqModel,
                                updateCallback: () => setState(() {}),
                                child: MenuItemWidget(
                                  itemName: 'Faq',
                                  itemTextColor: widget.faqs,
                                  itemTextSize: 15,
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (loggedIn == true) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HEADER_ABUJA_Container_ll7efufi_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_action_block');
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ksfyvhu5' /* Dashboard */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    wrapWithModel(
                                                  model: _model
                                                      .photoGridCoverModel,
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
                                                    bgColor:
                                                        FlutterFlowTheme.of(
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
                                      ))
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HEADER_ABUJA_PrimaryButton-LoginButton_O');
                                            logFirebaseEvent(
                                                'PrimaryButton-LoginButton_navigate_to');

                                            context.pushNamed('Login');
                                          },
                                          child: wrapWithModel(
                                            model: _model
                                                .primaryButtonLoginButtonModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: PrimaryButtonWidget(
                                              buttonText: 'Login',
                                              buttonBgColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              buttonTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              buttonWidth: 100,
                                              buttonHeight: 40,
                                              disableStatusPara: false,
                                              buttonAction: () async {
                                                logFirebaseEvent(
                                                    'HEADER_ABUJA_PrimaryButton-LoginButton_C');
                                                logFirebaseEvent(
                                                    'PrimaryButton-LoginButton_action_block');
                                                await action_blocks
                                                    .loginAction(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        wrapWithModel(
                                          model: _model
                                              .primaryButtonGetStartedModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: PrimaryButtonWidget(
                                            buttonText: 'Get Started',
                                            buttonBgColor: Colors.transparent,
                                            buttonTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            buttonBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            buttonWidth: 120,
                                            buttonHeight: 40,
                                            disableStatusPara: false,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'HEADER_ABUJA_PrimaryButton-GetStarted_CA');
                                              logFirebaseEvent(
                                                  'PrimaryButton-GetStarted_action_block');
                                              await action_blocks
                                                  .getStartedAction(context);
                                            },
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 25.0)),
                                  );
                                }
                              },
                            ),
                          ].divide(SizedBox(width: 25.0)),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HEADER_ABUJA_COMP_Icon_fhugkddo_ON_TAP');
                              logFirebaseEvent('Icon_alert_dialog');
                              await showAlignedDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                isGlobal: true,
                                avoidOverflow: false,
                                targetAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: AlignmentDirectional(0.0, -0.4)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: WebViewAware(
                                        child: MobileDropdownAbujaWidget()),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Icon(
                              FFIcons.ktextalignRight,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 34.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
