import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/forms/calender_text_field/calender_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_bill_orders_model.dart';
export 'filter_bill_orders_model.dart';

class FilterBillOrdersWidget extends StatefulWidget {
  const FilterBillOrdersWidget({
    Key? key,
    this.type,
    this.serviceProvider,
  }) : super(key: key);

  final String? type;
  final String? serviceProvider;

  @override
  _FilterBillOrdersWidgetState createState() => _FilterBillOrdersWidgetState();
}

class _FilterBillOrdersWidgetState extends State<FilterBillOrdersWidget>
    with TickerProviderStateMixin {
  late FilterBillOrdersModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(0.0, 45.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterBillOrdersModel());

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
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            wrapWithModel(
              model: _model.modalHeaderModel,
              updateCallback: () => setState(() {}),
              updateOnChange: true,
              child: ModalHeaderWidget(
                headerTitlePara: 'Filter by',
                headerTitleTextColorPara:
                    FlutterFlowTheme.of(context).primaryText,
                headerActionPara: () async {
                  logFirebaseEvent('FILTER_BILL_ORDERS_Container_5p1h6kkg_CA');
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
                          '6tx1fp3t' /* Network Type */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
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
                                  ChipData(FFLocalizations.of(context).getText(
                                    'tjj1hhba' /* All */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'gxf3rxm3' /* Airtime */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'cej4t361' /* Data Bundle */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    '0s1t3oyq' /* Cable TV */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'whu2dg6v' /* Wifi */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'r42y8bbn' /* Eletricity */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    '62okal6e' /* Transfer */,
                                  ))
                                ],
                                onChanged: (val) => setState(() =>
                                    _model.choiceChipsServiceProviderValue =
                                        val?.first),
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
                                        .choiceChipsServiceProviderValueController ??=
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
                          'tdovzmt6' /* Date Created */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
                    child: wrapWithModel(
                      model: _model.primaryButtonModel,
                      updateCallback: () => setState(() {}),
                      child: PrimaryButtonWidget(
                        buttonText: 'Apply',
                        disableStatusPara: false,
                        buttonAction: () async {
                          logFirebaseEvent(
                              'FILTER_BILL_ORDERS_Container_p8q54hnc_CA');
                          logFirebaseEvent('PrimaryButton_bottom_sheet');
                          Navigator.pop(
                              context, _model.choiceChipsServiceProviderValue);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
