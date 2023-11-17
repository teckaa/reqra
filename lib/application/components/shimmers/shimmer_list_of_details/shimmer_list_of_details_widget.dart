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
import 'shimmer_list_of_details_model.dart';
export 'shimmer_list_of_details_model.dart';

class ShimmerListOfDetailsWidget extends StatefulWidget {
  const ShimmerListOfDetailsWidget({Key? key}) : super(key: key);

  @override
  _ShimmerListOfDetailsWidgetState createState() =>
      _ShimmerListOfDetailsWidgetState();
}

class _ShimmerListOfDetailsWidgetState extends State<ShimmerListOfDetailsWidget>
    with TickerProviderStateMixin {
  late ShimmerListOfDetailsModel _model;

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
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerListOfDetailsModel());

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
      width: 400.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              final listItems = functions.listOfNumbers('10').toList();
              return ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 20.0),
                itemBuilder: (context, listItemsIndex) {
                  final listItemsItem = listItems[listItemsIndex];
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100.0,
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
                          animationsMap['containerOnPageLoadAnimation1']!),
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
