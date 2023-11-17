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
import 'shimmer_photo_grid_model.dart';
export 'shimmer_photo_grid_model.dart';

class ShimmerPhotoGridWidget extends StatefulWidget {
  const ShimmerPhotoGridWidget({
    Key? key,
    int? heightPara,
    int? widthPara,
    int? itemNo,
    int? itemSpacing,
  })  : this.heightPara = heightPara ?? 50,
        this.widthPara = widthPara ?? 50,
        this.itemNo = itemNo ?? 1,
        this.itemSpacing = itemSpacing ?? 10,
        super(key: key);

  final int heightPara;
  final int widthPara;
  final int itemNo;
  final int itemSpacing;

  @override
  _ShimmerPhotoGridWidgetState createState() => _ShimmerPhotoGridWidgetState();
}

class _ShimmerPhotoGridWidgetState extends State<ShimmerPhotoGridWidget>
    with TickerProviderStateMixin {
  late ShimmerPhotoGridModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => ShimmerPhotoGridModel());

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
        final itemNo =
            functions.listOfNumbers(widget.itemNo.toString()).toList();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(itemNo.length, (itemNoIndex) {
            final itemNoItem = itemNo[itemNoIndex];
            return Container(
              width: widget.widthPara.toDouble(),
              height: widget.widthPara.toDouble(),
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
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
          }).divide(SizedBox(width: widget.itemSpacing.toDouble())),
        );
      },
    );
  }
}
