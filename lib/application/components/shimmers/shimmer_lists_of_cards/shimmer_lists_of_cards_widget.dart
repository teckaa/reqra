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
import 'shimmer_lists_of_cards_model.dart';
export 'shimmer_lists_of_cards_model.dart';

class ShimmerListsOfCardsWidget extends StatefulWidget {
  const ShimmerListsOfCardsWidget({
    Key? key,
    int? itemNo,
    int? itemSpacing,
    int? itemWidth,
    int? itemHeight,
  })  : this.itemNo = itemNo ?? 2,
        this.itemSpacing = itemSpacing ?? 20,
        this.itemWidth = itemWidth ?? 300,
        this.itemHeight = itemHeight ?? 150,
        super(key: key);

  final int itemNo;
  final int itemSpacing;
  final int itemWidth;
  final int itemHeight;

  @override
  _ShimmerListsOfCardsWidgetState createState() =>
      _ShimmerListsOfCardsWidgetState();
}

class _ShimmerListsOfCardsWidgetState extends State<ShimmerListsOfCardsWidget>
    with TickerProviderStateMixin {
  late ShimmerListsOfCardsModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    _model = createModel(context, () => ShimmerListsOfCardsModel());

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

    return Builder(
      builder: (context) {
        final listOfCards = functions
            .listOfNumbers(valueOrDefault<String>(
              widget.itemNo.toString(),
              '2',
            ))
            .toList();
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(listOfCards.length, (listOfCardsIndex) {
            final listOfCardsItem = listOfCards[listOfCardsIndex];
            return Expanded(
              child: Container(
                width: widget.itemWidth.toDouble(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.0,
                      height: 15.0,
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
                    Container(
                      width: double.infinity,
                      height: widget.itemHeight.toDouble(),
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
                        animationsMap['containerOnPageLoadAnimation4']!),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
            );
          }).divide(SizedBox(width: widget.itemSpacing.toDouble())),
        );
      },
    );
  }
}
