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
import 'shimmer_blog_model.dart';
export 'shimmer_blog_model.dart';

class ShimmerBlogWidget extends StatefulWidget {
  const ShimmerBlogWidget({
    Key? key,
    this.heightPara,
    int? squareBoxWidth,
    int? squareBoxHeight,
    this.numOfList,
    int? itemSpaceSize,
  })  : this.squareBoxWidth = squareBoxWidth ?? 100,
        this.squareBoxHeight = squareBoxHeight ?? 100,
        this.itemSpaceSize = itemSpaceSize ?? 10,
        super(key: key);

  final int? heightPara;
  final int squareBoxWidth;
  final int squareBoxHeight;
  final int? numOfList;
  final int itemSpaceSize;

  @override
  _ShimmerBlogWidgetState createState() => _ShimmerBlogWidgetState();
}

class _ShimmerBlogWidgetState extends State<ShimmerBlogWidget>
    with TickerProviderStateMixin {
  late ShimmerBlogModel _model;

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
    _model = createModel(context, () => ShimmerBlogModel());

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
        final numberOfItems =
            functions.listOfNumbers(widget.numOfList?.toString()).toList();
        return ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: numberOfItems.length,
          separatorBuilder: (_, __) =>
              SizedBox(height: widget.itemSpaceSize.toDouble()),
          itemBuilder: (context, numberOfItemsIndex) {
            final numberOfItemsItem = numberOfItems[numberOfItemsIndex];
            return Container(
              width: 700.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
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
                          width: double.infinity,
                          height: 100.0,
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
                  Container(
                    width: widget.squareBoxWidth.toDouble(),
                    height: widget.squareBoxHeight.toDouble(),
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
                ].divide(SizedBox(width: 25.0)),
              ),
            );
          },
        );
      },
    );
  }
}
