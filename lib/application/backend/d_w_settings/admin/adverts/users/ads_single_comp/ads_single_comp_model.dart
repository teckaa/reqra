import '/application/components/shimmers/shimmer_card2/shimmer_card2_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ads_single_comp_widget.dart' show AdsSingleCompWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdsSingleCompModel extends FlutterFlowModel<AdsSingleCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
