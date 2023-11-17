import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_column_with_details_model.dart';
export 'photo_column_with_details_model.dart';

class PhotoColumnWithDetailsWidget extends StatefulWidget {
  const PhotoColumnWithDetailsWidget({
    Key? key,
    String? photoPathPara,
    this.titlePara,
    this.descPara,
    this.bgColor,
    this.widthPara,
    this.heightPara,
    int? titleSizePara,
    int? descSizePara,
  })  : this.photoPathPara = photoPathPara ?? 'https://dummyimage.com/200x4:4/',
        this.titleSizePara = titleSizePara ?? 14,
        this.descSizePara = descSizePara ?? 12,
        super(key: key);

  final String photoPathPara;
  final String? titlePara;
  final String? descPara;
  final Color? bgColor;
  final int? widthPara;
  final int? heightPara;
  final int titleSizePara;
  final int descSizePara;

  @override
  _PhotoColumnWithDetailsWidgetState createState() =>
      _PhotoColumnWithDetailsWidgetState();
}

class _PhotoColumnWithDetailsWidgetState
    extends State<PhotoColumnWithDetailsWidget> {
  late PhotoColumnWithDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoColumnWithDetailsModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
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
                          widget.widthPara?.toDouble(),
                          50.0,
                        ),
                        height: valueOrDefault<double>(
                          widget.heightPara?.toDouble(),
                          50.0,
                        ),
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return Container(
                      width: valueOrDefault<double>(
                        widget.widthPara?.toDouble(),
                        50.0,
                      ),
                      height: valueOrDefault<double>(
                        widget.widthPara?.toDouble(),
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
                                    fontFamily: FlutterFlowTheme.of(context)
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.titlePara!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                      fontSize: widget.titleSizePara.toDouble(),
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleLargeFamily),
                    ),
              ),
              Text(
                widget.descPara!,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: widget.descSizePara.toDouble(),
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ].divide(SizedBox(height: 3.0)),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
