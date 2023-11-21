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
import 'shimmer_list_of_lists_model.dart';
export 'shimmer_list_of_lists_model.dart';

class ShimmerListOfListsWidget extends StatefulWidget {
  const ShimmerListOfListsWidget({Key? key}) : super(key: key);

  @override
  _ShimmerListOfListsWidgetState createState() =>
      _ShimmerListOfListsWidgetState();
}

class _ShimmerListOfListsWidgetState extends State<ShimmerListOfListsWidget>
    with TickerProviderStateMixin {
  late ShimmerListOfListsModel _model;

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
    _model = createModel(context, () => ShimmerListOfListsModel());

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
      width: 500.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Builder(
        builder: (context) {
          final listNumbers = functions.listOfNumbers('5').toList();
          return ListView.separated(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listNumbers.length,
            separatorBuilder: (_, __) => SizedBox(height: 25.0),
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
                      width: 35.0,
                      height: 35.0,
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
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation3']!),
                        ].divide(SizedBox(height: 15.0)),
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
