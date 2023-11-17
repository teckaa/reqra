import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/providers/create_provider/create_provider_widget.dart';
import '/application/backend/d_w_plugins/bill_payments/admin/settings/components/providers/update_provider/update_provider_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_providers_comp_model.dart';
export 'list_of_providers_comp_model.dart';

class ListOfProvidersCompWidget extends StatefulWidget {
  const ListOfProvidersCompWidget({
    Key? key,
    String? servicePara,
  })  : this.servicePara = servicePara ?? 'Airtime',
        super(key: key);

  final String servicePara;

  @override
  _ListOfProvidersCompWidgetState createState() =>
      _ListOfProvidersCompWidgetState();
}

class _ListOfProvidersCompWidgetState extends State<ListOfProvidersCompWidget> {
  late ListOfProvidersCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfProvidersCompModel());

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
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.searchTextFieldModel,
                    updateCallback: () => setState(() {}),
                    child: SearchTextFieldWidget(
                      readOnlyStatusPara: false,
                      actionPara: () async {},
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.primaryButtonModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: PrimaryButtonWidget(
                  buttonText: 'Add new',
                  disableStatusPara: false,
                  buttonAction: () async {
                    logFirebaseEvent(
                        'LIST_OF_PROVIDERS_Container_bfzkwpvw_CAL');
                    logFirebaseEvent('PrimaryButton_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: FlutterFlowTheme.of(context).overlay,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                            child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: CreateProviderWidget(
                            serviceTypePara: _model.dropDownFilterValue,
                          ),
                        ));
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ),
            ].divide(SizedBox(width: 10.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'fxqmc5b3' /* Filter by Services */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
              ),
              StreamBuilder<List<BillpaymentsServicesRecord>>(
                stream: queryBillpaymentsServicesRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: LinearProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  }
                  List<BillpaymentsServicesRecord>
                      dropDownFilterBillpaymentsServicesRecordList =
                      snapshot.data!;
                  return FlutterFlowDropDown<String>(
                    controller: _model.dropDownFilterValueController ??=
                        FormFieldController<String>(
                      _model.dropDownFilterValue ??=
                          FFLocalizations.of(context).getText(
                        'yymlh0mv' /* Airtime */,
                      ),
                    ),
                    options: dropDownFilterBillpaymentsServicesRecordList
                        .map((e) => e.serviceName)
                        .toList(),
                    onChanged: (val) =>
                        setState(() => _model.dropDownFilterValue = val),
                    width: 200.0,
                    height: 35.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'f10x0xpq' /* Select Service */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '0orp8idz' /* Search for a Service */,
                    ),
                    icon: Icon(
                      FFIcons.karrowDown1,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 1.0,
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: true,
                    isMultiSelect: false,
                  );
                },
              ),
            ].divide(SizedBox(height: 5.0)),
          ),
          Expanded(
            child: StreamBuilder<List<BillpaymentProvidersRecord>>(
              stream: queryBillpaymentProvidersRecord(
                queryBuilder: (billpaymentProvidersRecord) =>
                    billpaymentProvidersRecord.where(
                  'provider_service_type',
                  isEqualTo: widget.servicePara,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return ShimmerListOfListsWidget();
                }
                List<BillpaymentProvidersRecord>
                    dataTableBillpaymentProvidersRecordList = snapshot.data!;
                if (dataTableBillpaymentProvidersRecordList.isEmpty) {
                  return EmptyTableWidget(
                    titlePara: _model.dropDownFilterValue != null &&
                            _model.dropDownFilterValue != ''
                        ? 'No ${_model.dropDownFilterValue} provider yet'
                        : 'No Provider yet',
                    descPara: _model.dropDownFilterValue != null &&
                            _model.dropDownFilterValue != ''
                        ? 'Starting creating ${_model.dropDownFilterValue} provider.'
                        : 'Starting creating provider.',
                    buttonTextPara: 'Add new',
                    buttonActionPara: () async {
                      logFirebaseEvent(
                          'LIST_OF_PROVIDERS_DataTable_pg52us19_CAL');
                      logFirebaseEvent('DataTable_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: FlutterFlowTheme.of(context).overlay,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                              child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: CreateProviderWidget(
                              serviceTypePara: _model.dropDownFilterValue,
                            ),
                          ));
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  );
                }
                return DataTable2(
                  columns: [
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'rfkarr2p' /* Provider Name */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
                              ),
                        ),
                      ),
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '4sxa9263' /* Action */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: dataTableBillpaymentProvidersRecordList
                      .mapIndexed((dataTableIndex,
                              dataTableBillpaymentProvidersRecord) =>
                          [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: PhotoGridWithDetailsWidget(
                                    key: Key(
                                        'Keyzu6_${dataTableIndex}_of_${dataTableBillpaymentProvidersRecordList.length}'),
                                    photoPathPara:
                                        dataTableBillpaymentProvidersRecord
                                            .providerLogo,
                                    titlePara:
                                        dataTableBillpaymentProvidersRecord
                                            .providerName,
                                    descPara:
                                        dataTableBillpaymentProvidersRecord
                                            .providerServiceType,
                                    widthPara: 35,
                                    heightPara: 35,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LIST_OF_PROVIDERS_Text_pzg1ji4d_ON_TAP');
                                        logFirebaseEvent('Text_backend_call');

                                        await BillpaymentProvidersRecord
                                            .collection
                                            .doc()
                                            .set(
                                                createBillpaymentProvidersRecordData(
                                              createdAt:
                                                  dataTableBillpaymentProvidersRecord
                                                      .createdAt,
                                              providerName:
                                                  '${dataTableBillpaymentProvidersRecord.providerName} - Copy',
                                              providerServiceType:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerServiceType,
                                              providerStatus:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerStatus,
                                              providerLogo:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerLogo,
                                              providerDefaultCommission:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerDefaultCommission,
                                              providerBillerCode:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerBillerCode,
                                              providerBillerName:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerBillerName,
                                              providerItemCode:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerItemCode,
                                              providerShortName:
                                                  dataTableBillpaymentProvidersRecord
                                                      .providerShortName,
                                            ));
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ga4fou5o' /* Duplicate */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 11.0,
                                              decoration:
                                                  TextDecoration.underline,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
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
                                            'LIST_OF_PROVIDERS_Text_l8gs6jx4_ON_TAP');
                                        logFirebaseEvent('Text_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .overlay,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                                child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: UpdateProviderWidget(
                                                recordRef:
                                                    dataTableBillpaymentProvidersRecord
                                                        .reference,
                                              ),
                                            ));
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'nry5o2ns' /* Update */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 11.0,
                                              decoration:
                                                  TextDecoration.underline,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
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
                                              'LIST_OF_PROVIDERS_Text_l7thgje8_ON_TAP');
                                          logFirebaseEvent('Text_alert_dialog');
                                          await showAlignedDialog(
                                            context: context,
                                            isGlobal: true,
                                            avoidOverflow: false,
                                            targetAnchor: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: WebViewAware(
                                                    child: ModalConfirmWidget(
                                                  modalTitle: 'Delete record',
                                                  modalDesc:
                                                      'Are you sure you want to delete this record?',
                                                  modalAction: () async {
                                                    logFirebaseEvent(
                                                        '_backend_call');
                                                    await dataTableBillpaymentProvidersRecord
                                                        .reference
                                                        .delete();
                                                    logFirebaseEvent(
                                                        '_close_dialog,_drawer,_etc');
                                                    Navigator.pop(context);
                                                  },
                                                )),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ffhu976z' /* Delete */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 11.0,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              ),
                            ),
                          ].map((c) => DataCell(c)).toList())
                      .map((e) => DataRow(cells: e))
                      .toList(),
                  headingRowColor: MaterialStateProperty.all(
                    Color(0x00000000),
                  ),
                  headingRowHeight: 56.0,
                  dataRowColor: MaterialStateProperty.all(
                    Color(0x00000000),
                  ),
                  dataRowHeight: 56.0,
                  border: TableBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  dividerThickness: 1.0,
                  showBottomBorder: true,
                  minWidth: 49.0,
                );
              },
            ),
          ),
        ].divide(SizedBox(height: 15.0)),
      ),
    );
  }
}
