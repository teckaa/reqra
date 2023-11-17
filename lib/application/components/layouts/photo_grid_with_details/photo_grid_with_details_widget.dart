import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_grid_with_details_model.dart';
export 'photo_grid_with_details_model.dart';

class PhotoGridWithDetailsWidget extends StatefulWidget {
  const PhotoGridWithDetailsWidget({
    Key? key,
    String? photoPathPara,
    String? titlePara,
    this.descPara,
    this.bgColor,
    int? widthPara,
    int? heightPara,
    int? titleSizePara,
    int? descSizePara,
  })  : this.photoPathPara = photoPathPara ?? 'https://dummyimage.com/200x4:4/',
        this.titlePara = titlePara ?? 'Title here',
        this.widthPara = widthPara ?? 50,
        this.heightPara = heightPara ?? 50,
        this.titleSizePara = titleSizePara ?? 14,
        this.descSizePara = descSizePara ?? 12,
        super(key: key);

  final String photoPathPara;
  final String titlePara;
  final String? descPara;
  final Color? bgColor;
  final int widthPara;
  final int heightPara;
  final int titleSizePara;
  final int descSizePara;

  @override
  _PhotoGridWithDetailsWidgetState createState() =>
      _PhotoGridWithDetailsWidgetState();
}

class _PhotoGridWithDetailsWidgetState
    extends State<PhotoGridWithDetailsWidget> {
  late PhotoGridWithDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoGridWithDetailsModel());

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
      decoration: BoxDecoration(
        color: widget.bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.photoPathPara != null &&
                              widget.photoPathPara != '') {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.network(
                                getCORSProxyUrl(
                                  widget.photoPathPara,
                                ),
                                width: valueOrDefault<double>(
                                  widget.widthPara.toDouble(),
                                  50.0,
                                ),
                                height: valueOrDefault<double>(
                                  widget.heightPara.toDouble(),
                                  50.0,
                                ),
                                fit: BoxFit.cover,
                              ),
                            );
                          } else {
                            return Container(
                              width: valueOrDefault<double>(
                                widget.widthPara.toDouble(),
                                50.0,
                              ),
                              height: valueOrDefault<double>(
                                widget.widthPara.toDouble(),
                                50.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.getFirstLetterOfString(
                                            valueOrDefault<String>(
                                          widget.titlePara,
                                          'A',
                                        )),
                                        'A',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titlePara,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: widget.titleSizePara.toDouble(),
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                      if (widget.descPara != null && widget.descPara != '')
                        Text(
                          widget.descPara!,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                fontSize: widget.descSizePara.toDouble(),
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                    ].divide(SizedBox(height: 3.0)),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
