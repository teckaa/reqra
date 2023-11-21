import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_grid_cover_model.dart';
export 'photo_grid_cover_model.dart';

class PhotoGridCoverWidget extends StatefulWidget {
  const PhotoGridCoverWidget({
    Key? key,
    this.photoWidth,
    this.photoHeight,
    this.photoPath,
    this.photoName,
    int? photoNameFontSize,
    this.bgColor,
  })  : this.photoNameFontSize = photoNameFontSize ?? 18,
        super(key: key);

  final int? photoWidth;
  final int? photoHeight;
  final String? photoPath;
  final String? photoName;
  final int photoNameFontSize;
  final Color? bgColor;

  @override
  _PhotoGridCoverWidgetState createState() => _PhotoGridCoverWidgetState();
}

class _PhotoGridCoverWidgetState extends State<PhotoGridCoverWidget> {
  late PhotoGridCoverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoGridCoverModel());

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
      width: widget.photoWidth?.toDouble(),
      height: widget.photoHeight?.toDouble(),
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.bgColor,
          FlutterFlowTheme.of(context).primaryText,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              if (widget.photoPath != null && widget.photoPath != '') {
                return Image.network(
                  getCORSProxyUrl(
                    valueOrDefault<String>(
                      widget.photoPath,
                      'https://dummyimage.com/100x4:4/',
                    ),
                  ),
                  width: widget.photoWidth?.toDouble(),
                  height: valueOrDefault<double>(
                    widget.photoHeight?.toDouble(),
                    40.0,
                  ),
                  fit: BoxFit.cover,
                );
              } else {
                return Container(
                  width: widget.photoWidth?.toDouble(),
                  height: valueOrDefault<double>(
                    widget.photoHeight?.toDouble(),
                    80.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          widget.photoName!,
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: widget.photoNameFontSize.toDouble(),
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
    );
  }
}
