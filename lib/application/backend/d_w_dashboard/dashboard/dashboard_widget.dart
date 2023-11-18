import '/application/backend/d_w_dashboard/components/dashboard_for_admin/dashboard_for_admin_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_bill_user/dashboard_for_bill_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_crypto_user/dashboard_for_crypto_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_e_commerce_user/dashboard_for_e_commerce_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_fintech_user/dashboard_for_fintech_user_widget.dart';
import '/application/backend/d_w_dashboard/components/dashboard_for_giftcard_user/dashboard_for_giftcard_user_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_dashboard/setup/set_up_application_comp/set_up_application_comp_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/menus/circle_menu_item/circle_menu_item_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    Key? key,
    this.defaultDashboard,
  }) : super(key: key);

  final String? defaultDashboard;

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      logFirebaseEvent('DASHBOARD_PAGE_Dashboard_ON_INIT_STATE');
      logFirebaseEvent('Dashboard_firestore_query');
      _model.dashboardAppInfo = await queryDwAppRecordCount();
      if (_model.dashboardAppInfo == 0) {
        logFirebaseEvent('Dashboard_bottom_sheet');
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: FlutterFlowTheme.of(context).overlay,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return WebViewAware(
                child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SetUpApplicationCompWidget(),
              ),
            ));
          },
        ).then((value) => safeSetState(() {}));

        return;
      } else {
        return;
      }
    });

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
        title: 'Dashboard',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
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
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'l36kba0b' /* Dashboard */,
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
                        selectedSidebarNav: 'Dashboard',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.dWHeaderModel,
                            updateCallback: () => setState(() {}),
                            child: DWHeaderWidget(
                              pageTitle: 'Dashboard',
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_CircleMenuItem-Bill_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleMenuItem-Bill_update_page_state');
                                              setState(() {
                                                _model.dafaultDashboard =
                                                    'Bill Payments';
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .circleMenuItemBillModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: CircleMenuItemWidget(
                                                itemName: 'Bill Payment',
                                                itemBgColor:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
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
                                                  'DASHBOARD_CircleMenuItem-Cryptos_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleMenuItem-Cryptos_update_page_state');
                                              setState(() {
                                                _model.dafaultDashboard =
                                                    'Cryptos';
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .circleMenuItemCryptosModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: CircleMenuItemWidget(
                                                itemName: 'Crypto',
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
                                                  'DASHBOARD_CircleMenuItem-GiftCards_ON_TA');
                                              logFirebaseEvent(
                                                  'CircleMenuItem-GiftCards_update_page_sta');
                                              setState(() {
                                                _model.dafaultDashboard =
                                                    'Giftcards';
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .circleMenuItemGiftCardsModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: CircleMenuItemWidget(
                                                itemName: 'Giftcard',
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
                                                  'DASHBOARD_CircleMenuItem-Ecommerce_ON_TA');
                                              logFirebaseEvent(
                                                  'CircleMenuItem-Ecommerce_update_page_sta');
                                              setState(() {
                                                _model.dafaultDashboard =
                                                    'eCommerce';
                                              });
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .circleMenuItemEcommerceModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: CircleMenuItemWidget(
                                                itemName: 'Ecommerce',
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
                                                  'DASHBOARD_CircleMenuItem-Fintech_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleMenuItem-Fintech_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
                                                        .overlay,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                      child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.8,
                                                        child:
                                                            DashboardForBillUserWidget(),
                                                      ),
                                                    ),
                                                  ));
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .circleMenuItemFintechModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: CircleMenuItemWidget(
                                                itemName: 'Fintech',
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 15.0))
                                            .around(SizedBox(width: 15.0)),
                                      ),
                                    ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if ((valueOrDefault(
                                                        currentUserDocument
                                                            ?.userRole,
                                                        '') ==
                                                    'User') ||
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.userRole,
                                                        '') ==
                                                    'Admin') ||
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.userRole,
                                                        '') ==
                                                    'Customer Support') ||
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.userRole,
                                                        '') ==
                                                    'IT Support') ||
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.userRole,
                                                        '') ==
                                                    'Marketing Department')) {
                                              return Container(
                                                width: double.infinity,
                                                height: 900.0,
                                                decoration: BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .dashboardForAdminModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      DashboardForAdminWidget(),
                                                ),
                                              );
                                            } else if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.userRole,
                                                    '') ==
                                                'Owner') {
                                              return Builder(
                                                builder: (context) {
                                                  if (valueOrDefault<bool>(
                                                    _model.dafaultDashboard ==
                                                        'Bill Payments',
                                                    false,
                                                  )) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 900.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .dashboardForBillUserModel1,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            DashboardForBillUserWidget(),
                                                      ),
                                                    );
                                                  } else if (valueOrDefault<
                                                      bool>(
                                                    _model.dafaultDashboard ==
                                                        'Cryptos',
                                                    false,
                                                  )) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 900.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .dashboardForCryptoUserModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            DashboardForCryptoUserWidget(),
                                                      ),
                                                    );
                                                  } else if (valueOrDefault<
                                                      bool>(
                                                    _model.dafaultDashboard ==
                                                        'Giftcards',
                                                    false,
                                                  )) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 900.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .dashboardForGiftcardUserModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            DashboardForGiftcardUserWidget(),
                                                      ),
                                                    );
                                                  } else if (valueOrDefault<
                                                      bool>(
                                                    _model.dafaultDashboard ==
                                                        'eCommerce',
                                                    false,
                                                  )) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 900.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .dashboardForECommerceUserModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            DashboardForECommerceUserWidget(),
                                                      ),
                                                    );
                                                  } else if (valueOrDefault<
                                                      bool>(
                                                    _model.dafaultDashboard ==
                                                        'Fintech',
                                                    false,
                                                  )) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 900.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .dashboardForFintechUserModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            DashboardForFintechUserWidget(),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 900.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .dashboardForBillUserModel2,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            DashboardForBillUserWidget(),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            } else {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .noAccessErrorModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        NoAccessErrorWidget(),
                                                  ),
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
