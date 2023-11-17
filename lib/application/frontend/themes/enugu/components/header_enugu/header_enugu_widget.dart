import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/application/components/menus/circle_menu_item/circle_menu_item_widget.dart';
import '/application/frontend/themes/abuja/components/mobile_dropdown_abuja/mobile_dropdown_abuja_widget.dart';
import '/application/frontend/themes/abuja/components/products_dropdown_abuja/products_dropdown_abuja_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'header_enugu_model.dart';
export 'header_enugu_model.dart';

class HeaderEnuguWidget extends StatefulWidget {
  const HeaderEnuguWidget({
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
  _HeaderEnuguWidgetState createState() => _HeaderEnuguWidgetState();
}

class _HeaderEnuguWidgetState extends State<HeaderEnuguWidget> {
  late HeaderEnuguModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderEnuguModel());

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
        color: Color(0xFFEAF0FF),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
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
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '61c13pqe' /* With our new app, trading is n... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                    'n0zss1eh' /*  clicking here. */,
                                  ),
                                  style: TextStyle(),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      logFirebaseEvent(
                                          'HEADER_ENUGU_RichTextSpan_8eux4wo6_ON_TA');
                                      logFirebaseEvent(
                                          'RichTextSpan_navigate_to');

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
                                        .primaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            textAlign: TextAlign.start,
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
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HEADER_ENUGU_Container_6c6p7kuj_ON_TAP');
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
                                  'HEADER_ENUGU_CircleMenuItem-Home_ON_TAP');
                              logFirebaseEvent(
                                  'CircleMenuItem-Home_navigate_to');

                              context.pushNamed('Home');
                            },
                            child: wrapWithModel(
                              model: _model.circleMenuItemHomeModel,
                              updateCallback: () => setState(() {}),
                              child: CircleMenuItemWidget(
                                itemName: 'Home',
                                itemBgColor: Color(0x68000000),
                                itemTextColor:
                                    FlutterFlowTheme.of(context).white,
                                itemSizePara: 14,
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
                                  'HEADER_ENUGU_CircleMenuItem-About_ON_TAP');
                              logFirebaseEvent(
                                  'CircleMenuItem-About_navigate_to');

                              context.pushNamed('Home');
                            },
                            child: wrapWithModel(
                              model: _model.circleMenuItemAboutModel,
                              updateCallback: () => setState(() {}),
                              child: CircleMenuItemWidget(
                                itemName: 'About Us',
                                itemBgColor: FlutterFlowTheme.of(context).black,
                                itemTextColor:
                                    FlutterFlowTheme.of(context).white,
                                itemSizePara: 14,
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
                                    'HEADER_ENUGU_CircleMenuItem-Products_ON_');
                                logFirebaseEvent(
                                    'CircleMenuItem-Products_alert_dialog');
                                await showAlignedDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: false,
                                  targetAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(-0.78, -1.5)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: WebViewAware(
                                          child: ProductsDropdownAbujaWidget()),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: wrapWithModel(
                                model: _model.circleMenuItemProductsModel,
                                updateCallback: () => setState(() {}),
                                child: CircleMenuItemWidget(
                                  itemName: 'Products',
                                  itemBgColor:
                                      FlutterFlowTheme.of(context).black,
                                  itemTextColor:
                                      FlutterFlowTheme.of(context).white,
                                  itemSizePara: 14,
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
                                  'HEADER_ENUGU_CircleMenuItem-Blog_ON_TAP');
                              logFirebaseEvent(
                                  'CircleMenuItem-Blog_navigate_to');

                              context.pushNamed('Home');
                            },
                            child: wrapWithModel(
                              model: _model.circleMenuItemBlogModel,
                              updateCallback: () => setState(() {}),
                              child: CircleMenuItemWidget(
                                itemName: 'Blog',
                                itemBgColor: FlutterFlowTheme.of(context).black,
                                itemTextColor:
                                    FlutterFlowTheme.of(context).white,
                                itemSizePara: 14,
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 30.0)),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        wrapWithModel(
                          model: _model.primaryRoundedButtonModel,
                          updateCallback: () => setState(() {}),
                          child: PrimaryRoundedButtonWidget(
                            buttonText: 'Get Started',
                            buttonBgColor: FlutterFlowTheme.of(context).white,
                            buttonTextColor: FlutterFlowTheme.of(context).black,
                            buttonWidth: 120,
                            buttonHeight: 40,
                            buttonAction: () async {
                              logFirebaseEvent(
                                  'HEADER_ENUGU_Container_kus9wxcg_CALLBACK');
                              logFirebaseEvent(
                                  'PrimaryRoundedButton_action_block');
                              await action_blocks.getStartedAction(context);
                            },
                          ),
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
                                    'HEADER_ENUGU_COMP_Icon_826r1w46_ON_TAP');
                                logFirebaseEvent('Icon_alert_dialog');
                                await showAlignedDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  targetAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(0.0, -0.4)
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
                      ].divide(SizedBox(width: 20.0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
