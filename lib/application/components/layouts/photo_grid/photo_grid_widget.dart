import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_grid_model.dart';
export 'photo_grid_model.dart';

class PhotoGridWidget extends StatefulWidget {
  const PhotoGridWidget({
    Key? key,
    int? photoWidth,
    int? photoHeight,
    this.photoPath,
    this.photoName,
    int? photoNameFontSize,
    this.bgColor,
  })  : this.photoWidth = photoWidth ?? 35,
        this.photoHeight = photoHeight ?? 35,
        this.photoNameFontSize = photoNameFontSize ?? 18,
        super(key: key);

  final int photoWidth;
  final int photoHeight;
  final String? photoPath;
  final String? photoName;
  final int photoNameFontSize;
  final Color? bgColor;

  @override
  _PhotoGridWidgetState createState() => _PhotoGridWidgetState();
}

class _PhotoGridWidgetState extends State<PhotoGridWidget> {
  late PhotoGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoGridModel());

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
      width: widget.photoWidth.toDouble(),
      height: widget.photoHeight.toDouble(),
      decoration: BoxDecoration(
        color: widget.bgColor,
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
                  width: valueOrDefault<double>(
                    widget.photoWidth.toDouble(),
                    40.0,
                  ),
                  height: valueOrDefault<double>(
                    widget.photoHeight.toDouble(),
                    40.0,
                  ),
                  fit: BoxFit.contain,
                );
              } else {
                return Container(
                  width: valueOrDefault<double>(
                    widget.photoWidth.toDouble(),
                    35.0,
                  ),
                  height: valueOrDefault<double>(
                    widget.photoHeight.toDouble(),
                    35.0,
                  ),
                  decoration: BoxDecoration(
                    color: widget.bgColor,
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.photoName!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: widget.photoNameFontSize.toDouble(),
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
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
