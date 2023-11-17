import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shimmer_card_model.dart';
export 'shimmer_card_model.dart';

class ShimmerCardWidget extends StatefulWidget {
  const ShimmerCardWidget({
    Key? key,
    this.heightPara,
  }) : super(key: key);

  final int? heightPara;

  @override
  _ShimmerCardWidgetState createState() => _ShimmerCardWidgetState();
}

class _ShimmerCardWidgetState extends State<ShimmerCardWidget>
    with TickerProviderStateMixin {
  late ShimmerCardModel _model;

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
    _model = createModel(context, () => ShimmerCardModel());

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
        decoration: BoxDecoration(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
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
                width: MediaQuery.sizeOf(context).width * 0.25,
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
                width: MediaQuery.sizeOf(context).width * 0.8,
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
                height: widget.heightPara?.toDouble(),
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
      ),
    );
  }
}
