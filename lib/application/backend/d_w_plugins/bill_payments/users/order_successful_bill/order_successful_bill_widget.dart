import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/global/app_rectangle_logo/app_rectangle_logo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_successful_bill_model.dart';
export 'order_successful_bill_model.dart';

class OrderSuccessfulBillWidget extends StatefulWidget {
  const OrderSuccessfulBillWidget({
    Key? key,
    this.typeOfRecipient,
    this.productType,
    this.amount,
    this.customerNumber,
  }) : super(key: key);

  final String? typeOfRecipient;
  final String? productType;
  final String? amount;
  final String? customerNumber;

  @override
  _OrderSuccessfulBillWidgetState createState() =>
      _OrderSuccessfulBillWidgetState();
}

class _OrderSuccessfulBillWidgetState extends State<OrderSuccessfulBillWidget> {
  late OrderSuccessfulBillModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderSuccessfulBillModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OrderSuccessfulBill'});
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
        title: 'Order successful',
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
                          'ORDER_SUCCESSFUL_BILL_arrowLeft2_ICN_ON_');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed('Dashboard');
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'sr5psr3r' /* Done */,
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
                  child: DWSidebarWidget(),
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
                          pageTitle: 'Done',
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        child: wrapWithModel(
                                          model: _model.appRectangleLogoModel,
                                          updateCallback: () => setState(() {}),
                                          child: AppRectangleLogoWidget(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 30.0, 30.0, 30.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'assets/images/Teckaa_pay_check_mark.png',
                                            width: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                          RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'rvryu4lt' /* You just purchase  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: widget.productType!,
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'k6iugdw7' /* to */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                widget.typeOfRecipient!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                              Text(
                                                widget.customerNumber!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                              ),
                                            ],
                                          ),
                                        ]
                                            .divide(SizedBox(height: 10.0))
                                            .around(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ORDER_SUCCESSFUL_BILL_Container_zslhi9xc');
                                                  logFirebaseEvent(
                                                      'PrimaryButton_navigate_to');

                                                  context.pushNamed(
                                                      'CreateAirtime');
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .primaryButtonModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: PrimaryButtonWidget(
                                                    buttonText:
                                                        'Pay another bill',
                                                    buttonBgColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    buttonTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .white,
                                                    buttonWidth: 250,
                                                    buttonHeight: 50,
                                                    disableStatusPara: false,
                                                    buttonAction: () async {
                                                      logFirebaseEvent(
                                                          'ORDER_SUCCESSFUL_BILL_Container_zslhi9xc');
                                                      logFirebaseEvent(
                                                          'PrimaryButton_navigate_to');

                                                      context.pushNamed(
                                                          'ListOfServices');
                                                    },
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
                                                      'ORDER_SUCCESSFUL_BILL_Container_wk42thgl');
                                                  logFirebaseEvent(
                                                      'PrimaryButton_navigate_to');

                                                  context
                                                      .pushNamed('Dashboard');
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .primaryButtonModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: PrimaryButtonWidget(
                                                    buttonText:
                                                        'Go back to Dashbaord',
                                                    buttonBgColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    buttonTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    buttonWidth: 250,
                                                    buttonHeight: 50,
                                                    disableStatusPara: false,
                                                    buttonAction: () async {
                                                      logFirebaseEvent(
                                                          'ORDER_SUCCESSFUL_BILL_Container_wk42thgl');
                                                      logFirebaseEvent(
                                                          'PrimaryButton_action_block');
                                                      await action_blocks
                                                          .dashboard(context);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 20.0))
                                                .around(SizedBox(height: 20.0)),
                                          ),
                                        ],
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
              ],
            ),
          ),
        ));
  }
}
