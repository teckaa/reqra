import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ads_carousel_comp_model.dart';
export 'ads_carousel_comp_model.dart';

class AdsCarouselCompWidget extends StatefulWidget {
  const AdsCarouselCompWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _AdsCarouselCompWidgetState createState() => _AdsCarouselCompWidgetState();
}

class _AdsCarouselCompWidgetState extends State<AdsCarouselCompWidget> {
  late AdsCarouselCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdsCarouselCompModel());

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

    return StreamBuilder<DwAppAdsRecord>(
      stream: DwAppAdsRecord.getDocument(widget.recordRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return ShimmerCard2Widget(
            itemNo: 1,
            itemSpacing: 2,
            itemHeight: 100,
          );
        }
        final columnDwAppAdsRecord = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) {
                final listOfDesign = columnDwAppAdsRecord.adsBanner.toList();
                return Container(
                  width: double.infinity,
                  height: 100.0,
                  child: CarouselSlider.builder(
                    itemCount: listOfDesign.length,
                    itemBuilder: (context, listOfDesignIndex, _) {
                      final listOfDesignItem = listOfDesign[listOfDesignIndex];
                      return Stack(
                        children: [
                          if (columnDwAppAdsRecord.adsType == 'ImageBase')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ADS_CAROUSEL_Image_4hknneuw_ON_TAP');
                                logFirebaseEvent('Image_launch_u_r_l');
                                await launchURL(
                                    listOfDesignItem.adsExternalLocation);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  getCORSProxyUrl(
                                    listOfDesignItem.adsImage,
                                  ),
                                  width: double.infinity,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (columnDwAppAdsRecord.adsType == 'TextBase')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ADS_CAROUSEL_Container_l9rlykot_ON_TAP');
                                logFirebaseEvent('Container_launch_u_r_l');
                                await launchURL(
                                    listOfDesignItem.adsExternalLocation);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    listOfDesignItem.adsBgColor,
                                    FlutterFlowTheme.of(context).black,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    listOfDesignItem.adsText,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: valueOrDefault<Color>(
                                            listOfDesignItem.adsTextColor,
                                            FlutterFlowTheme.of(context).white,
                                          ),
                                          fontSize: listOfDesignItem.adsTextSize
                                              .toDouble(),
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                    carouselController: _model.carouselController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: min(1, listOfDesign.length - 1),
                      viewportFraction: 1.0,
                      disableCenter: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: valueOrDefault<bool>(
                        columnDwAppAdsRecord.adsAutoplayStatus,
                        false,
                      ),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayInterval: Duration(
                          milliseconds: (800 +
                              valueOrDefault<int>(
                                columnDwAppAdsRecord.adsAnimationDelay,
                                4000,
                              ))),
                      autoPlayCurve: Curves.linear,
                      pauseAutoPlayInFiniteScroll: true,
                      onPageChanged: (index, _) =>
                          _model.carouselCurrentIndex = index,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
