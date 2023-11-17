import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/dropdown_searchable/dropdown_searchable_widget.dart';
import '/application/components/forms/left_sided_amount_text_field/left_sided_amount_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/application/components/shimmers/shimmer_one_line/shimmer_one_line_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crypto_settings_model.dart';
export 'crypto_settings_model.dart';

class CryptoSettingsWidget extends StatefulWidget {
  const CryptoSettingsWidget({Key? key}) : super(key: key);

  @override
  _CryptoSettingsWidgetState createState() => _CryptoSettingsWidgetState();
}

class _CryptoSettingsWidgetState extends State<CryptoSettingsWidget>
    with TickerProviderStateMixin {
  late CryptoSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CryptoSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CryptoSettings'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        title: 'Crypto settings',
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
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'CRYPTO_SETTINGS_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'fkt912hp' /* Cryptos - Settings */,
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
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if ((valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Owner') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Admin')) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.dWHeaderModel,
                                      updateCallback: () => setState(() {}),
                                      child: DWHeaderWidget(
                                        pageTitle: 'Cryptos - Settings',
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                StreamBuilder<
                                                    List<CryptoSettingsRecord>>(
                                                  stream:
                                                      queryCryptoSettingsRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return ShimmerOneDetailWidget();
                                                    }
                                                    List<CryptoSettingsRecord>
                                                        containerCryptoSettingsRecordList =
                                                        snapshot.data!;
                                                    final containerCryptoSettingsRecord =
                                                        containerCryptoSettingsRecordList
                                                                .isNotEmpty
                                                            ? containerCryptoSettingsRecordList
                                                                .first
                                                            : null;
                                                    return Container(
                                                      width: 400.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    20.0,
                                                                    20.0,
                                                                    20.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (containerCryptoSettingsRecord
                                                                            ?.pluginCurrency !=
                                                                        null &&
                                                                    containerCryptoSettingsRecord
                                                                            ?.pluginCurrency !=
                                                                        '') {
                                                                  return Container(
                                                                    width:
                                                                        400.0,
                                                                    height:
                                                                        800.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment(
                                                                              -1.0,
                                                                              0),
                                                                          child:
                                                                              TabBar(
                                                                            isScrollable:
                                                                                true,
                                                                            labelColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            unselectedLabelColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                ),
                                                                            unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                ),
                                                                            indicatorColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                4.0,
                                                                                4.0,
                                                                                4.0),
                                                                            tabs: [
                                                                              Tab(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'nemhlgb9' /* General */,
                                                                                ),
                                                                              ),
                                                                              Tab(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'jzfgmsll' /* Fee/Currency */,
                                                                                ),
                                                                              ),
                                                                              Tab(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'sjls93am' /* Apis */,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                            controller:
                                                                                _model.tabBarController,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              TabBarView(
                                                                            controller:
                                                                                _model.tabBarController,
                                                                            physics:
                                                                                const NeverScrollableScrollPhysics(),
                                                                            children: [
                                                                              KeepAliveWidgetWrapper(
                                                                                builder: (context) => Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Form(
                                                                                        key: _model.formKey1,
                                                                                        autovalidateMode: AutovalidateMode.disabled,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Theme(
                                                                                              data: ThemeData(
                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                              ),
                                                                                              child: CheckboxListTile(
                                                                                                value: _model.checkboxSellPermitValue ??= containerCryptoSettingsRecord!.permitSelling,
                                                                                                onChanged: (newValue) async {
                                                                                                  setState(() => _model.checkboxSellPermitValue = newValue!);
                                                                                                },
                                                                                                title: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '8ppremnq' /* Sell */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                        fontSize: 15.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                subtitle: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '141dmq14' /* Let users sell crypto on your ... */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                        fontSize: 11.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                dense: true,
                                                                                                controlAffinity: ListTileControlAffinity.trailing,
                                                                                              ),
                                                                                            ),
                                                                                            Theme(
                                                                                              data: ThemeData(
                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                              ),
                                                                                              child: CheckboxListTile(
                                                                                                value: _model.checkboxBuyPermitValue ??= containerCryptoSettingsRecord!.permitBuying,
                                                                                                onChanged: (newValue) async {
                                                                                                  setState(() => _model.checkboxBuyPermitValue = newValue!);
                                                                                                },
                                                                                                title: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '3m7kpjsi' /* Buy */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                        fontSize: 15.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                subtitle: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '8xr899nl' /* Let users buy crypto on your p... */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                        fontSize: 11.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                dense: true,
                                                                                                controlAffinity: ListTileControlAffinity.trailing,
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: wrapWithModel(
                                                                                                    model: _model.primaryButtonLoadingModel1,
                                                                                                    updateCallback: () => setState(() {}),
                                                                                                    child: PrimaryButtonLoadingWidget(
                                                                                                      buttonText: 'Save',
                                                                                                      disableStatusPara: false,
                                                                                                      buttonAction: () async {
                                                                                                        logFirebaseEvent('CRYPTO_SETTINGS_Container_wq9b8yl7_CALLB');
                                                                                                        logFirebaseEvent('PrimaryButtonLoading_backend_call');

                                                                                                        await containerCryptoSettingsRecord!.reference.update(createCryptoSettingsRecordData(
                                                                                                          permitSelling: _model.checkboxSellPermitValue,
                                                                                                          permitBuying: _model.checkboxBuyPermitValue,
                                                                                                        ));
                                                                                                        logFirebaseEvent('PrimaryButtonLoading_action_block');
                                                                                                        await action_blocks.alertSuccess(
                                                                                                          context,
                                                                                                          descPara: 'Saved',
                                                                                                        );
                                                                                                        setState(() {});
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 15.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              KeepAliveWidgetWrapper(
                                                                                builder: (context) => Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                        child: Form(
                                                                                          key: _model.formKey2,
                                                                                          autovalidateMode: AutovalidateMode.disabled,
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              StreamBuilder<List<DwAppRecord>>(
                                                                                                stream: queryDwAppRecord(
                                                                                                  singleRecord: true,
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return ShimmerOneLineWidget();
                                                                                                  }
                                                                                                  List<DwAppRecord> dropdownSearchablePluginCurrencyDwAppRecordList = snapshot.data!;
                                                                                                  final dropdownSearchablePluginCurrencyDwAppRecord = dropdownSearchablePluginCurrencyDwAppRecordList.isNotEmpty ? dropdownSearchablePluginCurrencyDwAppRecordList.first : null;
                                                                                                  return wrapWithModel(
                                                                                                    model: _model.dropdownSearchablePluginCurrencyModel,
                                                                                                    updateCallback: () => setState(() {}),
                                                                                                    updateOnChange: true,
                                                                                                    child: DropdownSearchableWidget(
                                                                                                      labelPara: 'Platform Currency',
                                                                                                      hintPara: 'Search ...',
                                                                                                      optionValuePara: containerCryptoSettingsRecord?.pluginCurrency,
                                                                                                      dropdownIcon: Icon(
                                                                                                        FFIcons.karrowDown1,
                                                                                                      ),
                                                                                                      searchablePara: 'Search network...',
                                                                                                      listLabelPara: functions.listOfCurrencies(),
                                                                                                      listValuePara: functions.listOfCurrencies(),
                                                                                                      actionPara: () async {},
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              wrapWithModel(
                                                                                                model: _model.dropdownSearchableReceiverCurrencyModel,
                                                                                                updateCallback: () => setState(() {}),
                                                                                                updateOnChange: true,
                                                                                                child: DropdownSearchableWidget(
                                                                                                  labelPara: 'Receiver Currency',
                                                                                                  hintPara: 'Search ...',
                                                                                                  optionValuePara: containerCryptoSettingsRecord?.pluginReceivedCurrency,
                                                                                                  dropdownIcon: Icon(
                                                                                                    FFIcons.karrowDown1,
                                                                                                  ),
                                                                                                  searchablePara: 'Search network...',
                                                                                                  listLabelPara: functions.listOfCurrencies(),
                                                                                                  listValuePara: functions.listOfCurrencies(),
                                                                                                  actionPara: () async {},
                                                                                                ),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'sci0cqc1' /* Transactions or Bank Fees */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'w738lzce' /* Do you charge for transactions... */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 13.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 400.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: wrapWithModel(
                                                                                                          model: _model.leftSidedAmountTextFieldTransactionFeeModel,
                                                                                                          updateCallback: () => setState(() {}),
                                                                                                          child: LeftSidedAmountTextFieldWidget(
                                                                                                            labelPara: 'If you do not charge for transactions, leave this field blank or set to 0. (This is based on the platform currency)',
                                                                                                            hintPara: '100',
                                                                                                            valuePara: containerCryptoSettingsRecord?.pluginTransactionFee?.toString(),
                                                                                                            sidedText: valueOrDefault<String>(
                                                                                                              _model.dropdownSearchableReceiverCurrencyModel.dropDownValue == null || _model.dropdownSearchableReceiverCurrencyModel.dropDownValue == '' ? containerCryptoSettingsRecord?.pluginReceivedCurrency : _model.dropdownSearchableReceiverCurrencyModel.dropDownValue,
                                                                                                              'NGN',
                                                                                                            ),
                                                                                                            readOnlyStatusPara: false,
                                                                                                            actionPara: () async {},
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '9aa61us6' /* Do you charge for bank transfe... */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 13.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 400.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: wrapWithModel(
                                                                                                          model: _model.leftSidedAmountTextFieldBankTransferFeeModel,
                                                                                                          updateCallback: () => setState(() {}),
                                                                                                          child: LeftSidedAmountTextFieldWidget(
                                                                                                            labelPara: 'If you do not charge for bank transfers, leave this field blank or set to 0. (This is based on the currency you are using to transfer to your customers)',
                                                                                                            hintPara: '100',
                                                                                                            valuePara: containerCryptoSettingsRecord?.pluginBankTransferFee?.toString(),
                                                                                                            sidedText: valueOrDefault<String>(
                                                                                                              _model.dropdownSearchableReceiverCurrencyModel.dropDownValue == null || _model.dropdownSearchableReceiverCurrencyModel.dropDownValue == '' ? containerCryptoSettingsRecord?.pluginReceivedCurrency : _model.dropdownSearchableReceiverCurrencyModel.dropDownValue,
                                                                                                              'NGN',
                                                                                                            ),
                                                                                                            readOnlyStatusPara: false,
                                                                                                            actionPara: () async {},
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 20.0)),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'yg0c05uf' /* Tax */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '89a4t32p' /* Tax/VAT */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 13.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 400.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: wrapWithModel(
                                                                                                          model: _model.rightSidedAmountTextFieldTaxFeeModel,
                                                                                                          updateCallback: () => setState(() {}),
                                                                                                          child: RightSidedAmountTextFieldWidget(
                                                                                                            labelPara: 'Put in the percentage of the Tax/VAT in percentage (%)',
                                                                                                            valuePara: containerCryptoSettingsRecord?.pluginTax?.toString(),
                                                                                                            sidedText: '%',
                                                                                                            readOnlyStatusPara: false,
                                                                                                            actionPara: () async {},
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 15.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: wrapWithModel(
                                                                                                      model: _model.primaryButtonLoadingModel2,
                                                                                                      updateCallback: () => setState(() {}),
                                                                                                      child: PrimaryButtonLoadingWidget(
                                                                                                        buttonText: 'Save',
                                                                                                        disableStatusPara: false,
                                                                                                        buttonAction: () async {
                                                                                                          logFirebaseEvent('CRYPTO_SETTINGS_Container_6bmzurwr_CALLB');
                                                                                                          logFirebaseEvent('PrimaryButtonLoading_backend_call');

                                                                                                          await containerCryptoSettingsRecord!.reference.update(createCryptoSettingsRecordData(
                                                                                                            pluginCurrency: _model.dropdownSearchablePluginCurrencyModel.dropDownValue,
                                                                                                            pluginReceivedCurrency: _model.dropdownSearchableReceiverCurrencyModel.dropDownValue,
                                                                                                            pluginTransactionFee: double.tryParse(_model.leftSidedAmountTextFieldTransactionFeeModel.textController.text),
                                                                                                            pluginBankTransferFee: double.tryParse(_model.leftSidedAmountTextFieldBankTransferFeeModel.textController.text),
                                                                                                            pluginTax: double.tryParse(_model.rightSidedAmountTextFieldTaxFeeModel.textController.text),
                                                                                                          ));
                                                                                                          logFirebaseEvent('PrimaryButtonLoading_action_block');
                                                                                                          await action_blocks.alertSuccess(
                                                                                                            context,
                                                                                                            descPara: 'Saved',
                                                                                                          );
                                                                                                          setState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 30.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              KeepAliveWidgetWrapper(
                                                                                builder: (context) => Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'k9kaad3h' /* Hello World */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    width:
                                                                        400.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          20.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'f47bj80w' /* Crypto Application Settings */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'o8yeaqlr' /* Configure your application set... */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 13.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  lineHeight: 1.5,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                40.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: wrapWithModel(
                                                                                    model: _model.primaryButtonLoadingModel3,
                                                                                    updateCallback: () => setState(() {}),
                                                                                    updateOnChange: true,
                                                                                    child: PrimaryButtonLoadingWidget(
                                                                                      buttonText: 'Get Started',
                                                                                      disableStatusPara: false,
                                                                                      buttonAction: () async {
                                                                                        logFirebaseEvent('CRYPTO_SETTINGS_Container_mimyvcpe_CALLB');
                                                                                        logFirebaseEvent('PrimaryButtonLoading_backend_call');

                                                                                        await CryptoSettingsRecord.collection.doc().set(createCryptoSettingsRecordData(
                                                                                              createdAt: getCurrentTimestamp,
                                                                                              userRef: currentUserReference,
                                                                                              pluginCurrency: 'USD',
                                                                                              pluginReceivedCurrency: 'NGN',
                                                                                            ));
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 20.0)),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 20.0)),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.noAccessErrorModel,
                                        updateCallback: () => setState(() {}),
                                        child: NoAccessErrorWidget(),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
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
