import '/application/backend/d_w_settings/admin/adverts/users/ads_single_comp/ads_single_comp_widget.dart';
import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_ads_model.dart';
export 'list_of_ads_model.dart';

class ListOfAdsWidget extends StatefulWidget {
  const ListOfAdsWidget({
    Key? key,
    bool? adsStatus,
    String? adsPosition,
    String? adsPages,
  })  : this.adsStatus = adsStatus ?? false,
        this.adsPosition = adsPosition ?? 'Bottom',
        this.adsPages = adsPages ?? 'Dashboard',
        super(key: key);

  final bool adsStatus;
  final String adsPosition;
  final String adsPages;

  @override
  _ListOfAdsWidgetState createState() => _ListOfAdsWidgetState();
}

class _ListOfAdsWidgetState extends State<ListOfAdsWidget> {
  late ListOfAdsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfAdsModel());

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

    return StreamBuilder<List<DwAppAdsRecord>>(
      stream: queryDwAppAdsRecord(
        queryBuilder: (dwAppAdsRecord) => dwAppAdsRecord
            .where(
              'ads_status',
              isEqualTo: widget.adsStatus,
            )
            .where(
              'ads_position',
              isEqualTo: widget.adsPosition,
            )
            .where(
              'ads_page',
              arrayContains: widget.adsPages,
            )
            .orderBy('created_at', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return ShimmerCard2Widget(
            itemNo: 2,
            itemSpacing: 2,
            itemHeight: 100,
          );
        }
        List<DwAppAdsRecord> listViewDwAppAdsRecordList = snapshot.data!;
        return ListView.separated(
          padding: EdgeInsets.symmetric(
              vertical: listViewDwAppAdsRecordList.length == 0 ? 0.0 : 20.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewDwAppAdsRecordList.length,
          separatorBuilder: (_, __) => SizedBox(
              height: listViewDwAppAdsRecordList.length == 0 ? 0.0 : 20.0),
          itemBuilder: (context, listViewIndex) {
            final listViewDwAppAdsRecord =
                listViewDwAppAdsRecordList[listViewIndex];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    AdsSingleCompWidget(
                      key: Key(
                          'Keyrzh_${listViewIndex}_of_${listViewDwAppAdsRecordList.length}'),
                      recordRef: listViewDwAppAdsRecord.reference,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
