import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid_details/shimmer_photo_grid_details_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_rectangle_dark_logo_model.dart';
export 'app_rectangle_dark_logo_model.dart';

class AppRectangleDarkLogoWidget extends StatefulWidget {
  const AppRectangleDarkLogoWidget({
    Key? key,
    int? photoWidth,
    this.photoHeight,
  })  : this.photoWidth = photoWidth ?? 120,
        super(key: key);

  final int photoWidth;
  final int? photoHeight;

  @override
  _AppRectangleDarkLogoWidgetState createState() =>
      _AppRectangleDarkLogoWidgetState();
}

class _AppRectangleDarkLogoWidgetState
    extends State<AppRectangleDarkLogoWidget> {
  late AppRectangleDarkLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppRectangleDarkLogoModel());

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

    return StreamBuilder<List<DwAppRecord>>(
      stream: queryDwAppRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Container(
            width: 100.0,
            child: ShimmerPhotoGridDetailsWidget(),
          );
        }
        List<DwAppRecord> photoGridDwAppRecordList = snapshot.data!;
        final photoGridDwAppRecord = photoGridDwAppRecordList.isNotEmpty
            ? photoGridDwAppRecordList.first
            : null;
        return wrapWithModel(
          model: _model.photoGridModel,
          updateCallback: () => setState(() {}),
          updateOnChange: true,
          child: PhotoGridWidget(
            photoWidth: widget.photoWidth,
            photoHeight: widget.photoHeight,
            photoPath: photoGridDwAppRecord?.appDarkRectangleLogo,
            photoName: 'Logo',
            photoNameFontSize: 15,
          ),
        );
      },
    );
  }
}
