import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_users/user/fund_wallet/components/fund_bill_account/fund_bill_account_widget.dart';
import '/application/backend/d_w_users/user/fund_wallet/components/list_of_fundings_comp/list_of_fundings_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fund_wallet_model.dart';
export 'fund_wallet_model.dart';

class FundWalletWidget extends StatefulWidget {
  const FundWalletWidget({Key? key}) : super(key: key);

  @override
  _FundWalletWidgetState createState() => _FundWalletWidgetState();
}

class _FundWalletWidgetState extends State<FundWalletWidget> {
  late FundWalletModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FundWalletModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'FundWallet'});
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
        title: 'Fund Wallet',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                            'FUND_WALLET_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'brfwq3o1' /* Fund wallet */,
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
                      selectedSidebarNav: 'Users',
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
                          updateOnChange: true,
                          child: DWHeaderWidget(
                            pageTitle: 'Fund wallet',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  wrapWithModel(
                                    model: _model.titleWithBackButtonModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: TitleWithBackButtonWidget(
                                      titleName: 'Fund Wallet',
                                      actionPara: () async {
                                        logFirebaseEvent(
                                            'FUND_WALLET_Container_i03jplr6_CALLBACK');
                                        logFirebaseEvent(
                                            'TitleWithBackButton_navigate_back');
                                        context.safePop();
                                      },
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 10.0,
                                    runSpacing: 10.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      wrapWithModel(
                                        model: _model.primaryButtonModel1,
                                        updateCallback: () => setState(() {}),
                                        child: PrimaryButtonWidget(
                                          buttonText: 'Fund via Flutterwave',
                                          buttonBgColor: Color(0xFFFF9B00),
                                          buttonWidth: valueOrDefault<int>(
                                            () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 450;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 180;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 180;
                                              } else {
                                                return 180;
                                              }
                                            }(),
                                            180,
                                          ),
                                          buttonHeight: 50,
                                          disableStatusPara: false,
                                          buttonAction: () async {
                                            logFirebaseEvent(
                                                'FUND_WALLET_Container_h6lo9a7w_CALLBACK');
                                            logFirebaseEvent(
                                                'PrimaryButton_bottom_sheet');
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
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        FundBillAccountWidget(
                                                      paymentChannel:
                                                          'Flutterwave',
                                                    ),
                                                  ),
                                                ));
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => wrapWithModel(
                                          model: _model.primaryButtonModel2,
                                          updateCallback: () => setState(() {}),
                                          child: PrimaryButtonWidget(
                                            buttonText: 'Fund via Paystack',
                                            buttonBgColor: Color(0xFF03C3F7),
                                            buttonWidth: valueOrDefault<int>(
                                              () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 450;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 180;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 180;
                                                } else {
                                                  return 180;
                                                }
                                              }(),
                                              180,
                                            ),
                                            buttonHeight: 50,
                                            disableStatusPara: false,
                                            buttonAction: () async {
                                              logFirebaseEvent(
                                                  'FUND_WALLET_Container_36eznfku_CALLBACK');
                                              logFirebaseEvent(
                                                  'PrimaryButton_alert_dialog');
                                              await showAlignedDialog(
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
                                                            0.0, 0.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                builder: (dialogContext) {
                                                  return Material(
                                                    color: Colors.transparent,
                                                    child: WebViewAware(
                                                        child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child:
                                                          FundBillAccountWidget(
                                                        paymentChannel:
                                                            'Paystack',
                                                      ),
                                                    )),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 450.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 400.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 350.0;
                                        } else {
                                          return 350.0;
                                        }
                                      }(),
                                      350.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model:
                                                  _model.searchTextFieldModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: SearchTextFieldWidget(
                                                hintPara: 'Search',
                                                readOnlyStatusPara: false,
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          FFIcons.kdocumentFilter,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 30.0,
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                  FutureBuilder<int>(
                                    future: queryFundingsRecordCount(
                                      queryBuilder: (fundingsRecord) =>
                                          fundingsRecord.orderBy('created_at',
                                              descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return ShimmerCountWidget();
                                      }
                                      int textCount = snapshot.data!;
                                      return Text(
                                        '${textCount.toString()} transactions',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      );
                                    },
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.listOfFundingsCompModel,
                                      updateCallback: () => setState(() {}),
                                      child: ListOfFundingsCompWidget(),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 15.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
