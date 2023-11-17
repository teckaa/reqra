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
import 'shimmer_button_model.dart';
export 'shimmer_button_model.dart';

class ShimmerButtonWidget extends StatefulWidget {
  const ShimmerButtonWidget({
    Key? key,
    int? buttonWidth,
    int? buttonHeight,
    int? numberOfButton,
  })  : this.buttonWidth = buttonWidth ?? 100,
        this.buttonHeight = buttonHeight ?? 40,
        this.numberOfButton = numberOfButton ?? 1,
        super(key: key);

  final int buttonWidth;
  final int buttonHeight;
  final int numberOfButton;

  @override
  _ShimmerButtonWidgetState createState() => _ShimmerButtonWidgetState();
}

class _ShimmerButtonWidgetState extends State<ShimmerButtonWidget>
    with TickerProviderStateMixin {
  late ShimmerButtonModel _model;

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
    _model = createModel(context, () => ShimmerButtonModel());

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
        final listOfButtons =
            functions.listOfNumbers(widget.numberOfButton.toString()).toList();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(listOfButtons.length, (listOfButtonsIndex) {
            final listOfButtonsItem = listOfButtons[listOfButtonsIndex];
            return Container(
              width: widget.buttonWidth.toDouble(),
              height: widget.buttonHeight.toDouble(),
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
          }).divide(SizedBox(width: 15.0)),
        );
      },
    );
  }
}
