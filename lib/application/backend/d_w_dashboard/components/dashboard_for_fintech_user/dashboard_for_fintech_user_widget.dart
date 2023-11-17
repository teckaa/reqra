import '/application/backend/d_w_plugins/bill_payments/components/list_of_bill_order_comp/list_of_bill_order_comp_widget.dart';
import '/application/backend/d_w_plugins/fintech/users/visual_cards/components/credit_card/credit_card_widget.dart';
import '/application/backend/d_w_users/user/components/account_balance/account_balance_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_for_fintech_user_model.dart';
export 'dashboard_for_fintech_user_model.dart';

class DashboardForFintechUserWidget extends StatefulWidget {
  const DashboardForFintechUserWidget({
    Key? key,
    String? defaultPlatform,
  })  : this.defaultPlatform = defaultPlatform ?? '',
        super(key: key);

  final String defaultPlatform;

  @override
  _DashboardForFintechUserWidgetState createState() =>
      _DashboardForFintechUserWidgetState();
}

class _DashboardForFintechUserWidgetState
    extends State<DashboardForFintechUserWidget> {
  late DashboardForFintechUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardForFintechUserModel());

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
            Wrap(
              spacing: 20.0,
              runSpacing: 30.0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 350.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                                      photoName: functions
                                          .getFirstLetterOfString(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.firstName,
                                                  '')),
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
                          wrapWithModel(
                            model: _model.primaryButtonModel1,
                            updateCallback: () => setState(() {}),
                            child: PrimaryButtonWidget(
                              buttonText: 'Make Transfer',
                              buttonBgColor:
                                  FlutterFlowTheme.of(context).primary,
                              buttonTextColor:
                                  FlutterFlowTheme.of(context).white,
                              buttonWidth: 150,
                              buttonHeight: 45,
                              disableStatusPara: false,
                              buttonAction: () async {
                                logFirebaseEvent(
                                    'DASHBOARD_FOR_FINTECH_USER_Container_vb2');
                                logFirebaseEvent('PrimaryButton_navigate_to');

                                context.pushNamed('ListOfTransfer');
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.primaryButtonModel2,
                            updateCallback: () => setState(() {}),
                            child: PrimaryButtonWidget(
                              buttonText: 'Account Details',
                              buttonBgColor:
                                  FlutterFlowTheme.of(context).lineColor,
                              buttonTextColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              buttonWidth: 150,
                              buttonHeight: 45,
                              disableStatusPara: false,
                              buttonAction: () async {
                                logFirebaseEvent(
                                    'DASHBOARD_FOR_FINTECH_USER_Container_r20');
                                logFirebaseEvent('PrimaryButton_navigate_to');

                                context.pushNamed('FundWallet');
                              },
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
                Container(
                  width: 450.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.creditCardModel,
                        updateCallback: () => setState(() {}),
                        child: CreditCardWidget(),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'DASHBOARD_FOR_FINTECH_USER_Text_b89yy0pw');
                          logFirebaseEvent('Text_navigate_to');

                          context.pushNamed('VirtualCard');
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'q0ac9epj' /* View card details */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 10.0,
                                decoration: TextDecoration.underline,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 5.0)),
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
                logFirebaseEvent('DASHBOARD_FOR_FINTECH_USER_Row-AllOrders');
                logFirebaseEvent('Row-AllOrdersSection_navigate_to');

                context.pushNamed('ListOfTransfer');
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
                        'tishad18' /* Recent Transactions */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
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
                  child: ListOfBillOrderCompWidget(),
                ),
              ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
