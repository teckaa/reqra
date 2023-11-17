import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_square_logo_model.dart';
export 'app_square_logo_model.dart';

class AppSquareLogoWidget extends StatefulWidget {
  const AppSquareLogoWidget({Key? key}) : super(key: key);

  @override
  _AppSquareLogoWidgetState createState() => _AppSquareLogoWidgetState();
}

class _AppSquareLogoWidgetState extends State<AppSquareLogoWidget> {
  late AppSquareLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppSquareLogoModel());

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

    return wrapWithModel(
      model: _model.photoGridModel,
      updateCallback: () => setState(() {}),
      updateOnChange: true,
      child: PhotoGridWidget(
        photoWidth: 60,
        photoHeight: 60,
        photoName: 'Logo',
        photoNameFontSize: 14,
      ),
    );
  }
}
