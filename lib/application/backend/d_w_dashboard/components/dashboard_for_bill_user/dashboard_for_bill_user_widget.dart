import '/application/backend/d_w_plugins/bill_payments/components/list_of_bill_order_comp/list_of_bill_order_comp_widget.dart';
import '/application/backend/d_w_settings/admin/adverts/users/list_of_ads/list_of_ads_widget.dart';
import '/application/backend/d_w_users/user/components/account_balance/account_balance_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/layouts/icon_square_box/icon_square_box_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_for_bill_user_model.dart';
export 'dashboard_for_bill_user_model.dart';

class DashboardForBillUserWidget extends StatefulWidget {
  const DashboardForBillUserWidget({
    Key? key,
    String? defaultPlatform,
  })  : this.defaultPlatform = defaultPlatform ?? '',
        super(key: key);

  final String defaultPlatform;

  @override
  _DashboardForBillUserWidgetState createState() =>
      _DashboardForBillUserWidgetState();
}

class _DashboardForBillUserWidgetState
    extends State<DashboardForBillUserWidget> {
  late DashboardForBillUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardForBillUserModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 500.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 400.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 400.0;
                    } else {
                      return 400.0;
                    }
                  }(),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'DASHBOARD_FOR_BILL_USER_Row_dvlc6qet_ON_');
                              logFirebaseEvent('Row_navigate_to');

                              context.pushNamed('Profile');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.photoGridCoverModel,
                                      updateCallback: () => setState(() {}),
                                      child: PhotoGridCoverWidget(
                                        photoWidth: 35,
                                        photoHeight: 35,
                                        photoPath: currentUserPhoto,
                                        photoName: valueOrDefault<String>(
                                          functions.getFirstLetterOfString(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.firstName,
                                                  '')),
                                          'A',
                                        ),
                                        photoNameFontSize: 16,
                                        bgColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                        'Firstname Lastname',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          wrapWithModel(
                            model: _model.accountBalanceModel,
                            updateCallback: () => setState(() {}),
                            child: AccountBalanceWidget(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.primaryButtonModel1,
                              updateCallback: () => setState(() {}),
                              child: PrimaryButtonWidget(
                                buttonText: 'Pay Bill',
                                buttonBgColor:
                                    FlutterFlowTheme.of(context).primary,
                                buttonWidth: 200,
                                buttonHeight: 45,
                                disableStatusPara: false,
                                buttonHoverColor:
                                    FlutterFlowTheme.of(context).white,
                                buttonAction: () async {
                                  logFirebaseEvent(
                                      'DASHBOARD_FOR_BILL_USER_Container_vozqqu');
                                  logFirebaseEvent('PrimaryButton_navigate_to');

                                  context.pushNamed('ListOfServices');
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: wrapWithModel(
                              model: _model.primaryButtonModel2,
                              updateCallback: () => setState(() {}),
                              child: PrimaryButtonWidget(
                                buttonText: 'Fund Wallet',
                                buttonBgColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                buttonTextColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                buttonWidth: 200,
                                buttonHeight: 45,
                                disableStatusPara: false,
                                buttonHoverBGColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                buttonAction: () async {
                                  logFirebaseEvent(
                                      'DASHBOARD_FOR_BILL_USER_Container_o8l97r');
                                  logFirebaseEvent('PrimaryButton_navigate_to');

                                  context.pushNamed('FundWallet');
                                },
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
                Container(
                  width: 500.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'abu54m1p' /* Quick Actions */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DASHBOARD_FOR_BILL_USER_IconSquareBox-Ai');
                                    logFirebaseEvent(
                                        'IconSquareBox-Airtime_navigate_to');

                                    context.pushNamed('CreateAirtime');
                                  },
                                  child: wrapWithModel(
                                    model: _model.iconSquareBoxAirtimeModel,
                                    updateCallback: () => setState(() {}),
                                    child: IconSquareBoxWidget(
                                      iconPara: Icon(
                                        FFIcons.kcall,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      textPara: 'Airtime',
                                      iconBgColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxSize: 100,
                                      iconBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBordercolor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBgColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textSize: 14,
                                      textColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                                        'DASHBOARD_FOR_BILL_USER_IconSquareBox-Da');
                                    logFirebaseEvent(
                                        'IconSquareBox-Data_navigate_to');

                                    context.pushNamed('CreateDataBundle');
                                  },
                                  child: wrapWithModel(
                                    model: _model.iconSquareBoxDataModel,
                                    updateCallback: () => setState(() {}),
                                    child: IconSquareBoxWidget(
                                      iconPara: Icon(
                                        FFIcons.kwifi,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      textPara: 'Data',
                                      iconBgColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxSize: 100,
                                      iconBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBordercolor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBgColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textSize: 14,
                                      textColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                                        'DASHBOARD_FOR_BILL_USER_IconSquareBox-Ca');
                                    logFirebaseEvent(
                                        'IconSquareBox-CableTV_navigate_to');

                                    context.pushNamed('CreateAirtime');
                                  },
                                  child: wrapWithModel(
                                    model: _model.iconSquareBoxCableTVModel,
                                    updateCallback: () => setState(() {}),
                                    child: IconSquareBoxWidget(
                                      iconPara: Icon(
                                        FFIcons.kdevices1,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      textPara: 'Cable TV',
                                      iconBgColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxSize: 100,
                                      iconBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBordercolor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBgColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textSize: 14,
                                      textColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                                        'DASHBOARD_FOR_BILL_USER_IconSquareBox-Mo');
                                    logFirebaseEvent(
                                        'IconSquareBox-More_navigate_to');

                                    context.pushNamed('ListOfServices');
                                  },
                                  child: wrapWithModel(
                                    model: _model.iconSquareBoxMoreModel,
                                    updateCallback: () => setState(() {}),
                                    child: IconSquareBoxWidget(
                                      iconPara: Icon(
                                        FFIcons.kmore,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      textPara: 'More',
                                      iconBgColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxSize: 100,
                                      iconBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBordercolor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      boxBgColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textSize: 14,
                                      textColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                      wrapWithModel(
                        model: _model.listOfAdsModel,
                        updateCallback: () => setState(() {}),
                        child: ListOfAdsWidget(),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ].divide(SizedBox(height: 30.0)).addToEnd(SizedBox(height: 20.0)),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('DASHBOARD_FOR_BILL_USER_Row-AllOrdersSec');
                logFirebaseEvent('Row-AllOrdersSection_navigate_to');

                context.pushNamed('ListOfBillOrders');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    FFIcons.ktask,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '9r6fweoh' /* Recent Activity */,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.listOfBillOrderCompModel,
                  updateCallback: () => setState(() {}),
                  child: ListOfBillOrderCompWidget(
                    userRefPara: currentUserReference,
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
