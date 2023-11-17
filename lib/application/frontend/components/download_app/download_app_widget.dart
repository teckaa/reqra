import '/application/components/shimmers/shimmer_button/shimmer_button_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'download_app_model.dart';
export 'download_app_model.dart';

class DownloadAppWidget extends StatefulWidget {
  const DownloadAppWidget({
    Key? key,
    int? widthSize,
  })  : this.widthSize = widthSize ?? 150,
        super(key: key);

  final int widthSize;

  @override
  _DownloadAppWidgetState createState() => _DownloadAppWidgetState();
}

class _DownloadAppWidgetState extends State<DownloadAppWidget> {
  late DownloadAppModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DownloadAppModel());

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

    return StreamBuilder<List<DwAppStoreLinksRecord>>(
      stream: queryDwAppStoreLinksRecord(
        queryBuilder: (dwAppStoreLinksRecord) => dwAppStoreLinksRecord
            .where(
              'app_store_status',
              isEqualTo: true,
            )
            .orderBy('uuid'),
        limit: 3,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return ShimmerButtonWidget();
        }
        List<DwAppStoreLinksRecord> rowDwAppStoreLinksRecordList =
            snapshot.data!;
        return Row(
          mainAxisSize: MainAxisSize.max,
          children:
              List.generate(rowDwAppStoreLinksRecordList.length, (rowIndex) {
            final rowDwAppStoreLinksRecord =
                rowDwAppStoreLinksRecordList[rowIndex];
            return Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).lineColor,
                    width: 1.0,
                  ),
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('DOWNLOAD_APP_COMP_Image_treertcb_ON_TAP');
                    logFirebaseEvent('Image_launch_u_r_l');
                    await launchURL(rowDwAppStoreLinksRecord.appStoreLink);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      getCORSProxyUrl(
                        rowDwAppStoreLinksRecord.appStoreImage,
                      ),
                      width: widget.widthSize.toDouble(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }).divide(SizedBox(width: 20.0)),
        );
      },
    );
  }
}
