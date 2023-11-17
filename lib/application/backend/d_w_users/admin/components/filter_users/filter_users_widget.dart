import '/application/components/forms/calender_text_field/calender_text_field_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_users_model.dart';
export 'filter_users_model.dart';

class FilterUsersWidget extends StatefulWidget {
  const FilterUsersWidget({
    Key? key,
    this.orderRef,
  }) : super(key: key);

  final DocumentReference? orderRef;

  @override
  _FilterUsersWidgetState createState() => _FilterUsersWidgetState();
}

class _FilterUsersWidgetState extends State<FilterUsersWidget> {
  late FilterUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterUsersModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 40.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            wrapWithModel(
              model: _model.modalHeaderModel,
              updateCallback: () => setState(() {}),
              child: ModalHeaderWidget(
                headerTitlePara: 'Filter by',
                headerTitleTextColorPara:
                    FlutterFlowTheme.of(context).primaryText,
                headerActionPara: () async {
                  logFirebaseEvent('FILTER_USERS_Container_ha9r4zqt_CALLBACK');
                  logFirebaseEvent('ModalHeader_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '4g8r06or' /* Status */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 12.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowChoiceChips(
                                options: [
                                  ChipData(
                                      FFLocalizations.of(context).getText(
                                        'hqqi7nr7' /* All */,
                                      ),
                                      FFIcons.kflash),
                                  ChipData(
                                      FFLocalizations.of(context).getText(
                                        '6usocogn' /* Active */,
                                      ),
                                      FFIcons.kuserTick),
                                  ChipData(
                                      FFLocalizations.of(context).getText(
                                        '0cu80x4v' /* Suspended */,
                                      ),
                                      FFIcons.kuserMinus)
                                ],
                                onChanged: (val) => setState(() => _model
                                    .orderStatusChoiceChipsValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 14.0,
                                  elevation: 1.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        color: Color(0xFFE3E7ED),
                                        fontSize: 12.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  iconColor: Color(0xFFE3E7ED),
                                  iconSize: 14.0,
                                  elevation: 1.0,
                                ),
                                chipSpacing: 20.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                alignment: WrapAlignment.start,
                                controller: _model
                                        .orderStatusChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                                  [],
                                ),
                                wrapped: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'geye3pnj' /* Date Created */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.calenderTextFieldModel1,
                                updateCallback: () => setState(() {}),
                                child: CalenderTextFieldWidget(
                                  labelPara: 'From',
                                  hintPara: 'Start date',
                                  readOnlyStatusPara: true,
                                  actionPara: () async {},
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.calenderTextFieldModel2,
                                updateCallback: () => setState(() {}),
                                child: CalenderTextFieldWidget(
                                  labelPara: 'To',
                                  hintPara: 'End date',
                                  readOnlyStatusPara: true,
                                  actionPara: () async {},
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ].divide(SizedBox(height: 30.0)),
              ),
            ),
            wrapWithModel(
              model: _model.modalFooterColumnModel,
              updateCallback: () => setState(() {}),
              child: ModalFooterColumnWidget(
                cancelTextPara: 'Cancel',
                proceedTextPara: 'Apply',
                disableProceedBtnPara: false,
                proceedTextAction: () async {
                  logFirebaseEvent('FILTER_USERS_Container_2db8987l_CALLBACK');
                  logFirebaseEvent('ModalFooterColumn_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
