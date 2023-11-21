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
import 'shimmer_card2_model.dart';
export 'shimmer_card2_model.dart';

class ShimmerCard2Widget extends StatefulWidget {
  const ShimmerCard2Widget({
    Key? key,
    int? itemNo,
    int? itemSpacing,
    int? itemWidth,
    this.itemHeight,
  })  : this.itemNo = itemNo ?? 1,
        this.itemSpacing = itemSpacing ?? 20,
        this.itemWidth = itemWidth ?? 0,
        super(key: key);

  final int itemNo;
  final int itemSpacing;
  final int itemWidth;
  final int? itemHeight;

  @override
  _ShimmerCard2WidgetState createState() => _ShimmerCard2WidgetState();
}

class _ShimmerCard2WidgetState extends State<ShimmerCard2Widget>
    with TickerProviderStateMixin {
  late ShimmerCard2Model _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => ShimmerCard2Model());

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
              '3',
            ))
            .toList();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(listOfCards.length, (listOfCardsIndex) {
            final listOfCardsItem = listOfCards[listOfCardsIndex];
            return Container(
              width: widget.itemWidth.toDouble(),
              height: widget.itemHeight?.toDouble(),
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
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
          }).divide(SizedBox(height: widget.itemSpacing.toDouble())),
        );
      },
    );
  }
}
