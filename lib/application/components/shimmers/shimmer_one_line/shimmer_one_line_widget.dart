import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shimmer_one_line_model.dart';
export 'shimmer_one_line_model.dart';

class ShimmerOneLineWidget extends StatefulWidget {
  const ShimmerOneLineWidget({
    Key? key,
    int? itemWidth,
    int? itemHeight,
  })  : this.itemWidth = itemWidth ?? 200,
        this.itemHeight = itemHeight ?? 15,
        super(key: key);

  final int itemWidth;
  final int itemHeight;

  @override
  _ShimmerOneLineWidgetState createState() => _ShimmerOneLineWidgetState();
}

class _ShimmerOneLineWidgetState extends State<ShimmerOneLineWidget>
    with TickerProviderStateMixin {
  late ShimmerOneLineModel _model;

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
    _model = createModel(context, () => ShimmerOneLineModel());

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
      width: widget.itemWidth.toDouble(),
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
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
