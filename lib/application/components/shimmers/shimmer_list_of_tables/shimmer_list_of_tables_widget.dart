import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shimmer_list_of_tables_model.dart';
export 'shimmer_list_of_tables_model.dart';

class ShimmerListOfTablesWidget extends StatefulWidget {
  const ShimmerListOfTablesWidget({
    Key? key,
    int? itemsNo,
  })  : this.itemsNo = itemsNo ?? 4,
        super(key: key);

  final int itemsNo;

  @override
  _ShimmerListOfTablesWidgetState createState() =>
      _ShimmerListOfTablesWidgetState();
}

class _ShimmerListOfTablesWidgetState extends State<ShimmerListOfTablesWidget>
    with TickerProviderStateMixin {
  late ShimmerListOfTablesModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 0.98,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 0.98,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 0.98,
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 0.98,
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
    _model = createModel(context, () => ShimmerListOfTablesModel());

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
      width: 1000.0,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final listNumbers = functions.listOfNumbers('8').toList();
          return ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listNumbers.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.0),
            itemBuilder: (context, listNumbersIndex) {
              final listNumbersItem = listNumbers[listNumbersIndex];
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).accent4,
                            FlutterFlowTheme.of(context).lineColor
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 10.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).accent4,
                                    FlutterFlowTheme.of(context).lineColor
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.07, -1.0),
                                  end: AlignmentDirectional(-0.07, 1.0),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                            Container(
                              width: 150.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).accent4,
                                    FlutterFlowTheme.of(context).lineColor
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.07, -1.0),
                                  end: AlignmentDirectional(-0.07, 1.0),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                width: 150.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).accent4,
                                      FlutterFlowTheme.of(context).lineColor
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.07, -1.0),
                                    end: AlignmentDirectional(-0.07, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation4']!),
                            ),
                            Expanded(
                              child: Container(
                                width: 150.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).accent4,
                                      FlutterFlowTheme.of(context).lineColor
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.07, -1.0),
                                    end: AlignmentDirectional(-0.07, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation5']!),
                            ),
                            Expanded(
                              child: Container(
                                width: 150.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).accent4,
                                      FlutterFlowTheme.of(context).lineColor
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.07, -1.0),
                                    end: AlignmentDirectional(-0.07, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation6']!),
                            ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
